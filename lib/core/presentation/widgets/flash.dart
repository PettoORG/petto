import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

/// Enum que representa el tipo de alerta.
enum FlashType { info, success, error, warning }

/// Método general para mostrar un flash message basado en el [FlashType].
Future<void> showCustomFlash(
  BuildContext context,
  String message, {
  String? title,
  FlashType type = FlashType.error,
  int milliseconds = 5000,
  VoidCallback? onRemove,
}) async {
  ColorScheme colorScheme = Theme.of(context).colorScheme;
  // Determina los colores según el FlashType.
  Color backgroundColor;
  Color iconColor;
  IconData icon;

  switch (type) {
    case FlashType.success:
      backgroundColor = colorScheme.onTertiaryContainer.withValues(alpha: .8);
      iconColor = colorScheme.surface;
      icon = Icons.check_circle_outline_rounded;
      break;
    case FlashType.error:
      backgroundColor = colorScheme.errorContainer.withValues(alpha: .8);
      iconColor = colorScheme.error;
      icon = Icons.error_outline_rounded;
      break;
    case FlashType.warning:
      backgroundColor = colorScheme.onTertiaryContainer.withValues(alpha: .8);
      iconColor = colorScheme.surface;
      icon = Icons.warning_amber_outlined;
      break;
    case FlashType.info:
      backgroundColor = colorScheme.surface;
      iconColor = colorScheme.onTertiaryContainer;
      icon = Icons.info_outline_rounded;
      break;
  }

  final flashFuture = showFlash(
    context: context,
    duration: Duration(milliseconds: milliseconds),
    transitionDuration: const Duration(milliseconds: 600),
    reverseTransitionDuration: const Duration(milliseconds: 400),
    builder: (context, controller) => Flash(
      controller: controller,
      child: _CustomFlashContent(
        controller: controller,
        icon: icon,
        title: title,
        message: message,
        iconColor: iconColor,
        backgroundColor: backgroundColor,
      ),
    ),
  );

  // Al remover el flash, se ejecuta el callback [onRemove].
  flashFuture.then((_) {
    if (onRemove != null) {
      onRemove();
    }
  });
}

/// Widget que construye el contenido del Flash.
class _CustomFlashContent extends StatelessWidget {
  final FlashController controller;
  final IconData icon;
  final String? title;
  final String message;
  final Color iconColor;
  final Color backgroundColor;

  const _CustomFlashContent({
    required this.controller,
    required this.icon,
    this.title,
    required this.message,
    required this.iconColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    ThemeData themeData = Theme.of(context);

    return FlashBar(
      controller: controller,
      backgroundColor: backgroundColor,
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icon,
          color: iconColor,
          size: 32,
        ),
      ),
      title: (title != null)
          ? Text(
              title!,
              style: themeData.inputDecorationTheme.labelStyle!.copyWith(
                fontSize: textTheme.bodyMedium!.fontSize,
                color: colorScheme.surface,
              ),
            )
          : null,
      content: Text(
        message,
        style: themeData.inputDecorationTheme.labelStyle?.copyWith(
          fontSize: textTheme.bodyMedium!.fontSize,
          color: colorScheme.surface,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        // side: BorderSide(color: Theme.of(context).colorScheme.onInverseSurface,
        //           ),
      ),
      margin: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      behavior: FlashBehavior.floating,
      position: FlashPosition.top,
      shouldIconPulse: true,
    );
  }
}
