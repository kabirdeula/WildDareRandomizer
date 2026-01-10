import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home/widgets/home_widget.dart';

import '../cubits/cubit.dart';

class RulesScreen extends StatelessWidget {
  const RulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<RulesCubit>().shuffleRules(),
        child: const Icon(Icons.shuffle),
      ),
      body: BlocBuilder<RulesCubit, RulesState>(builder: (context, state) {
        if (state is RulesLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is RulesFailure) {
          return Center(child: Text('Error: ${state.error}'));
        }

        final rules = (state as RulesLoaded).rules;
        return RuleGridView(rules: rules);
      }),
    );
  }
}
