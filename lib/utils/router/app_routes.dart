import 'package:go_router/go_router.dart';
import 'package:wild_dare_randomizer/screens/screen.dart';
import 'package:wild_dare_randomizer/utils/enums/routes.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(routes: [
    GoRoute(
      path: Routes.initial.path,
      name: Routes.initial.name,
      builder: (context, state) => const HomeScreen(),
    ),
  ]);
}
