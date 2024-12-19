import 'package:go_router/go_router.dart';
import 'package:wild_dare_randomizer/features/dashboard/dashboard.dart';

import 'package:wild_dare_randomizer/features/gateway/gateway.dart';
import 'package:wild_dare_randomizer/pages/home_page.dart';

import 'app_routes.dart';

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
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: AppRoutes.home.path,
        name: AppRoutes.home.name,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
