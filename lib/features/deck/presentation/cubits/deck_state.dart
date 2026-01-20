part of 'deck_cubit.dart';

@freezed
class DeckState with _$DeckState {
  const factory DeckState.loading() = DeckLoading;

  const factory DeckState.loaded({
    required List<RuleEntity> allRules,
    required List<DeckEntity> decks,
    required DeckEntity currentDeck,
    required List<RuleEntity> displayedRules,
    required Set<String> playedRuleIds,
    required DateTime sessionStarted,
  }) = DeckLoaded;

  const factory DeckState.failure({required Object error}) = DeckFailure;
}
