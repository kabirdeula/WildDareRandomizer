import '../../rules.dart';

abstract class RuleRepository {
  Future<List<RuleEntity>> fetchRules({bool forceRefresh = false});
  Future<void> clearRules();
}
