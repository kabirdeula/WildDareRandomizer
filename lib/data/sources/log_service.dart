import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

/// A service for logging messages with different log levels.
///
/// `LogService` utilizes the `Logger` package to handle logging throughout
/// the app, adjusting its log level depending on the build mode.
///
/// - In `debug` mode, the log level is set to `Level.debug`, allowing
/// detailed log messages to be captured.
/// - In `release` mode, the log level is set to `Level.error`, limiting
/// logs to critical error messages for production efficiency.
class LogService {
  /// The instance of `Logger` used for logging in the app.
  ///
  /// Configured to only log error messages in release mode and debug
  /// messages in debug mode, reducing unnecessary logs in production.
  static final Logger logger = Logger(
    level: kReleaseMode ? Level.error : Level.debug,
  );
}
