import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/cubit.dart';
import '../../screens/screen.dart';
import 'package:go_router/go_router.dart';
import '../enums/routes.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.initial.path,
    routes: [
      ShellRoute(
        routes: [
          GoRoute(
            path: Routes.initial.path,
            name: Routes.initial.name,
            builder: (_, __) => const RulesScreen(),
          ),
          GoRoute(
            path: Routes.favorites.path,
            name: Routes.favorites.name,
            builder: (_, __) => const FavoritesScreen(),
          ),
          GoRoute(
            path: Routes.settings.path,
            name: Routes.settings.name,
            builder: (_, __) => const SettingsScreen(),
          ),
        ],
        builder: (context, state, child) {
          context.read<NavigationCubit>().syncWithLocation(state.uri.path);

          return HomeScreen(child: child);
        },
      ),
    ],
  );
}
