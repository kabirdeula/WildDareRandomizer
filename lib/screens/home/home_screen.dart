import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/navigation_cubit.dart';

class HomeScreen extends StatelessWidget {
  final Widget child;
  const HomeScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        final cubit = context.read<NavigationCubit>();

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              state.appBarTitle,
              style: textTheme.titleLarge,
            ),
            actions: const [
              _RuleButton(),
            ],
          ),
          body: child,
          bottomNavigationBar: NavigationBar(
            selectedIndex: state.selectedIndex,
            onDestinationSelected: (index) => cubit.navigate(context, index),
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.favorite_outline),
                selectedIcon: Icon(Icons.favorite),
                label: 'Favorites',
              ),
              NavigationDestination(
                icon: Icon(Icons.settings_outlined),
                selectedIcon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        );
      },
    );
  }
}

class _RuleButton extends StatelessWidget {
  const _RuleButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Rule Levels'),
              content: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Icon(Icons.circle, color: Colors.green), // Easy
                      SizedBox(width: 10),
                      Text('Easy: Green'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.circle, color: Colors.blue), // Medium
                      SizedBox(width: 10),
                      Text('Medium: Blue'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.circle, color: Colors.orange), // Hard
                      SizedBox(width: 10),
                      Text('Hard: Yellow'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.circle, color: Colors.red), // Extreme
                      SizedBox(width: 10),
                      Text('Extreme: Red'),
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'),
                ),
              ],
            );
          },
        );
      },
      icon: const Icon(Icons.question_mark_rounded),
    );
  }
}
