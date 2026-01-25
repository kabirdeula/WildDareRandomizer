import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/common.dart';
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
    errorBuilder: (context, state) => ErrorScreen(
      error: state.error.toString(),
      onRetry: () => context.push(AppRoute.initial.path),
    ),
  );

  static final _routes = [
    GoRoute(
      path: AppRoute.initial.path,
      name: AppRoute.initial.name,
      pageBuilder: (context, state) =>
          buildFadeTransition(context, state, const RulesScreen()),
    ),
    GoRoute(
      path: AppRoute.deckManagement.path,
      name: AppRoute.deckManagement.name,
      pageBuilder: (context, state) =>
          buildSlideTransition(context, state, const DeckManagementScreen()),
    ),
  ];
}
