import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wild_dare_randomizer/utils/router/app_routes.dart';

import 'app/app.dart';
import 'data/repositories/repository.dart';
import 'providers/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(Config.kRuleBox);
  final ruleRepository = RuleRepository();
  await ruleRepository.loadRulesIfNeeded();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRoutes.router,
      title: Config.kAppName,
      theme: settings.isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
    );
  }
}
