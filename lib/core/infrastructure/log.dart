import 'package:logger/web.dart';

/// App logger class to log messages to console.
class Log {
  /// Logs a 'Trace' message.
  static void t(
    dynamic message, {
    Object? exception,
    StackTrace? stackTrace,
  }) {
    Logger(printer: PrettyPrinter()).t(
      message,
      time: DateTime.now(),
      error: exception,
      stackTrace: stackTrace,
    );
  }

  /// Logs a 'Debug' message.
  static void d(
    dynamic message, {
    Object? exception,
    StackTrace? stackTrace,
  }) {
    Logger(printer: PrettyPrinter()).d(
      message,
      time: DateTime.now(),
      error: exception,
      stackTrace: stackTrace,
    );
  }

  /// Logs an 'Info' message.
  static void i(
    dynamic message, {
    Object? exception,
    StackTrace? stackTrace,
  }) {
    Logger(printer: PrettyPrinter()).i(
      message,
      time: DateTime.now(),
      error: exception,
      stackTrace: stackTrace,
    );
  }

  /// Logs a 'Warning' message.
  static void w(
    dynamic message, {
    Object? exception,
    StackTrace? stackTrace,
  }) {
    Logger(printer: PrettyPrinter()).w(
      message,
      time: DateTime.now(),
      error: exception,
      stackTrace: stackTrace,
    );
  }

  /// Logs an 'Error' message.
  static void e(
    dynamic message, {
    Object? exception,
    StackTrace? stackTrace,
  }) {
    Logger(printer: PrettyPrinter()).e(
      message,
      time: DateTime.now(),
      error: exception,
      stackTrace: stackTrace,
    );
  }

  /// Logs a 'Fatal' message.
  static void f(
    dynamic message, {
    Object? exception,
    StackTrace? stackTrace,
  }) {
    Logger(printer: PrettyPrinter()).f(
      message,
      time: DateTime.now(),
      error: exception,
      stackTrace: stackTrace,
    );
  }
}
