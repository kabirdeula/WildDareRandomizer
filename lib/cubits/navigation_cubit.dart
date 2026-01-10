import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NavigationState extends Equatable {
  final int selectedIndex;
  final String appBarTitle;

  const NavigationState({
    required this.selectedIndex,
    required this.appBarTitle,
  });

  factory NavigationState.initial() {
    return const NavigationState(
      selectedIndex: 0,
      appBarTitle: 'Uno Dare Randomizer',
    );
  }

  NavigationState copyWith({int? selectedIndex, String? appBarTitle}) {
    return NavigationState(
        selectedIndex: selectedIndex ?? this.selectedIndex,
        appBarTitle: appBarTitle ?? this.appBarTitle);
  }

  @override
  List<Object> get props => [selectedIndex, appBarTitle];
}

/// Manages page navigation and app bar title.
class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState.initial());

  static const titles = [
    'Uno Dare Randomizer',
    'Favorites',
    'Settings',
  ];

  static const routes = [
    '/',
    '/favorites',
    '/settings',
  ];

  void navigate(BuildContext context, int index) {
    context.go(routes[index]);
    emit(
      NavigationState(
        selectedIndex: index,
        appBarTitle: titles[index],
      ),
    );
  }

  /// Called by router to sync state when user uses deep links / back button
  void syncWithLocation(String location) {
    // final index = routes.indexWhere((r) => location.startsWith(r));
    final index = routes.indexOf(location);
    if (index == -1) return;

    emit(
      NavigationState(
        selectedIndex: index,
        appBarTitle: titles[index],
      ),
    );
  }
}
