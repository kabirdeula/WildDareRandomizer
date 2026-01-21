import 'package:hive_ce/hive.dart';

import '../../../../../core/core.dart';
import '../../../deck.dart';

class DeckLocalSource {
  static const _boxName = HiveBoxes.deckEntity;

  Future<Box<DeckEntity>> get _box async =>
      await HiveService.openBox<DeckEntity>(boxName: _boxName);

  Future<void> saveDeck(DeckEntity deck) async {
    final box = await _box;
    await box.put(deck.id, deck);
  }

  Future<List<DeckEntity>> getDecks() async {
    final box = await _box;
    return box.values.toList();
  }

  Future<DeckEntity?> getDeck(String id) async {
    final box = await _box;
    return box.get(id);
  }

  Future<void> deleteDeck(String id) async {
    final box = await _box;
    await box.delete(id);
  }

  Future<void> clearDecks() async {
    final box = await _box;
    await box.clear();
  }
}