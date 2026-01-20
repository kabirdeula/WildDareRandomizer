import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/deck/deck.dart';
import '../../features/rules/rules.dart';
import '../core.dart';

abstract final class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    initialLocation: AppRoute.initial.path,
    routes: _routes,
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text(state.error.toString()))),
  );

  static final _routes = [
    GoRoute(
      path: AppRoute.initial.path,
      name: AppRoute.initial.name,
      pageBuilder: (context, state) =>
          buildFadeTransition(context, state, RulesScreen()),
    ),
    GoRoute(
      path: AppRoute.deckManagement.path,
      name: AppRoute.deckManagement.name,
      pageBuilder: (context, state) =>
          buildSlideTransition(context, state, DeckManagementScreen()),
    ),
  ];
}
