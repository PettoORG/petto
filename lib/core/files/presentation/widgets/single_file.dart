import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petto/app/theme/app_theme_sizes.dart';
import 'package:petto/core/files/application/app_file_view_model.dart';
import 'package:petto/core/files/application/bucket_provider.dart';
import 'package:petto/core/files/application/files_firestore_path_provider.dart';
import 'package:petto/core/files/application/files_notifier.dart';
import 'package:petto/core/files/application/files_state.dart';
import 'package:petto/core/files/application/files_storage_path_provider.dart';
import 'package:petto/core/files/domain/crop_options.dart';
import 'package:petto/core/files/presentation/widgets/file_thumbnail.dart';

/// This widget displays a single file using either the default UI or a custom child widget.
/// It connects to the FilesNotifier for the given folder path, listens to state changes,
/// and builds the UI accordingly. It also handles delete, cancel, and retry actions.
///
/// If a [unselectedFileWidget] builder is provided, it will be used to render the UI,
/// receiving the file state and internal action callbacks without exposing the methods.
class SingleFile extends ConsumerStatefulWidget {
  const SingleFile({
    super.key,
    required this.family,
    required this.unselectedFileWidget,
    required this.thumbnailHeight,
    required this.thumbnailWidth,
    this.borderRadius,
    this.storagePath,
    this.bucket,
    this.firestorePath,
    this.allowedMimes,
    this.cropOptions,
    this.onFileChanged,
    this.onLoadedChanged,
    this.thumbnailBuilder,
    this.actionButtonsPosition = Alignment.topRight,
    this.autoplayApiVideo = true,
    this.isFromApiVideo = true,
    this.showCancelAction = true,
    this.showDeleteAction = true,
    this.showRetryAction = true,
    this.isLoading = false,
  });

  /// Family used to load all the providers.
  final String family;

  /// Path to the storage folder.
  final String? storagePath;

  /// Bucket name. If null, it will use the default bucket.
  final String? bucket;

  /// Path to the Firestore collection where file data is stored. If null, it will
  /// use the same path as [storagePath].
  final String? firestorePath;

  /// List of allowed MIME types for image selection.
  final List<String>? allowedMimes;

  /// Configuration for cropping images. If null, it won't crop images.
  final CropOptions? cropOptions;

  /// Callback to notify when the file changes.
  final Function(AppFileViewModel? file)? onFileChanged;

  /// Callback to notify when files are loaded or changed.
  /// Receives a boolean indicating whether files have been loaded.
  final Function(bool loaded)? onLoadedChanged;

  /// Function to build a custom thumbnail. If null, a default thumbnail will be used.
  final Widget Function(AppFileViewModel fileViewModel)? thumbnailBuilder;

  /// Height for the thumbnail.
  final double thumbnailHeight;

  /// Width for the thumbnail.
  final double thumbnailWidth;

  /// The border radius of the thumbnail.
  final BorderRadius? borderRadius;

  /// Chooses where the action buttons should appear (topRight, topLeft, center, etc.).
  final Alignment actionButtonsPosition;

  /// Indicates whether videos (if using api.video) should autoplay.
  final bool autoplayApiVideo;

  /// If true, use ApiVideoPlayer for videos; if false, use VideoPlayer.
  final bool isFromApiVideo;

  /// Indicates whether the delete action should be shown.
  final bool showDeleteAction;

  /// Indicates whether the cancel action should be shown.
  final bool showCancelAction;

  /// Indicates whether the retry action should be shown.
  final bool showRetryAction;

  /// If true, do not show loaders in this widget (to avoid duplicate loaders).
  /// If false, loaders will be shown if needed.
  final bool isLoading;

  /// Optional builder to customize the UI.
  /// The builder receives:
  ///  - [onImageTap] callback to pick an image
  ///  - [onVideoTap] callback to pick a video
  final Function(VoidCallback onImageTap) unselectedFileWidget;

  @override
  SingleFileWidgetState createState() => SingleFileWidgetState();
}

class SingleFileWidgetState extends ConsumerState<SingleFile> {
  List<AppFileViewModel> files = [];

  late String family = widget.family;

  @override
  void initState() {
    super.initState();
    family = widget.family;
    Future.microtask(() {
      // Set bucket. If null, it will use the default bucket.
      ref.read(bucketProvider(family).notifier).set(widget.bucket);

      // Set storage path.
      ref.read(filesStoragePathProvider(family).notifier).set(widget.storagePath);

      // Set Firestore path. If null, use storage path.
      ref.read(filesFirestorePathProvider(family).notifier).set(widget.firestorePath ?? widget.storagePath);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Listen to the FilesNotifier state changes.
    ref.listen<FilesState>(
      filesNotifierProvider(family),
      (previous, next) {
        switch (next) {
          case Loading(status: _):
            // No action on loading
            break;

          case Loaded(files: final files, status: _):
            // Notify that loading completed
            widget.onLoadedChanged?.call(true);

            // If there is at least one file, notify first file change
            if (files.isNotEmpty) {
              widget.onFileChanged?.call(files.firstOrNull);
            }
            break;
        }
      },
    );

    final filesState = ref.watch(filesNotifierProvider(family));
    // Retrieve the first file if available; otherwise, set to null.
    final AppFileViewModel? file = filesState.files.firstOrNull;

    final borderRadius = widget.borderRadius ?? BorderRadius.all(AppThemeRadius.extraLarge);

    // Default UI if no custom child is provided.
    return Center(
      child: file == null
          // If no file is selected, display the add file button.
          ? widget.unselectedFileWidget(_pickImage)
          // If a file is selected, display the file thumbnail with actions.
          : _FileThumbnailWrapper(
              fileViewModel: file,
              borderRadius: borderRadius,
              thumbnailHeight: widget.thumbnailHeight,
              thumbnailWidth: widget.thumbnailWidth,
              thumbnailBuilder: widget.thumbnailBuilder,
              onDelete: () => _deleteFile(file),
              onCancel: () => _cancelOperation(file),
              onRetry: () => _retryOperation(file),
              actionButtonsPosition: widget.actionButtonsPosition,
              autoplayApiVideo: widget.autoplayApiVideo,
              isFromApiVideo: widget.isFromApiVideo,
              showCancelAction: widget.showCancelAction,
              showDeleteAction: widget.showDeleteAction,
              showRetryAction: widget.showRetryAction,
              isLoading: widget.isLoading,
              pickImage: _pickImage,
            ),
    );
  }

  /// Handles the image selection process.
  void _pickImage() {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      builder: (context) => _AddFileOptionsSheet(
        onCameraPressed: () {
          Navigator.of(context).pop();
          ref.read(filesNotifierProvider(family).notifier).pickImageFromCamera(
                allowedMimes: widget.allowedMimes,
                cropOptions: widget.cropOptions,
              );
        },
        onGalleryPressed: () {
          Navigator.of(context).pop();
          ref.read(filesNotifierProvider(family).notifier).pickImageFromGallery(
                allowedMimes: widget.allowedMimes,
                cropOptions: widget.cropOptions,
              );
        },
      ),
    );
  }

  void _deleteFile(AppFileViewModel file) {
    final notifier = ref.read(filesNotifierProvider(family).notifier);
    notifier.deleteFile(file);
  }

  void _cancelOperation(AppFileViewModel file) {
    final notifier = ref.read(filesNotifierProvider(family).notifier);
    notifier.cancelOperation(file);
  }

  void _retryOperation(AppFileViewModel file) {
    final notifier = ref.read(filesNotifierProvider(family).notifier);
    notifier.retryOperation(file);
  }
}

/// Private widget to wrap the FileThumbnail with necessary actions.
class _FileThumbnailWrapper extends StatelessWidget {
  const _FileThumbnailWrapper({
    required this.fileViewModel,
    required this.thumbnailBuilder,
    required this.onDelete,
    required this.onCancel,
    required this.onRetry,
    required this.actionButtonsPosition,
    required this.autoplayApiVideo,
    required this.isFromApiVideo,
    required this.showCancelAction,
    required this.showDeleteAction,
    required this.showRetryAction,
    required this.isLoading,
    required this.thumbnailHeight,
    required this.thumbnailWidth,
    required this.borderRadius,
    required this.pickImage,
  });

  /// View model for the file to display.
  final AppFileViewModel fileViewModel;

  /// Function to build a custom thumbnail. If null, a default thumbnail will be used.
  final Widget Function(AppFileViewModel fileViewModel)? thumbnailBuilder;

  /// Callback executed when the delete action is pressed.
  final VoidCallback onDelete;

  /// Callback executed when the cancel action is pressed.
  final VoidCallback onCancel;

  /// Callback executed when the retry action is pressed.
  final VoidCallback onRetry;

  /// Chooses where the action buttons should appear.
  final Alignment actionButtonsPosition;

  /// Indicates whether videos should autoplay.
  final bool autoplayApiVideo;

  /// If true, use ApiVideoPlayer for videos; otherwise, use VideoPlayer.
  final bool isFromApiVideo;

  /// Indicates whether the cancel action should be shown.
  final bool showCancelAction;

  /// Indicates whether the delete action should be shown.
  final bool showDeleteAction;

  /// Indicates whether the retry action should be shown.
  final bool showRetryAction;

  /// If true, do not show loaders in this widget.
  final bool isLoading;

  /// Height for the thumbnail.
  final double thumbnailHeight;

  /// Width for the thumbnail.
  final double thumbnailWidth;

  /// The border radius of the thumbnail.
  final BorderRadius borderRadius;

  /// Callback executed when the extra child is tapped.
  final VoidCallback pickImage;

  @override
  Widget build(BuildContext context) {
    return FileThumbnail(
      fileViewModel: fileViewModel,
      thumbnailHeight: thumbnailHeight,
      thumbnailWidth: thumbnailWidth,
      borderRadius: borderRadius,
      thumbnailBuilder: thumbnailBuilder,
      onDelete: onDelete,
      onCancel: onCancel,
      onRetry: onRetry,
      actionButtonsPosition: actionButtonsPosition,
      autoplayApiVideo: autoplayApiVideo,
      isFromApiVideo: isFromApiVideo,
      showCancelAction: showCancelAction,
      showDeleteAction: showDeleteAction,
      showRetryAction: showRetryAction,
      isLoading: isLoading,
    );
  }
}

/// Private widget that displays the modal bottom sheet for adding file options.
/// It provides buttons to pick an image or video from the camera or gallery.
class _AddFileOptionsSheet extends StatelessWidget {
  const _AddFileOptionsSheet({
    required this.onCameraPressed,
    required this.onGalleryPressed,
  });

  /// Callback executed when the camera option is pressed.
  final VoidCallback onCameraPressed;

  /// Callback executed when the gallery option is pressed.
  final VoidCallback onGalleryPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      height: .165.sh,
      padding: EdgeInsets.symmetric(horizontal: AppThemeSpacing.smallW),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(AppThemeSpacing.extraSmallH),
            height: .01.sh,
            width: .08.sh,
            decoration: BoxDecoration(
              color: colorScheme.primary,
              borderRadius: BorderRadius.all(AppThemeRadius.small),
            ),
          ),
          // Row containing the camera and gallery option buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Button to pick from camera
              _AddOptionButton(
                icon: Icons.camera,
                label: 'camera'.tr(),
                onPressed: onCameraPressed,
              ),
              // Button to pick from gallery
              _AddOptionButton(
                icon: Icons.photo_library,
                label: 'gallery'.tr(),
                onPressed: onGalleryPressed,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Private widget for add option buttons in the modal.
class _AddOptionButton extends StatelessWidget {
  const _AddOptionButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  /// Icon to display on the button.
  final IconData icon;

  /// Label to display on the button.
  final String label;

  /// Callback executed when the button is pressed.
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    final themeData = Theme.of(context);
    return Column(
      children: [
        IconButton(
          icon: Icon(
            icon,
            size: .038.sh,
          ),
          onPressed: onPressed,
          color: themeData.iconTheme.color,
        ),
        Text(
          label,
          style: textTheme.titleMedium?.copyWith(
            color: themeData.colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
