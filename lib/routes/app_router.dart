import 'package:wild_dare_randomizer/features/dashboard/dashboard.dart';
import 'package:wild_dare_randomizer/features/gateway/gateway.dart';
import 'package:wild_dare_randomizer/features/home/home.dart';

import 'routes.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.initial.path,
    routes: [
      GoRoute(
        path: AppRoutes.initial.path,
        name: AppRoutes.initial.name,
        builder: (context, state) => const GatewayScreen(),
      ),
      GoRoute(
        path: AppRoutes.dashboard.path,
        name: AppRoutes.dashboard.name,
        builder: (context, state) => DashboardScreen(),
      ),
      GoRoute(
        path: AppRoutes.home.path,
        name: AppRoutes.home.name,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
