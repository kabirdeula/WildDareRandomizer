import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wild_dare_randomizer/data/models/model.dart';
import 'package:wild_dare_randomizer/data/repositories/repository.dart';
import 'package:wild_dare_randomizer/providers/provider.dart';

class RulesNotifier extends StateNotifier<AsyncValue<List<RuleModel>>> {
  final RuleRepository _ruleRepository;

  RulesNotifier(this._ruleRepository) : super(const AsyncValue.loading()) {
    loadRules();
  }

  Future<void> loadRules() async {
    try {
      final rules = await _ruleRepository.fetchAllRules();
      state = AsyncValue.data(rules);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> importRules() async {
    try {
      final importedRules = await _ruleRepository.importData();
      state = AsyncValue.data(importedRules);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> shuffleRules() async {
    try {
      final shuffledRules = await _ruleRepository.shuffleRules();
      state = AsyncValue.data(shuffledRules);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

final rulesNotifier =
    StateNotifierProvider<RulesNotifier, AsyncValue<List<RuleModel>>>((ref) {
  final repository = ref.read(ruleRepositoryProvider);
  return RulesNotifier(repository);
});
