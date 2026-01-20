import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'common/common.dart';
import 'core/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveService.init();

  runApp(
    AppBlocProviders(
      child: DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const WildDareApp(),
      ),
    ),
  );
}
