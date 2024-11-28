import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wild_dare_randomizer/providers/provider.dart';
import 'package:wild_dare_randomizer/screens/screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);
    final pageController = ref.watch(pageControllerProvider);
    final appBarTitle = ref.watch(appBarTitleProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          appBarTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
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
          ),
        ],
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          ref.read(selectedIndexProvider.notifier).state = index;
          switch (index) {
            case 0:
              ref.read(appBarTitleProvider.notifier).state =
                  'Uno Dare Randomizer';
              break;
            case 1:
              ref.read(appBarTitleProvider.notifier).state = 'Favorites';
              break;
            case 2:
              ref.read(appBarTitleProvider.notifier).state = 'Settings';
              break;
          }
        },
        children: const [
          RulesPage(),
          FavoritesPage(),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          ref.read(selectedIndexProvider.notifier).state = index;
          pageController.jumpToPage(index);
        },
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
  }
}
