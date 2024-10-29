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

    void toggleViewMode() {
      ref.read(viewModeProvider.notifier).state = !isGridView;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Uno Dare Randomizer'),
        actions: [
          IconButton(
            onPressed: toggleViewMode,
            icon: isGridView
                ? const Icon(Icons.view_list)
                : const Icon(Icons.grid_view),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CustomRuleScreen()),
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: rulesAsyncValue.when(
              data: (rules) {
                // ref.read(randomizedRuleProvider.notifier).state = rules;
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              // onPressed: randomizeRules,
              onPressed: () => ref.refresh(rulesProvider),
              child: const Text('Randomize Rules'),
            ),
          ),
        ],
      ),
    );
  }

  
  Widget buildListView(List<RuleModel> rules) {
    return ListView.builder(
      itemCount: 16,
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

    // Set the number of columns based on screen width
    int crossAxisCount;
    if (screenWidth < 600) {
      // Mobile view: 2 columns
      crossAxisCount = 2;
    } else if (screenWidth < 1200) {
      // Tablet view: 4 columns
      crossAxisCount = 4;
    } else {
      // Desktop view: 6 columns
      crossAxisCount = 6;
    }
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: 16,
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
