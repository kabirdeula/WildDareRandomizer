import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wild_dare_randomizer/data/models/model.dart';
import 'package:wild_dare_randomizer/utils/util.dart';

import '../../cubits/cubit.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  RulesCubit get rulesCubit => context.read<RulesCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAddRuleDialog(context),
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<RulesCubit, RulesState>(builder: (context, state) {
        if (state is RulesLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is RulesFailure) {
          return Center(child: Text('Error: ${state.error}'));
        }

        final rules = (state as RulesLoaded).rules;

        return ListView.separated(
          padding: const EdgeInsets.all(kIsWeb ? 32 : 16),
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemCount: rules.length,
          itemBuilder: (context, index) {
            final rule = rules[index];

            return buildRuleListTile(
              rule: rule,
              color: getRuleColor(rule.level),
              index: index,
            );
          },
        );
      }),
    );
  }

  Color getRuleColor(String level) {
    // log.d(level);
    switch (level.toLowerCase()) {
      case 'extreme':
        return Colors.red;
      case 'hard':
        return Colors.yellow;
      case 'medium':
        return Colors.blue;
      case 'easy':
        return Colors.green;
      default:
        return Colors.purple;
    }
  }

  ListTile buildRuleListTile({
    required RuleModel rule,
    required Color color,
    required int index,
  }) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      tileColor: color,
      title: Text(
        rule.title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(rule.description),
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(
          '${index + 1}',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      trailing: Wrap(
        spacing: 8,
        children: [
          IconButton(
            onPressed: () => showEditRuleDialog(
              index: index,
              rule: rule,
            ),
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () => showDeleteRuleDialog(index),
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }

  void showEditRuleDialog({
    required int index,
    required RuleModel rule,
  }) {
    titleController.text = rule.title;
    descriptionController.text = rule.description;

    customDialog(
      context: context,
      title: 'Edit Rule',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleController,
          ),
          TextField(
            controller: descriptionController,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            editCustomRule(index);
            Navigator.pop(context);
          },
          child: const Text('Save'),
        ),
      ],
    );
  }

  void editCustomRule(int index) {
    final rule = RuleModel(
        title: titleController.text,
        description: descriptionController.text,
        level: '');

    rulesCubit.updateRule(index, rule);
    context.pop();
    SnackbarUtil.showSnackbar(context, 'Rule updated');
  }

  void showDeleteRuleDialog(int index) {
    customDialog(
      context: context,
      title: 'Delete Rule',
      content: const Text('Are you sure you want to delete this rule?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            deleteCustomRule(index);
            Navigator.pop(context);
          },
          child: const Text('Delete'),
        ),
      ],
    );
  }

  void deleteCustomRule(int index) {
    rulesCubit.deleteRule(index);
    context.pop();
    SnackbarUtil.showSnackbar(context, 'Rule deleted');
  }

  customDialog({
    required BuildContext context,
    required String title,
    Widget? content,
    List<Widget>? actions,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: content,
          actions: actions,
        );
      },
    );
  }

  void showAddRuleDialog(BuildContext context) {
    customDialog(
      context: context,
      title: 'Add Rule',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: 'Rule Title',
            ),
          ),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(
              labelText: 'Rule Description',
            ),
          )
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => addCustomRule(context),
          child: const Text('Save'),
        )
      ],
    );
  }

  void addCustomRule(BuildContext context) {
    if (!ValidationUtils.isValidRuleTitle(titleController.text) ||
        !ValidationUtils.isValidRuleDescription(descriptionController.text)) {
      SnackbarUtil.showSnackbar(context, 'Invalid rule data');
      return;
    }

    final rule = RuleModel(
        title: titleController.text,
        description: descriptionController.text,
        level: '');

    rulesCubit.addRule(rule);

    titleController.clear();
    descriptionController.clear();
    context.pop();
    SnackbarUtil.showSnackbar(context, 'Rule added');
  }
}
