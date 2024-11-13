import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A provider that holds the currently selected index for the app's pages.
/// This index is managed as state and can be modified across the app.
final selectedIndexProvider = StateProvider<int>((ref) => 0);

/// A provider that holds the title for the app's app bar.
/// This title can be dynamically updated based on the active page or user actions.
final appBarTitleProvider =
    StateProvider<String>((ref) => 'Uno Dare Randomizer');

/// A provider that creates and manages a [PageController] for controlling page views.
///
/// The controller's lifecycle is tied to the provider's lifecycle;
/// it is automatically disposed when no longer needed, freeing up resources.
final pageControllerProvider = Provider<PageController>((ref) {
  final controller = PageController();
  ref.onDispose(controller.dispose);
  return controller;
});
