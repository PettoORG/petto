// import 'dart:async';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
// import 'package:flutter/material.dart';

// /// A highly customizable card-swiper widget for horizontal paging of Firestore
// /// documents. All visual styling must now be supplied by the caller; this file
// /// no longer injects any default card container.
// ///
// /// If [extraItem] is provided, it is rendered exactly as given (similar to
// /// [noResultsWidget]), with no internal decoration.
// ///
// /// Generic parameter [T] is the document model returned by the Firestore query.
// class FirestorePaginatedPageView<T> extends StatefulWidget {
//   const FirestorePaginatedPageView({
//     super.key,
//     required this.query,
//     this.filter,
//     this.itemBuilder,
//     this.loadingWidget = const LoadingDisplay(),
//     this.errorWidget = const ErrorDisplay(),
//     this.noResultsWidget = const NoResultsDisplay(),
//     this.pageSize = 15,
//     this.viewportFraction = .8,
//     this.autoAdvance = false,
//     this.autoAdvanceInterval = const Duration(seconds: 4),
//     this.autoAdvanceAnimationDuration = const Duration(milliseconds: 500),
//     this.autoAdvanceCurve = Curves.easeInOut,
//     this.loop = false,
//     this.onTap,
//     this.onPageChanged,
//     this.opacityAnimationDuration = const Duration(seconds: 1),
//     this.opacityAnimationCurve = Curves.easeInOut,
//     this.maxScale = 1,
//     this.minScale = 0.8,
//     this.height,
//     this.extraItem,
//     this.extraItemOnTap,
//     this.hideExtraItemThreshold,
//     this.applyOpacity = true,
//   }) : assert(maxScale <= 1, 'maxScale must be less than or equal to 1');

//   /// Query to fetch data from Firestore.
//   final Query<T> query;

//   /// Optional filter applied to the Firestore results.
//   final List<T> Function(List<T>)? filter;

//   /// Builder for each Firestore document.
//   final Widget? Function(T data, int index)? itemBuilder;

//   /// Widget shown while fetching data.
//   final Widget loadingWidget;

//   /// Widget shown when an error is thrown.
//   final Widget errorWidget;

//   /// Widget shown when query returns no documents.
//   final Widget noResultsWidget;

//   /// Firestore pagination size.
//   final int pageSize;

//   /// Fraction of the viewport occupied by each page.
//   final double viewportFraction;

//   /// Enables automatic paging.
//   final bool autoAdvance;

//   /// Delay between automatic page changes.
//   final Duration autoAdvanceInterval;

//   /// Duration of the auto-advance animation.
//   final Duration autoAdvanceAnimationDuration;

//   /// Curve of the auto-advance animation.
//   final Curve autoAdvanceCurve;

//   /// Loops back to first page after the last.
//   final bool loop;

//   /// Tap callback for Firestore items. Index excludes [extraItem] when hidden.
//   final Function(int index)? onTap;

//   /// Callback for page-change notifications.
//   final Function(int index)? onPageChanged;

//   /// Opacity animation duration.
//   final Duration opacityAnimationDuration;

//   /// Opacity animation curve.
//   final Curve opacityAnimationCurve;

//   /// Overall height of the swiper.
//   final double? height;

//   /// Maximum scale for the focused page.
//   final double maxScale;

//   /// Minimum scale for non-focused pages.
//   final double minScale;

//   /// Optional widget shown at index 0 (unless hidden by threshold).
//   final Widget? extraItem;

//   /// Hides [extraItem] if Firestore item count >= threshold.
//   final int? hideExtraItemThreshold;

//   /// Tap callback specifically for [extraItem].
//   final VoidCallback? extraItemOnTap;

//   /// Whether to apply opacity effect. If null, no opacity is applied; if true, existing opacity logic is used.
//   final bool applyOpacity;

//   @override
//   State<FirestorePaginatedPageView<T>> createState() => _FirestorePaginatedPageViewState<T>();
// }

// class _FirestorePaginatedPageViewState<T> extends State<FirestorePaginatedPageView<T>> {
//   /// Controller for page view.
//   late final PageController _controller;

//   /// Tracks the current page.
//   double _currentPage = 0.0;

//   /// Auto-advance timer.
//   Timer? _autoPlayTimer;

//   /// Inactivity timer to resume auto-advance.
//   Timer? _inactivityTimer;

//   void _listener() {
//     setState(() {
//       _currentPage = _controller.page ?? 0.0;
//       _resetInactivityTimer();
//       widget.onPageChanged?.call(_controller.page!.floor());
//     });
//   }

//   void _resetInactivityTimer() {
//     _inactivityTimer?.cancel();
//     _inactivityTimer = Timer(const Duration(seconds: 10), () {
//       if (widget.autoAdvance) _startAutoAdvance();
//     });
//   }

//   void _startAutoAdvance() {
//     _stopAutoAdvance();
//     _autoPlayTimer = Timer.periodic(widget.autoAdvanceInterval, (timer) {
//       if (!_controller.hasClients) return;
//       final currentFloor = _currentPage.floor();
//       _controller.nextPage(
//         duration: widget.autoAdvanceAnimationDuration,
//         curve: widget.autoAdvanceCurve,
//       );
//       if (widget.loop && currentFloor < 0) {
//         _controller.animateToPage(
//           0,
//           duration: widget.autoAdvanceAnimationDuration,
//           curve: widget.autoAdvanceCurve,
//         );
//       }
//     });
//   }

//   void _stopAutoAdvance() => _autoPlayTimer?.cancel();

//   @override
//   void initState() {
//     super.initState();
//     _controller = PageController(
//       viewportFraction: widget.viewportFraction,
//       initialPage: 0,
//     )..addListener(_listener);
//     if (widget.autoAdvance) _startAutoAdvance();
//     _resetInactivityTimer();
//   }

//   @override
//   void dispose() {
//     _controller
//       ..removeListener(_listener)
//       ..dispose();
//     _stopAutoAdvance();
//     _inactivityTimer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;

//     return FirestoreQueryBuilder<T>(
//       query: widget.query,
//       pageSize: widget.pageSize,
//       builder: (context, snapshot, _) {
//         if (snapshot.isFetching) return widget.loadingWidget;
//         if (snapshot.hasError) return widget.errorWidget;
//         if (snapshot.docs.isEmpty) return widget.noResultsWidget;

//         // Apply optional filter
//         final unfilteredItems = snapshot.docs.map((e) => e.data()).toList(growable: false);
//         final items = widget.filter != null ? widget.filter!(unfilteredItems) : unfilteredItems;

//         // Handle extraItem visibility
//         final bool showExtra = widget.extraItem != null &&
//             (widget.hideExtraItemThreshold == null || items.length < widget.hideExtraItemThreshold!);
//         final int itemCount = items.length + (showExtra ? 1 : 0);

//         return SizedBox(
//           height: widget.height ?? size.height * 0.6,
//           width: double.infinity,
//           child: GestureDetector(
//             onHorizontalDragCancel: () {
//               _stopAutoAdvance();
//               _resetInactivityTimer();
//             },
//             child: PageView.builder(
//               physics: const BouncingScrollPhysics(),
//               controller: _controller,
//               itemCount: itemCount,
//               itemBuilder: (context, index) {
//                 // Adjust indices for extraItem
//                 final int offset = showExtra ? 1 : 0;
//                 final int realIndex = index - offset;

//                 // Firestore pagination fetch-more trigger
//                 if (snapshot.hasMore && realIndex + 1 == snapshot.docs.length) {
//                   snapshot.fetchMore();
//                 }

//                 // Scale & opacity calculations
//                 final double distance = (index - _currentPage).abs();
//                 final double scaleRange = widget.maxScale - widget.minScale;
//                 double scale = widget.maxScale - (distance * scaleRange);
//                 scale = scale < widget.minScale ? widget.minScale : scale;

//                 const double opacityRange = 0.5;
//                 double opacity = 1.0 - (distance * opacityRange);
//                 opacity = opacity < 0.5 ? 0.5 : opacity;

//                 // Render extraItem
//                 if (showExtra && index == 0) {
//                   final onTap = widget.extraItemOnTap ?? (widget.onTap != null ? () => widget.onTap!(0) : null);
//                   final child = widget.extraItem!;
//                   final content = onTap != null ? GestureDetector(onTap: onTap, child: child) : child;
//                   final scaled = Transform.scale(
//                     scale: scale,
//                     child: content,
//                   );
//                   return widget.applyOpacity ? Opacity(opacity: opacity, child: scaled) : scaled;
//                 }

//                 // Render Firestore items
//                 if (realIndex < 0 || realIndex >= items.length) {
//                   return const SizedBox.shrink();
//                 }
//                 final T item = items[realIndex];
//                 final builtItem = widget.itemBuilder?.call(item, realIndex);
//                 final child = builtItem ??
//                     Text(
//                       'No "itemBuilder" provided for this item: $item',
//                       style: Theme.of(context).textTheme.bodySmall,
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 3,
//                     );
//                 final onTap = widget.onTap != null ? () => widget.onTap!(realIndex) : null;
//                 final content = onTap != null ? GestureDetector(onTap: onTap, child: child) : child;
//                 final scaled = Transform.scale(
//                   scale: scale,
//                   child: content,
//                 );
//                 return widget.applyOpacity ? Opacity(opacity: opacity, child: scaled) : scaled;
//               },
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
