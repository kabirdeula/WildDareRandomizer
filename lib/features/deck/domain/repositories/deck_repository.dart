import '../../deck.dart';

abstract class DeckRepository {
  Future<List<DeckEntity>> fetchDecks();
  Future<DeckEntity?> getDeck(String id);
  Future<void> saveDeck(DeckEntity deck);
  Future<void> deleteDeck(String id);
  Future<void> clearDecks();
}
