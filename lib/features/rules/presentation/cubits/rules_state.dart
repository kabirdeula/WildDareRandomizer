part of 'rules_cubit.dart';

@freezed
class RulesState with _$RulesState {
  const factory RulesState.loading() = RulesLoading;

  const factory RulesState.loaded({required List<RuleEntity> rules}) =
      RulesLoaded;

  const factory RulesState.failure({required Object error}) = RulesFailure;
}
