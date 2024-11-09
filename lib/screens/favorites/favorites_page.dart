import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wild_dare_randomizer/data/models/model.dart';
import 'package:wild_dare_randomizer/providers/provider.dart';
import 'package:wild_dare_randomizer/utils/util.dart';

part 'favorites_mixin.dart';

class FavoritesPage extends ConsumerStatefulWidget {
  const FavoritesPage({super.key});

  @override
  ConsumerState<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends ConsumerState<FavoritesPage>
    with FavoritesMixin {
  @override
  Widget build(BuildContext context) {
    final asyncRules = ref.watch(rulesProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAddRuleDialog(ref),
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {}, child: const Text('Import Rule')),
              ElevatedButton(
                onPressed: () => ref.read(ruleRepositoryProvider).exportData(),
                child: const Text('Export Rule'),
              ),
            ],
          ),
          Expanded(
            child: asyncRules.when(
              data: (rules) => ListView.builder(
                reverse: true,
                itemCount: rules.length,
                itemBuilder: (context, index) {
                  final rule = rules[index];

                  return ListTile(
                    title: Text(rule.title),
                    subtitle: Text(rule.description),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () => showEditRuleDialog(
                            ref: ref,
                            index: index,
                            rule: rule,
                          ),
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () =>
                              showDeleteRuleDialog(index: index, ref: ref),
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                  );
                },
              ),
              error: (error, state) => Center(
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
