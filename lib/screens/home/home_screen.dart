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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Uno Dare Randomizer',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) =>
            ref.read(selectedIndexProvider.notifier).state = index,
        children: const [
          RulesPage(),
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
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:wild_dare_randomizer/providers/provider.dart';
// import 'package:wild_dare_randomizer/screens/home/widgets/home_widget.dart';
// import 'package:wild_dare_randomizer/utils/enums/routes.dart';

// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final rulesAsyncValue = ref.watch(rulesProvider);
//     final settings = ref.watch(settingsProvider);
//     final bool isGridView = settings.isGridView;

//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           'Uno Dare Randomizer',
//           style: Theme.of(context).textTheme.titleLarge,
//         ),
//         actions: [
//           IconButton(
//             onPressed: () => context.push(Routes.rules.path),
//             icon: const Icon(Icons.rule),
//           ),
//           const ViewSettingsMenu(),
//         ],
//       ),
//     );
//   }
// }
