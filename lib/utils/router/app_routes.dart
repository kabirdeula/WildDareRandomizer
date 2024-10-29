import 'package:go_router/go_router.dart';
import 'package:wild_dare_randomizer/screens/screen.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/rules',
      name: 'rules',
      builder: (context, state) => const CustomRuleScreen(),
    ),
  ]);
}
