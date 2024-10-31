import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class LogService {
  static final Logger logger = Logger(
    level: kReleaseMode ? Level.error : Level.debug,
  );
}
