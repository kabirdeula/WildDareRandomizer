import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wild_dare_randomizer/data/models/model.dart';
import 'package:wild_dare_randomizer/data/repositories/repository.dart';

/// A provider that supplies an instance of [RuleRepository].
///
/// This allows access to data fetching and management functions for rules across the app.
final ruleRepositoryProvider = Provider<RuleRepository>((ref) {
  return RuleRepository();
});

/// A provider that fetches a list of [RuleModel] asynchronously.
///
/// It uses the [RuleRepository] to load all rules and provides them as a [Future].
/// This provider can be used to display or manage rules within the app.
final rulesProvider = FutureProvider<List<RuleModel>>((ref) async {
  final repository = ref.read(ruleRepositoryProvider);
  return repository.fetchAllRules();
});
