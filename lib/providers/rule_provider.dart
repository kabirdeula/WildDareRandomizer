import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wild_dare_randomizer/data/models/model.dart';
import 'package:wild_dare_randomizer/data/repositories/repository.dart';

final ruleRepositoryProvider = Provider<RuleRepository>((ref) {
  return RuleRepository();
});

final rulesProvider = FutureProvider<List<RuleModel>>((ref) async {
  final repository = ref.read(ruleRepositoryProvider);
  return repository.fetchAllRules();
});
