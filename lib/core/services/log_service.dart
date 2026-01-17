import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

/// A service for logging messages with different log levels.
///
/// `LogService` utilizes the `Logger` package to handle logging throughout
/// the app, adjusting its log level depending on the build mode.
///
/// - In `debug` mode, the log level is set to `Level.debug`, allowing
/// detailed log messages to be captured.
/// - In `release` mode, the log level is set to `Level.error`, limiting
/// logs to critical error messages for production efficiency.
abstract final class LogService {
  static final LogService _instance = LogService();

  factory LogService() => _instance;

  static final Map<Level, AnsiColor> levelColor = {
    Level.debug: AnsiColor.fg(14),
    Level.info: AnsiColor.fg(15),
    Level.warning: AnsiColor.fg(11),
    Level.error: AnsiColor.fg(9),
  };

  /// The instance of `Logger` used for logging in the app.
  ///
  /// Configured to only log error messages in release mode and debug
  /// messages in debug mode, reducing unnecessary logs in production.
  static final Logger _logger = Logger(
    level: kReleaseMode ? Level.error : Level.debug,
    // printer: CleanColoredPrinter(),
    printer: PrettyPrinter(printEmojis: false, levelColors: levelColor),
    output: MultiOutput([ConsoleOutput(), FileLogOutput()]),
  );

  void d(dynamic message, {List<String>? tags}) =>
      _logger.d(_format(message, tags));

  /// Logs a list in a readable, line-by-line format.
  ///
  /// Useful for debugging collections such as stops, steps,states, etc.
  ///
  /// Example output:
  /// ```
  /// [TripOverviewCard]
  /// [0] TripTimelineItem(...)
  /// [1] TripTimelineItem(...)
  /// ```
  void list<T>(Iterable<T> items, {List<String>? tags, String? label}) {
    final buffer = StringBuffer();

    if (label != null && label.isNotEmpty) {
      buffer.writeln(label);
    }

    int index = 0;
    if (label == null) buffer.writeln();
    for (final item in items) {
      buffer.writeln('[$index] $item');
      index++;
    }

    _logger.d(_format(buffer.toString().trimRight(), tags));
  }

  void json(Object data, {List<String>? tags}) {
    final prettyJson = const JsonEncoder.withIndent('  ').convert(data);
    _logger.w(_format(prettyJson, tags));
  }

  void i(dynamic message, {List<String>? tags}) =>
      _logger.i(_format(message, tags));

  void w(dynamic message, {List<String>? tags}) =>
      _logger.w(_format(message, tags));

  void e(
    dynamic message, {
    List<String>? tags,
    Object? error,
    StackTrace? stackTrace,
  }) => _logger.e(_format(message, tags), error: error, stackTrace: stackTrace);

  static String _format(dynamic message, List<String>? tags) {
    if (tags == null || tags.isEmpty) return message.toString();
    final tagString = tags.map((t) => '[$t]').join(' ');
    return '$tagString $message';
  }
}

/// Global logger shortcut for ease of use.
final log = LogService();

/// A custom [LogOutput] that writes logs to a local file.
/// Useful for persistent debugging, issue tracking, or exporting logs to support.
class FileLogOutput extends LogOutput {
  static const _logFileName = 'app_logs.txt';
  static const _maxLogSizeBytes = 1024 * 100; // 100 KB for log rotation

  static final FileLogOutput _instance = FileLogOutput._internal();

  late File _logFile;
  bool _initialized = false;

  /// Private constructor for singleton
  FileLogOutput._internal() {
    _init();
  }

  /// Public factory to get the singleton instance
  factory FileLogOutput() => _instance;

  /// Ensure that the log file is initialized before use
  static Future<void> ensureInitialized() async {
    if (kIsWeb) return;

    if (!_instance._initialized) {
      await _instance._init();
    }
  }

  /// Initialize the log file location and rotate if needed
  Future<void> _init() async {
    if (kIsWeb) return;

    try {
      debugPrint("(File Log Output) Initialize FileLogOutput");
      final dir = await getApplicationDocumentsDirectory();
      _logFile = File('${dir.path}/$_logFileName');
      debugPrint("(File Log Output) Log file path: ${_logFile.path}");

      // Rotate log file if it's too big
      if (await _logFile.exists()) {
        final length = await _logFile.length();
        if (length > _maxLogSizeBytes) {
          final rotatedFile = File(
            '${dir.path}/app_logs+${DateTime.now().millisecondsSinceEpoch}.txt',
          );
          await _logFile.rename(rotatedFile.path);
          _logFile = File('${dir.path}/$_logFileName');
        }
      }

      _initialized = true;
    } catch (e, stackTrace) {
      _initialized = false;
      debugPrint('Failed to initialize FileLogOutput: $e\n$stackTrace');
    }
  }

  /// Write logs to the file
  @override
  void output(OutputEvent event) async {
    try {
      if (!_initialized) await _init();
      if (!_initialized) return;

      final logString = '${event.lines.join('\n')}\n';

      await _logFile.writeAsString(
        logString,
        mode: FileMode.append,
        flush: true,
      );
    } catch (e, stackTrace) {
      debugPrint('FileLogOutput failed: $e\n$stackTrace');
    }
  }
}
