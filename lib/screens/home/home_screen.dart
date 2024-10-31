import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wild_dare_randomizer/providers/provider.dart';
import 'package:wild_dare_randomizer/screens/home/widgets/home_widget.dart';
import 'package:wild_dare_randomizer/utils/enums/routes.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rulesAsyncValue = ref.watch(rulesProvider);
    final bool isGridView = ref.watch<bool>(viewModeProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(ruleRepositoryProvider).shuffleRules().then(
                (_) => ref.refresh(rulesProvider),
              );
        },
        child: const Icon(Icons.shuffle),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Uno Dare Randomizer'),
            actions: [
              IconButton(
                onPressed: () => context.push(Routes.rules.path),
                icon: const Icon(Icons.rule),
              ),
              ViewSettingsMenu(isGridView: isGridView),
            ],
          ),
          SliverFillRemaining(
            child: rulesAsyncValue.when(
              data: (rules) => isGridView
                  ? RuleGridView(rules: rules)
                  : RuleListView(rules: rules),
              error: (error, stack) => Center(
                child: Text('Error:$error'),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
