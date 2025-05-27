import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';
import 'package:petto/core/files/application/app_file_view_model.dart';
import 'package:shimmer/shimmer.dart';

/// Main thumbnail widget, with action buttons aligned via [actionButtonsPosition].
class FileThumbnail extends StatelessWidget {
  const FileThumbnail({
    super.key,
    required this.fileViewModel,
    required this.actionButtonsPosition,
    required this.autoplayApiVideo,
    required this.isFromApiVideo,
    required this.showDeleteAction,
    required this.showCancelAction,
    required this.showRetryAction,
    required this.isLoading,
    required this.thumbnailHeight,
    required this.thumbnailWidth,
    required this.borderRadius,
    this.thumbnailBuilder,
    this.onRetry,
    this.onDelete,
    this.onCancel,
    this.boxShadow,
  });

  /// The file to display
  final AppFileViewModel fileViewModel;

  /// Optional custom thumbnail builder
  final Widget Function(AppFileViewModel fileViewModel)? thumbnailBuilder;

  /// The height of the thumbnail
  final double thumbnailHeight;

  /// The width of the thumbnail
  final double thumbnailWidth;

  /// The border radius of the thumbnail
  final BorderRadius borderRadius;

  /// Optional custom box shadow
  final BoxShadow? boxShadow;

  /// Callback to retry the current action (upload or delete).
  final VoidCallback? onRetry;

  /// Callback to delete the file.
  final VoidCallback? onDelete;

  /// Callback to cancel the current action.
  final VoidCallback? onCancel;

  /// Position for the action buttons overlay
  final Alignment actionButtonsPosition;

  /// Autoplay for api.video
  final bool autoplayApiVideo;

  /// Use ApiVideo or native VideoPlayer
  final bool isFromApiVideo;

  /// Flag to show delete action
  final bool showDeleteAction;

  /// Flag to show cancel action
  final bool showCancelAction;

  /// Flag to show retry action
  final bool showRetryAction;

  /// Skip loaders when true
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main thumbnail (either custom or default content)
        if (thumbnailBuilder != null)
          thumbnailBuilder!(fileViewModel)
        else
          _ThumbnailContent(
            fileViewModel: fileViewModel,
            thumbnailHeight: thumbnailHeight,
            thumbnailWidth: thumbnailWidth,
            borderRadius: borderRadius,
            boxShadow: boxShadow,
            isFromApiVideo: isFromApiVideo,
            autoplayApiVideo: autoplayApiVideo,
            isLoading: isLoading,
          ),

        // Status overlay (error / progress icon)
        Positioned.fill(
          child: _StatusOverlay(
            status: fileViewModel.status,
            progress: fileViewModel.progress,
            onRetry: onRetry,
          ),
        ),

        // Action buttons, aligned as requested
        Align(
          alignment: actionButtonsPosition,
          widthFactor: 1,
          heightFactor: 1,
          child: _ActionButtons(
            status: fileViewModel.status,
            onDelete: onDelete,
            onCancel: onCancel,
            onRetry: onRetry,
            showDeleteAction: showDeleteAction,
            showCancelAction: showCancelAction,
            showRetryAction: showRetryAction,
          ),
        ),
      ],
    );
  }
}

/// Decides between displaying an image or a video based on the file type.
class _ThumbnailContent extends StatelessWidget {
  const _ThumbnailContent({
    required this.fileViewModel,
    required this.isFromApiVideo,
    required this.autoplayApiVideo,
    required this.isLoading,
    required this.thumbnailHeight,
    required this.thumbnailWidth,
    required this.borderRadius,
    this.boxShadow,
  });

  final AppFileViewModel fileViewModel;

  /// If true, use ApiVideoPlayer for videos; if false, use VideoPlayer.
  final bool isFromApiVideo;

  /// Indicates whether videos (if using api.video) should autoplay.
  final bool autoplayApiVideo;

  /// Controls if loaders are shown at this level.
  final bool isLoading;

  /// The height of the thumbnail
  final double thumbnailHeight;

  /// The width of the thumbnail
  final double thumbnailWidth;

  /// The border radius of the thumbnail
  final BorderRadius borderRadius;

  /// The shadows of the thumbnail
  final BoxShadow? boxShadow;

  @override
  Widget build(BuildContext context) {
    String? mime = fileViewModel.file.mime;

    BoxShadow? boxShadow = this.boxShadow ?? AppThemeShadow.large;

    // Determine the file type based on mimeType
    Widget content;
    if (mime.startsWith('image/')) {
      content = _ImageThumbnail(
        fileViewModel: fileViewModel,
        isLoading: isLoading,
        borderRadius: borderRadius,
        thumbnailHeight: thumbnailHeight,
        thumbnailWidth: thumbnailWidth,
        boxShadow: boxShadow,
      );
    } else if (mime == 'application/pdf') {
      content = _PdfThumbnail(fileViewModel: fileViewModel);
    } else {
      content = _OtherFileThumbnail(fileViewModel: fileViewModel);
    }

    return content;
  }
}

/// Widget to display image thumbnails.
class _ImageThumbnail extends StatelessWidget {
  const _ImageThumbnail({
    required this.fileViewModel,
    required this.isLoading,
    required this.thumbnailHeight,
    required this.thumbnailWidth,
    required this.borderRadius,
    required this.boxShadow,
  });

  /// The file to display
  final AppFileViewModel fileViewModel;

  /// Controls if loaders are shown at this level.
  final bool isLoading;

  /// The height of the thumbnail
  final double thumbnailHeight;

  /// The width of the thumbnail
  final double thumbnailWidth;

  /// The border radius of the thumbnail
  final BorderRadius borderRadius;

  /// The shadows of the thumbnail
  final BoxShadow boxShadow;

  @override
  Widget build(BuildContext context) {
    if (fileViewModel.pickedFile != null) {
      return Container(
        height: thumbnailHeight,
        width: thumbnailWidth,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          boxShadow: [boxShadow],
        ),
        child: ClipRRect(
          borderRadius: borderRadius,
          child: Image.file(
            fileViewModel.pickedFile!,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => const _ErrorThumbnail(),
          ),
        ),
      );
    } else if (fileViewModel.file.url != null && fileViewModel.file.url!.isNotEmpty) {
      return Container(
        height: thumbnailHeight,
        width: thumbnailWidth,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          boxShadow: [AppThemeShadow.large],
        ),
        child: ClipRRect(
          borderRadius: borderRadius,
          child: CachedNetworkImage(
            imageUrl: fileViewModel.file.thumbnail ?? fileViewModel.file.url!,
            fit: BoxFit.cover,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Theme.of(context).colorScheme.surface,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: thumbnailHeight,
                width: thumbnailWidth,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: borderRadius,
                  boxShadow: [boxShadow],
                ),
              ),
            ),
            errorWidget: (context, url, error) => const _ErrorThumbnail(),
          ),
        ),
      );
    } else {
      return const _PlaceholderThumbnail();
    }
  }
}

/// Widget to display PDF thumbnails.
class _PdfThumbnail extends StatelessWidget {
  const _PdfThumbnail({
    required this.fileViewModel,
  });

  final AppFileViewModel fileViewModel;

  @override
  Widget build(BuildContext context) {
    // Display a PDF icon
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.picture_as_pdf,
            size: 40,
          ),
          Text(fileViewModel.file.name),
        ],
      ),
    );
  }
}

/// Widget to display thumbnails for other file types.
class _OtherFileThumbnail extends StatelessWidget {
  const _OtherFileThumbnail({
    required this.fileViewModel,
  });

  final AppFileViewModel fileViewModel;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    // Display a generic file icon
    return Center(
      child: Icon(
        Icons.insert_drive_file,
        color: colorScheme.surface,
        size: 40,
      ),
    );
  }
}

/// Widget to display an error icon.
class _ErrorThumbnail extends StatelessWidget {
  const _ErrorThumbnail();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.error_outline,
        color: Colors.redAccent,
      ),
    );
  }
}

/// Widget to display a loading indicator.
class _LoadingThumbnail extends StatelessWidget {
  const _LoadingThumbnail();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

/// Widget to display a generic placeholder.
class _PlaceholderThumbnail extends StatelessWidget {
  const _PlaceholderThumbnail();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: size.height * 0.5,
      height: size.height * 0.5,
      decoration: BoxDecoration(
        color: colorScheme.tertiaryFixed,
      ),
      child: Center(
        child: Icon(
          Icons.image_not_supported,
          color: colorScheme.surface,
          size: 40,
        ),
      ),
    );
  }
}

/// Displays different indicators and actions based on the file status.
class _StatusOverlay extends StatelessWidget {
  const _StatusOverlay({
    required this.status,
    this.progress,
    this.onRetry,
  });

  final AppFileStatus status;
  final int? progress;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    switch (status) {
      case AppFileStatus.uploadFailed:
      case AppFileStatus.deleteFailed:
        return Align(
          alignment: Alignment.center,
          child: Icon(
            Icons.error,
            color: colorScheme.error,
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}

/// Displays delete/cancel/retry buttons based on [status] and `showXAction` flags.
class _ActionButtons extends StatelessWidget {
  const _ActionButtons({
    required this.status,
    this.onDelete,
    this.onCancel,
    this.onRetry,
    required this.showDeleteAction,
    required this.showCancelAction,
    required this.showRetryAction,
  });

  final AppFileStatus status;
  final VoidCallback? onDelete;
  final VoidCallback? onCancel;
  final VoidCallback? onRetry;
  final bool showDeleteAction;
  final bool showCancelAction;
  final bool showRetryAction;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    switch (status) {
      case AppFileStatus.idle:
      case AppFileStatus.uploaded:
        if (showDeleteAction) {
          return IconButton(
            icon: Icon(Icons.delete, color: colorScheme.surface),
            onPressed: onDelete,
          );
        }
        break;
      case AppFileStatus.upload:
      case AppFileStatus.delete:
        if (showCancelAction) {
          return IconButton(
            icon: Icon(Icons.close, color: colorScheme.surface),
            onPressed: onCancel,
          );
        }
        break;
      case AppFileStatus.uploadFailed:
      case AppFileStatus.deleteFailed:
        if (showRetryAction) {
          return IconButton(
            icon: Icon(Icons.refresh, color: colorScheme.surface),
            onPressed: onRetry,
          );
        }
        break;
      case AppFileStatus.deleted:
        break;
    }

    // If none of the above, show nothing
    return const SizedBox.shrink();
  }
}
