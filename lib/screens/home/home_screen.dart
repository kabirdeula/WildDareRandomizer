import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wild_dare_randomizer/data/models/model.dart';
import 'package:wild_dare_randomizer/providers/provider.dart';
import 'package:wild_dare_randomizer/screens/home/widgets/home_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rulesAsyncValue = ref.watch(rulesProvider);
    final bool isGridView = ref.watch<bool>(viewModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Uno Dare Randomizer'),
        actions: [
          ViewSettingsMenu(isGridView: isGridView),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: rulesAsyncValue.when(
              data: (rules) {
                return isGridView
                    ? buildGridView(rules, context)
                    : RuleListView(rules: rules);
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
