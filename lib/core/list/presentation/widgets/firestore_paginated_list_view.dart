import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';

/// Returns either a ListView (if useSlivers=false) or a Sliver (if useSlivers=true)
/// with the result of the provided Firestore [query].
class FirestorePaginatedListView<T> extends StatelessWidget {
  const FirestorePaginatedListView({
    super.key,
    required this.query,
    required this.loadingWidget,
    required this.errorWidget,
    required this.noResultsWidget,
    this.filter,
    this.itemBuilder,
    this.separatorBuilder,
    this.pageSize = 15,
    this.scrollDirection = Axis.vertical,
    this.padding,
    this.physics,
    this.shrinkWrap = true,
    this.useSlivers = false,
    this.firstItemBuilder,
  });

  /// Query to fetch List data.
  final Query<T> query;

  /// Callback to filter the results from [query].
  final List<T> Function(List<T> items)? filter;

  /// Callback to build each item. If null, item will show a TextBox with error.
  final Widget? Function(T data)? itemBuilder;

  /// Callback to build each separator. If null, separator will be a SizedBox.shrink().
  final Widget Function(BuildContext context, int index)? separatorBuilder;

  /// Widget that will be displayed while fetching data.
  final Widget loadingWidget;

  /// Widget that will be displayed if an error occurs.
  final Widget errorWidget;

  /// Widget that will be displayed if no results are found.
  final Widget noResultsWidget;

  /// Page Size for Firestore pagination.
  final int pageSize;

  /// Scroll direction.
  final Axis scrollDirection;

  /// Scroll physics for the ListView.
  final ScrollPhysics? physics;

  /// shrinkWrap for the ListView.
  final bool shrinkWrap;

  /// Padding.
  final EdgeInsetsGeometry? padding;

  /// If true, the widget will use Slivers (SliverList) instead of ListView.
  final bool useSlivers;

  /// If provided, this builder is called to build a widget as the very first item.
  final WidgetBuilder? firstItemBuilder;

  @override
  Widget build(BuildContext context) {
    return FirestoreQueryBuilder(
      query: query,
      pageSize: pageSize,
      builder: (context, snapshot, _) {
        // --- SLIVER MODE ---
        if (useSlivers) {
          if (snapshot.isFetching && snapshot.docs.isEmpty) {
            return SliverToBoxAdapter(child: loadingWidget);
          }

          if (snapshot.hasError && snapshot.docs.isEmpty) {
            return SliverToBoxAdapter(child: errorWidget);
          }

          if (snapshot.docs.isEmpty) {
            // Even if no documents, still show firstItem if provided
            if (firstItemBuilder != null) {
              return SliverList(
                delegate: SliverChildListDelegate([
                  firstItemBuilder!(context),
                  SliverToBoxAdapter(child: noResultsWidget),
                ]),
              );
            }
            return SliverToBoxAdapter(child: noResultsWidget);
          }

          final unfiltered = snapshot.docs.map((e) => e.data()).toList();
          final items = filter != null ? filter!(unfiltered) : unfiltered;

          // If no separators configured
          if (separatorBuilder == null) {
            // total count includes firstItem if present
            final totalCount = items.length + (firstItemBuilder != null ? 1 : 0);
            final sliverList = SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  // If index 0 and firstItemBuilder exists, render that
                  if (firstItemBuilder != null && index == 0) {
                    return firstItemBuilder!(context);
                  }
                  // Otherwise calculate data index
                  final dataIndex = firstItemBuilder != null ? index - 1 : index;
                  if (snapshot.hasMore && dataIndex + 1 == snapshot.docs.length) {
                    snapshot.fetchMore();
                  }
                  final item = items[dataIndex];
                  if (itemBuilder == null) {
                    return Container(
                      color: Colors.red[100],
                      child: Text(
                        'Error: no itemBuilder provided for $item',
                        style: Theme.of(context).textTheme.bodySmall,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    );
                  }
                  return itemBuilder!(item);
                },
                childCount: totalCount,
              ),
            );
            return padding != null ? SliverPadding(padding: padding!, sliver: sliverList) : sliverList;
          }

          // With separators, we double slots (items + separators) plus firstItem if present
          final itemCountWithSeparators = items.length * 2 - 1;
          final totalSlots = itemCountWithSeparators + (firstItemBuilder != null ? 1 : 0);
          final sliverWithSeps = SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                // If firstItem exists and index is 0
                if (firstItemBuilder != null && index == 0) {
                  return firstItemBuilder!(context);
                }
                // Adjust index into separator scheme
                final adjustedIndex = firstItemBuilder != null ? index - 1 : index;
                if (adjustedIndex.isEven) {
                  final itemIndex = adjustedIndex ~/ 2;
                  if (snapshot.hasMore && itemIndex + 1 == snapshot.docs.length) {
                    snapshot.fetchMore();
                  }
                  return itemBuilder!(items[itemIndex]);
                } else {
                  final sepIndex = adjustedIndex ~/ 2;
                  return separatorBuilder!(context, sepIndex);
                }
              },
              childCount: totalSlots,
            ),
          );
          return padding != null ? SliverPadding(padding: padding!, sliver: sliverWithSeps) : sliverWithSeps;
        }

        // --- LISTVIEW MODE ---
        if (snapshot.isFetching && snapshot.docs.isEmpty) return loadingWidget;
        if (snapshot.hasError && snapshot.docs.isEmpty) return errorWidget;
        if (snapshot.docs.isEmpty) {
          // Even if no documents, still show firstItem if provided
          if (firstItemBuilder != null) {
            return ListView(
              physics: physics,
              shrinkWrap: shrinkWrap,
              scrollDirection: scrollDirection,
              padding: padding,
              children: [
                firstItemBuilder!(context),
                noResultsWidget,
              ],
            );
          }
          return noResultsWidget;
        }

        final unfiltered = snapshot.docs.map((e) => e.data()).toList();
        final items = filter != null ? filter!(unfiltered) : unfiltered;

        // Total count includes firstItem if provided
        final totalCount = items.length + (firstItemBuilder != null ? 1 : 0);

        return ListView.separated(
          physics: physics,
          shrinkWrap: shrinkWrap,
          scrollDirection: scrollDirection,
          padding: padding,
          itemCount: totalCount,
          itemBuilder: (context, index) {
            // If firstItem exists and index == 0
            if (firstItemBuilder != null && index == 0) {
              return firstItemBuilder!(context);
            }
            // Map index to data index
            final dataIndex = firstItemBuilder != null ? index - 1 : index;
            if (snapshot.hasMore && dataIndex + 1 == snapshot.docs.length) {
              snapshot.fetchMore();
            }
            final item = items[dataIndex];
            if (itemBuilder == null) {
              return Container(
                color: Colors.red[100],
                child: Text(
                  'Error: no itemBuilder provided for $item',
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              );
            }
            return itemBuilder!(item);
          },
          separatorBuilder: (context, index) {
            // No separator before firstItem; adjust index for separators
            if (firstItemBuilder != null) {
              if (index == 0) return const SizedBox.shrink();
              final sepIndex = index - 1;
              return separatorBuilder != null ? separatorBuilder!(context, sepIndex) : const SizedBox.shrink();
            }
            return separatorBuilder != null ? separatorBuilder!(context, index) : const SizedBox.shrink();
          },
        );
      },
    );
  }
}
