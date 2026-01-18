import '../../rules.dart';

class RuleRepositoryImpl implements RuleRepository {
  final RuleLocalSource localSource;
  final RuleAssetSource assetSource;

  RuleRepositoryImpl({required this.localSource, required this.assetSource});

  @override
  Future<List<RuleEntity>> fetchRules({bool forceRefresh = false}) async {
    if (!forceRefresh) {
      final cached = await localSource.getRules();
      if (cached.isNotEmpty) return cached;
    }

    final rules = await assetSource.loadRules();
    await localSource.saveRules(rules);
    return rules;
  }

  @override
  Future<void> clearRules() async => await localSource.clearRules();
}
