import 'package:hive_ce/hive.dart';

import '../../../../../core/core.dart';
import '../../../rules.dart';

class PlayedRulesLocalSource {
  static const _boxName = HiveBoxes.playedRuleTracker;

  Future<Box<PlayedRuleTracker>> get _box async =>
      await HiveService.openBox<PlayedRuleTracker>(boxName: _boxName);

  Future<void> saveTracker(PlayedRuleTracker tracker) async {
    final box = await _box;
    await box.put(tracker.deckId, tracker);
  }

  Future<PlayedRuleTracker?> getTracker(String deckId) async {
    final box = await _box;
    return box.get(deckId);
  }

  Future<void> deleteTracker(String deckId) async {
    final box = await _box;
    await box.delete(deckId);
  }
}
