// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
// import 'package:flutter/material.dart';

// /// Returns either a ListView (if useSlivers=false) or a Sliver (if useSlivers=true)
// /// with the result of the provided Firestore [query].
// class FirestorePaginatedListView<T> extends StatelessWidget {
//   const FirestorePaginatedListView({
//     super.key,
//     required this.query,
//     this.filter,
//     this.itemBuilder,
//     this.separatorBuilder,
//     this.loadingWidget = const LoadingDisplay(),
//     this.errorWidget = const ErrorDisplay(),
//     this.noResultsWidget = const NoResultsDisplay(),
//     this.pageSize = 15,
//     this.scrollDirection = Axis.vertical,
//     this.padding,
//     this.physics,
//     this.shrinkWrap = true,
//     this.useSlivers = false,
//   });

//   /// Query to fetch List data.
//   final Query<T> query;

//   /// Callback to filter the results from [query].
//   final List<T> Function(List<T> items)? filter;

//   /// Callback to build each item. If null, item will show a TextBox with error.
//   final Widget? Function(T data)? itemBuilder;

//   /// Callback to build each separator. If null, separator will be a SizedBox.shrink().
//   final Widget Function(BuildContext context, int index)? separatorBuilder;

//   /// Widget that will be displayed while fetching data.
//   final Widget loadingWidget;

//   /// Widget that will be displayed if an error occurs.
//   final Widget errorWidget;

//   /// Widget that will be displayed if no results are found.
//   final Widget noResultsWidget;

//   // Page Size for Firestore pagination.
//   final int pageSize;

//   /// Scroll direction.
//   final Axis scrollDirection;

//   /// Scroll physics for the ListView.
//   final ScrollPhysics? physics;

//   /// shrinkWrap for the ListView.
//   final bool shrinkWrap;

//   /// Padding.
//   final EdgeInsetsGeometry? padding;

//   /// If true, the widget will use Slivers (SliverList) instead of ListView.
//   final bool useSlivers;

//   @override
//   Widget build(BuildContext context) {
//     return FirestoreQueryBuilder(
//       query: query,
//       pageSize: pageSize,
//       builder: (context, snapshot, _) {
//         // --- SLIVER MODE ---
//         if (useSlivers) {
//           if (snapshot.isFetching) {
//             return SliverToBoxAdapter(child: loadingWidget);
//           }

//           if (snapshot.hasError) {
//             return SliverToBoxAdapter(child: errorWidget);
//           }

//           if (snapshot.docs.isEmpty) {
//             return SliverToBoxAdapter(child: noResultsWidget);
//           }

//           final unfiltered = snapshot.docs.map((e) => e.data()).toList();
//           final items = filter != null ? filter!(unfiltered) : unfiltered;

//           // Sin separadores
//           if (separatorBuilder == null) {
//             final sliverList = SliverList(
//               delegate: SliverChildBuilderDelegate(
//                 (context, index) {
//                   if (snapshot.hasMore && index + 1 == snapshot.docs.length) {
//                     snapshot.fetchMore();
//                   }
//                   final item = items[index];
//                   if (itemBuilder == null) {
//                     return Container(
//                       color: Colors.red[100],
//                       child: Text(
//                         'Error: no itemBuilder provided for $item',
//                         style: Theme.of(context).textTheme.bodySmall,
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 3,
//                       ),
//                     );
//                   }
//                   return itemBuilder!(item);
//                 },
//                 childCount: items.length,
//               ),
//             );
//             return padding != null ? SliverPadding(padding: padding!, sliver: sliverList) : sliverList;
//           }

//           final totalCount = items.length * 2 - 1;
//           final sliverWithSeps = SliverList(
//             delegate: SliverChildBuilderDelegate(
//               (context, index) {
//                 if (index.isEven) {
//                   final itemIndex = index ~/ 2;
//                   if (snapshot.hasMore && itemIndex + 1 == snapshot.docs.length) {
//                     snapshot.fetchMore();
//                   }
//                   return itemBuilder!(items[itemIndex]);
//                 } else {
//                   final sepIndex = index ~/ 2;
//                   return separatorBuilder!(context, sepIndex);
//                 }
//               },
//               childCount: totalCount,
//             ),
//           );
//           return padding != null ? SliverPadding(padding: padding!, sliver: sliverWithSeps) : sliverWithSeps;
//         }

//         // --- LISTVIEW MODE ---
//         if (snapshot.isFetching) return loadingWidget;
//         if (snapshot.hasError) return errorWidget;
//         if (snapshot.docs.isEmpty) return noResultsWidget;

//         final unfiltered = snapshot.docs.map((e) => e.data()).toList();
//         final items = filter != null ? filter!(unfiltered) : unfiltered;

//         return ListView.separated(
//           physics: physics,
//           shrinkWrap: shrinkWrap,
//           scrollDirection: scrollDirection,
//           padding: padding,
//           itemCount: items.length,
//           itemBuilder: (context, index) {
//             if (snapshot.hasMore && index + 1 == snapshot.docs.length) {
//               snapshot.fetchMore();
//             }
//             final item = items[index];
//             if (itemBuilder == null) {
//               return Container(
//                 color: Colors.red[100],
//                 child: Text(
//                   'Error: no itemBuilder provided for $item',
//                   style: Theme.of(context).textTheme.bodySmall,
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 3,
//                 ),
//               );
//             }
//             return itemBuilder!(item);
//           },
//           separatorBuilder: separatorBuilder ?? (context, index) => const SizedBox.shrink(),
//         );
//       },
//     );
//   }
// }
