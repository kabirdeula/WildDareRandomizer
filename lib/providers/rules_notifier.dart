import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wild_dare_randomizer/data/models/model.dart';
import 'package:wild_dare_randomizer/data/repositories/repository.dart';
import 'package:wild_dare_randomizer/providers/provider.dart';

/// A [StateNotifier] that manages the state of a list of [RuleModel] items.
///
/// This notifier is responsible for loading, importing, and shuffling the rules
/// using the [RuleRepository]. It handles any errors and updates the state accordingly.
class RulesNotifier extends StateNotifier<AsyncValue<List<RuleModel>>> {
  final RuleRepository _ruleRepository;

  /// Creates an instance of [RulesNotifier] with an initial loading state
  /// and immediately loads the rules.
  ///
  /// The [RuleRepository] is required to interact with the data source for rule operations.
  RulesNotifier(this._ruleRepository) : super(const AsyncValue.loading()) {
    loadRules();
  }

  /// Loads all rules form the repository and updates the state.
  ///
  /// If successful, the state is set to [AsyncValue.data] containing the list of rules.
  /// If an error occurs, the state is set to [AsyncValue.error] with the error details.
  Future<void> loadRules() async {
    try {
      final rules = await _ruleRepository.fetchAllRules();
      state = AsyncValue.data(rules);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  /// Imports rules from an external source and updates the state.
  ///
  /// If successful, the state is set to [AsyncValue.data] containing the imported rules.
  /// If an error occurs, the state is set to [AsyncValue.error] with the error details.
  Future<void> importRules() async {
    try {
      final importedRules = await _ruleRepository.importData();
      state = AsyncValue.data(importedRules);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  /// Shuffles the list of rules and updates the state.
  ///
  /// If successful, the state is set to [AsyncValue.data] with the shuffled list of rules.
  /// If an error occurs, the state is set to [AsyncValue.error] with the error details.
  Future<void> shuffleRules() async {
    try {
      final shuffledRules = await _ruleRepository.shuffleRules();
      state = AsyncValue.data(shuffledRules);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

/// A [StateNotifierProvider] for managing and accessing the state of rules.
///
/// Provides an instance of [RulesNotifier] to allow state management operations
/// on a list of [RuleModel] items. It can be used to load, import, and shuffle rules.
final rulesNotifier =
    StateNotifierProvider<RulesNotifier, AsyncValue<List<RuleModel>>>((ref) {
  final repository = ref.read(ruleRepositoryProvider);
  return RulesNotifier(repository);
});
