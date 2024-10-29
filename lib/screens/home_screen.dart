import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wild_dare_randomizer/data/models/model.dart';
import 'package:wild_dare_randomizer/providers/provider.dart';

import 'screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rulesAsyncValue = ref.watch(rulesProvider);
    final bool isGridView = ref.watch<bool>(viewModeProvider);
    final themeNotifier = ref.read(themeProvider.notifier);
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;

    void toggleViewMode() {
      ref.read(viewModeProvider.notifier).state = !isGridView;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Uno Dare Randomizer'),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              switch (value) {
                case 0:
                  toggleViewMode();
                  break;
                case 1:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CustomRuleScreen()),
                  );
                  break;
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 0,
                child: Row(
                  children: [
                    Icon(isGridView ? Icons.view_list : Icons.grid_view),
                    const SizedBox(width: 8),
                    Text(
                      isGridView
                          ? 'Switch to List View'
                          : 'Switch to Grid View',
                    ),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    Icon(Icons.settings),
                    SizedBox(width: 8),
                    Text('Custom Rules'),
                  ],
                ),
              ),
              PopupMenuItem(
                child: Row(
                  children: [
                    const Text('Dark Mode'),
                    const Spacer(),
                    Switch(
                      value: isDarkMode,
                      onChanged: (value) {
                        themeNotifier.toggleTheme();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: rulesAsyncValue.when(
              data: (rules) {
                return isGridView
                    ? buildGridView(rules, context)
                    : buildListView(rules);
              },
              error: (error, stack) => Center(
                child: Text('Error : $error'),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.refresh(rulesProvider),
        child: const Icon(Icons.shuffle),
      ),
    );
  }

  Widget buildListView(List<RuleModel> rules) {
    return ListView.builder(
      itemCount: rules.length.clamp(0, 16),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('${index + 1}: ${rules[index].title}'),
          subtitle: Text(rules[index].description),
        );
      },
    );
  }

  Widget buildGridView(List<RuleModel> rules, BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = (screenWidth < 600)
        ? 2
        : (screenWidth < 1200)
            ? 4
            : 6;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: rules.length.clamp(0, 16),
      itemBuilder: (context, index) {
        return Card(
          elevation: 2,
          color: Colors.white54,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${index + 1}: ${rules[index].title}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  rules[index].description,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
