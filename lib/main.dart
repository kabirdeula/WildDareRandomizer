import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wild_dare_randomizer/utils/router/app_routes.dart';

import 'app/app.dart';
import 'data/repositories/repository.dart';
import 'providers/provider.dart';
import 'utils/util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Hive.initFlutter();
    await Hive.openBox(Config.kRuleBox);
    final ruleRepository = RuleRepository();
    await ruleRepository.loadRulesIfNeeded();
  } catch (e) {
    log.e("Error initializing App Dependencies: $e");
  }
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const ProviderScope(child: MyApp()),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    return MaterialApp.router(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRoutes.router,
      title: Config.kAppName,
      theme: settings.isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
    );
  }
}
