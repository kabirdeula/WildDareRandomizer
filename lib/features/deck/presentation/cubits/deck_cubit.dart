import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../rules/rules.dart';
import '../../deck.dart';

part 'deck_state.dart';
part 'deck_cubit.freezed.dart';

class DeckCubit extends Cubit<DeckState> {
  final DeckRepository deckRepository;
  final RuleRepository ruleRepository;
  final PlayedRulesLocalSource playedRulesSource;

  DeckCubit({
    required this.deckRepository,
    required this.ruleRepository,
    required this.playedRulesSource,
  }) : super(const DeckState.loading()) {
    loadDecks();
  }

  Future<void> loadDecks() async {
    try {
      emit(const DeckState.loading());

      final allRules = await ruleRepository.fetchRules();
      final decks = await deckRepository.fetchDecks();

      // * Create "All Rules" default deck if no decks exist
      if (decks.isEmpty) {
        final allRulesDeck = DeckEntity(
          id: 'all_rules',
          name: 'All Rules',
          ruleIds: allRules.map((r) => r.id).toList(),
          shuffleSeed: Random().nextInt(1000000),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        await deckRepository.saveDeck(allRulesDeck);

        final tracker = await playedRulesSource.getTracker(allRulesDeck.id);

        emit(
          DeckState.loaded(
            allRules: allRules,
            decks: [allRulesDeck],
            currentDeck: allRulesDeck,
            displayedRules: _getShuffledRules(allRules, allRulesDeck),
            playedRuleIds: tracker?.playedRuleIds ?? {},
            sessionStarted: tracker?.sessionStarted ?? DateTime.now(),
          ),
        );
      } else {
        final currentDeck = decks.firstWhere(
          (d) => d.id == 'all_rules',
          orElse: () => decks.first,
        );

        final tracker = await playedRulesSource.getTracker(currentDeck.id);

        emit(
          DeckState.loaded(
            allRules: allRules,
            decks: decks,
            currentDeck: currentDeck,
            displayedRules: _getShuffledRules(allRules, currentDeck),
            playedRuleIds: tracker?.playedRuleIds ?? {},
            sessionStarted: tracker?.sessionStarted ?? DateTime.now(),
          ),
        );
      }
    } catch (e) {
      emit(DeckState.failure(error: e));
    }
  }

  List<RuleEntity> _getShuffledRules(
    List<RuleEntity> allRules,
    DeckEntity deck,
  ) {
    final selectedRules = allRules
        .where((rule) => deck.ruleIds.contains(rule.id))
        .toList();

    final random = Random(deck.shuffleSeed);
    final shuffled = List<RuleEntity>.from(selectedRules);
    shuffled.shuffle(random);

    return shuffled;
  }

  Future<void> selectDeck(String deckId) async {
    final currentState = state;
    if (currentState is! DeckLoaded) return;

    final deck = currentState.decks.firstWhere((d) => d.id == deckId);
    final displayedRules = _getShuffledRules(currentState.allRules, deck);
    final tracker = await playedRulesSource.getTracker(deckId);

    emit(
      currentState.copyWith(
        currentDeck: deck,
        displayedRules: displayedRules,
        playedRuleIds: tracker?.playedRuleIds ?? {},
        sessionStarted: tracker?.sessionStarted ?? DateTime.now(),
      ),
    );
  }

  Future<void> shuffleDeck() async {
    final currentState = state;
    if (currentState is! DeckLoaded) return;

    final newSeed = Random().nextInt(1000000);
    final updatedDeck = currentState.currentDeck.copyWith(
      shuffleSeed: newSeed,
      updatedAt: DateTime.now(),
    );

    await deckRepository.saveDeck(updatedDeck);

    final displayedRules = _getShuffledRules(
      currentState.allRules,
      updatedDeck,
    );

    final updatedDecks = currentState.decks.map((d) {
      return d.id == updatedDeck.id ? updatedDeck : d;
    }).toList();

    emit(
      currentState.copyWith(
        currentDeck: updatedDeck,
        decks: updatedDecks,
        displayedRules: displayedRules,
      ),
    );
  }

  Future<void> toggleRulePlayed(String ruleId) async {
    final currentState = state;
    if (currentState is! DeckLoaded) return;

    final playedRuleIds = Set<String>.from(currentState.playedRuleIds);

    if (playedRuleIds.contains(ruleId)) {
      playedRuleIds.remove(ruleId);
    } else {
      playedRuleIds.add(ruleId);
    }

    final tracker = PlayedRuleTracker(
      deckId: currentState.currentDeck.id,
      playedRuleIds: playedRuleIds,
      sessionStarted: currentState.sessionStarted,
      lastUpdated: DateTime.now(),
    );

    await playedRulesSource.saveTracker(tracker);

    emit(currentState.copyWith(playedRuleIds: playedRuleIds));
  }

  Future<void> resetPlayedRules() async {
    final currentState = state;
    if (currentState is! DeckLoaded) return;

    await playedRulesSource.deleteTracker(currentState.currentDeck.id);

    emit(
      currentState.copyWith(playedRuleIds: {}, sessionStarted: DateTime.now()),
    );
  }

  Future<void> createDeck(String name, List<String> ruleIds) async {
    if (ruleIds.length < 16) {
      throw Exception('Deck must contain at least 16 rules');
    }

    final currentState = state;
    if (currentState is! DeckLoaded) return;

    final newDeck = DeckEntity(
      id: const Uuid().v4(),
      name: name,
      ruleIds: ruleIds,
      shuffleSeed: Random().nextInt(1000000),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await deckRepository.saveDeck(newDeck);

    final updatedDecks = [...currentState.decks, newDeck];

    emit(currentState.copyWith(decks: updatedDecks));
  }

  Future<void> updateDeck(
    String deckId,
    String name,
    List<String> ruleIds,
  ) async {
    if (ruleIds.length < 16) {
      throw Exception('Deck must contain at least 16 rules');
    }

    final currentState = state;
    if (currentState is! DeckLoaded) return;

    final deck = currentState.decks.firstWhere((d) => d.id == deckId);
    final updatedDeck = deck.copyWith(
      name: name,
      ruleIds: ruleIds,
      updatedAt: DateTime.now(),
    );

    await deckRepository.saveDeck(updatedDeck);

    final updatedDecks = currentState.decks.map((d) {
      return d.id == deckId ? updatedDeck : d;
    }).toList();

    final isCurrentDeck = currentState.currentDeck.id == deckId;

    emit(
      currentState.copyWith(
        decks: updatedDecks,
        currentDeck: isCurrentDeck ? updatedDeck : currentState.currentDeck,
        displayedRules: isCurrentDeck
            ? _getShuffledRules(currentState.allRules, updatedDeck)
            : currentState.displayedRules,
      ),
    );
  }

  Future<void> deleteDeck(String deckId) async {
    if (deckId == 'all_rules') {
      throw Exception('Cannot delete the default "All Rules" deck');
    }

    final currentState = state;
    if (currentState is! DeckLoaded) return;

    await deckRepository.deleteDeck(deckId);

    final updatedDecks = currentState.decks
        .where((d) => d.id != deckId)
        .toList();

    final isCurrentDeck = currentState.currentDeck.id == deckId;
    final newCurrentDeck = isCurrentDeck
        ? updatedDecks.firstWhere((d) => d.id == 'all_rules')
        : currentState.currentDeck;

    emit(
      currentState.copyWith(
        decks: updatedDecks,
        currentDeck: newCurrentDeck,
        displayedRules: isCurrentDeck
            ? _getShuffledRules(currentState.allRules, newCurrentDeck)
            : currentState.displayedRules,
      ),
    );
  }
}
