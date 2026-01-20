import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'core/core.dart';

class WildDareApp extends StatelessWidget {
  const WildDareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: kReleaseMode ? false : true,
      routerConfig: AppRouter.router,
      title: AppConstants.appName,
    );
  }
}
