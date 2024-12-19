import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/themes/themes.dart';
import 'core/utils/utils.dart';
import 'dependency_injection.dart';
import 'features/gateway/gateway.dart';
import 'routes/routes.dart';

/// Entry point of the Flutter application.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  dependencyInjection();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => locator<GatewayCubit>()),
    ],
    child: DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return MaterialApp.router(
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: const TextScaler.linear(1.0)),
              child: child!,
            );
          },
          locale: DevicePreview.locale(context),
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: !kReleaseMode ? true : false,
          theme: AppThemes.themeData(),
        );
      },
    );
  }
}

// void main() async {
//   try {
//     await Hive.openBox(Config.kRuleBox);
//     final ruleRepository = RuleRepository();
//     await ruleRepository.loadRulesIfNeeded();
//   } catch (e) {
//     log.e("Error initializing App Dependencies: $e");
//   }
// }
