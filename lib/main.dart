import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'common/common.dart';
import 'core/core.dart';
import 'features/rules/rules.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final RuleAssetSource source = RuleAssetSource();
  final rules = await source.loadRules();
  log.d("Loaded ${rules.length} rules");

  await HiveService.init();

  runApp(
    AppBlocProviders(
      child: DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => WildDareApp(),
      ),
    ),
  );
}
