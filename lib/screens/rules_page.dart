import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wild_dare_randomizer/providers/provider.dart';
import 'package:wild_dare_randomizer/screens/home/widgets/home_widget.dart';

class RulesPage extends ConsumerWidget {
  const RulesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rulesAsyncValue = ref.watch(rulesProvider);
    final settings = ref.watch(settingsProvider);
    final bool isGridView = settings.isGridView;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(ruleRepositoryProvider).shuffleRules().then(
              (value) => ref.refresh(rulesProvider),
            ),
            child: const Icon(Icons.shuffle),
      ),
      body: Column(
        children: [
          Expanded(
            child: rulesAsyncValue.when(
              data: (rules) => isGridView
                  ? RuleGridView(rules: rules)
                  : RuleListView(rules: rules),
              error: (error, stack) => Center(
                child: Text('Error: $error'),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
