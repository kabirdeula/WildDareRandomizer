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
                return isGridView ? buildGridView(rules) : buildListView(rules);
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
      itemCount: rules.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('${index + 1}: ${rules[index].title}'),
          subtitle: Text(rules[index].description),
        );
      },
    );
  }

  Widget buildGridView(List<RuleModel> rules) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: rules.length,
      itemBuilder: (context, index) {
        return Card(
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
