import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../rules.dart';

part 'rules_state.dart';
part 'rules_cubit.freezed.dart';

class RulesCubit extends Cubit<RulesState> {
  final RuleRepository repository;

  RulesCubit({required this.repository}) : super(RulesState.loading()) {
    loadRules();
  }

  Future<void> loadRules() async {
    try {
      emit(RulesState.loading());

      final rules = await repository.fetchRules();

      emit(RulesState.loaded(rules: rules));
    } catch (e) {
      emit(RulesState.failure(error: e));
    }
  }
}
