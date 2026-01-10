import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/model.dart';
import '../data/repositories/repository.dart';

/// Base class for all rule-related states.
abstract class RulesState extends Equatable {
  const RulesState();

  @override
  List<Object?> get props => [];
}

/// State emitted while rules are being loaded or mutated.
class RulesLoading extends RulesState {}

/// State emitted when rules are successfully loaded.
class RulesLoaded extends RulesState {
  final List<RuleModel> rules;

  const RulesLoaded(this.rules);

  @override
  List<Object?> get props => [rules];
}

/// State emitted when a rule operation fails.
class RulesFailure extends RulesState {
  final Object error;

  const RulesFailure(this.error);

  @override
  List<Object?> get props => [error];
}

/// Handles all rule-related business logic.
///
/// Responsibilities:
/// - Load rules
/// - Add, edit, delete rules
/// - Shuffle rules
/// - Import/export rules
class RulesCubit extends Cubit<RulesState> {
  final RuleRepository repository;

  RulesCubit({required this.repository}) : super(RulesLoading()) {
    loadRules();
  }

  Future<void> loadRules() async {
    try {
      emit(RulesLoading());
      final rules = await repository.fetchAllRules();
      emit(RulesLoaded(rules));
    } catch (e) {
      emit(RulesFailure(e));
    }
  }

  Future<void> addRule(RuleModel rule) async {
    try {
      await repository.addRule(rule);
      await loadRules();
    } catch (e) {
      emit(RulesFailure(e));
    }
  }

  Future<void> updateRule(int index, RuleModel rule) async {
    try {
      await repository.updateRule(index, rule);
      await loadRules();
    } catch (e) {
      emit(RulesFailure(e));
    }
  }

  Future<void> deleteRule(int index) async {
    try {
      await repository.deleteRule(index);
      await loadRules();
    } catch (e) {
      emit(RulesFailure(e));
    }
  }

  Future<void> importRules() async {
    emit(RulesLoading());
    try {
      final rules = await repository.importData();
      emit(RulesLoaded(rules));
    } catch (e) {
      emit(RulesFailure(e));
    }
  }

  Future<void> exportRules() async {
    emit(RulesLoading());
    try {
      await repository.exportData();
      // emit(RulesLoaded(rules));
    } catch (e) {
      emit(RulesFailure(e));
    }
  }

  Future<void> shuffleRules() async {
    try {
      emit(RulesLoading());
      final rules = await repository.shuffleRules();
      emit(RulesLoaded(rules));
    } catch (e) {
      emit(RulesFailure(e));
    }
  }

  Future<void> clearRules() async {
    try {
      await repository.clearRules();
      await loadRules();
    } catch (e) {
      emit(RulesFailure(e));
    }
  }
}
