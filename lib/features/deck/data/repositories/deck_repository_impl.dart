import '../../deck.dart';

class DeckRepositoryImpl implements DeckRepository {
  final DeckLocalSource localSource;

  DeckRepositoryImpl({required this.localSource});

  @override
  Future<List<DeckEntity>> fetchDecks() async {
    return await localSource.getDecks();
  }

  @override
  Future<DeckEntity?> getDeck(String id) async {
    return await localSource.getDeck(id);
  }

  @override
  Future<void> saveDeck(DeckEntity deck) async {
    await localSource.saveDeck(deck);
  }

  @override
  Future<void> deleteDeck(String id) async {
    await localSource.deleteDeck(id);
  }

  @override
  Future<void> clearDecks() async {
    await localSource.clearDecks();
  }
}