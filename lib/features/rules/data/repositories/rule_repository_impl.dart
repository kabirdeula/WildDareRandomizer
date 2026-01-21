import '../../rules.dart';

class RuleRepositoryImpl implements RuleRepository {
  final RuleLocalSource localSource;
  final RuleAssetSource assetSource;
  final RuleRemoteSource remoteSource;

  RuleRepositoryImpl({
    required this.localSource,
    required this.assetSource,
    required this.remoteSource,
  });

  @override
  Future<List<RuleEntity>> fetchRules({bool forceRefresh = false}) async {
    if (!forceRefresh) {
      final cached = await localSource.getRules();
      if (cached.isNotEmpty) return cached;
    }

    try {
      // * Primary Source
      final remoteRules = await remoteSource.fetchRules();
      await localSource.saveRules(remoteRules);
      return remoteRules;
    } catch (_) {
      // ! Fallback
      final assetRules = await assetSource.loadRules();
      await localSource.saveRules(assetRules);
      return assetRules;
    }
  }

  @override
  Future<void> clearRules() async => await localSource.clearRules();
}
