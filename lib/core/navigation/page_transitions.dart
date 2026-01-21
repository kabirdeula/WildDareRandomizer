import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Reusable fade transition
Page<T> buildFadeTransition<T>(
  BuildContext context,
  GoRouterState state,
  Widget child, {
  Duration duration = const Duration(milliseconds: 300),
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}

/// Reusable slide transition from right
Page<T> buildSlideTransition<T>(
  BuildContext context,
  GoRouterState state,
  Widget child, {
  Duration duration = const Duration(milliseconds: 300),
  Offset beginOffset = const Offset(1.0, 0.0),
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final offsetAnimation = Tween<Offset>(
        begin: beginOffset,
        end: Offset.zero,
      ).animate(animation);

      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}

/// Reusable scale transition
Page<T> buildScaleTransition<T>(
  BuildContext context,
  GoRouterState state,
  Widget child, {
  Duration duration = const Duration(milliseconds: 300),
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(scale: animation, child: child);
    },
  );
}

/// Reusable rotation transition
Page<T> buildRotationTransition<T>(
  BuildContext context,
  GoRouterState state,
  Widget child, {
  Duration duration = const Duration(milliseconds: 300),
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return RotationTransition(turns: animation, child: child);
    },
  );
}

/// Reusable size transition
Page<T> buildSizeTransition<T>(
  BuildContext context,
  GoRouterState state,
  Widget child, {
  Duration duration = const Duration(milliseconds: 300),
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SizeTransition(sizeFactor: animation, child: child);
    },
  );
}
