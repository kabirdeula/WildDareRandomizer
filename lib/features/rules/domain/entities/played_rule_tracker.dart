import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'played_rule_tracker.freezed.dart';
part 'played_rule_tracker.g.dart';

@freezed
@HiveType(typeId: 3)
abstract class PlayedRuleTracker with _$PlayedRuleTracker {
  const factory PlayedRuleTracker({
    @HiveField(0) required String deckId,
    @HiveField(1) required Set<String> playedRuleIds,
    @HiveField(2) required DateTime sessionStarted,
    @HiveField(3) required DateTime lastUpdated,
  }) = _PlayedRuleTracker;

  factory PlayedRuleTracker.fromJson(Map<String, dynamic> json) =>
      _$PlayedRuleTrackerFromJson(json);
}
