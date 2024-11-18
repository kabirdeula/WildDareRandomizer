import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wild_dare_randomizer/data/models/model.dart';
import 'package:wild_dare_randomizer/providers/provider.dart';
import 'package:wild_dare_randomizer/screens/home/home_mixin.dart';
import 'package:wild_dare_randomizer/utils/util.dart';

part 'favorites_mixin.dart';

class FavoritesPage extends ConsumerStatefulWidget {
  const FavoritesPage({super.key});

  @override
  ConsumerState<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends ConsumerState<FavoritesPage>
    with FavoritesMixin, HomeMixin {
  @override
  Widget build(BuildContext context) {
    final asyncRules = ref.watch(rulesProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAddRuleDialog(ref),
        child: const Icon(Icons.add),
      ),
      body: asyncRules.when(
        data: (rules) => ListView.separated(
          padding: const EdgeInsets.all(kIsWeb ? 32 : 16),
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemCount: rules.length,
          itemBuilder: (context, index) {
            final rule = rules[index];

            return buildRuleListTile(
              ref: ref,
              rule: rule,
              color: getRuleColor(index),
              index: index,
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
    );
  }
}
