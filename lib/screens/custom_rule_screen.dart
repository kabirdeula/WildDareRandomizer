import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wild_dare_randomizer/data/models/model.dart';
import 'package:wild_dare_randomizer/providers/provider.dart';
import 'package:wild_dare_randomizer/utils/util.dart';

class CustomRuleScreen extends ConsumerStatefulWidget {
  const CustomRuleScreen({super.key});

  @override
  ConsumerState<CustomRuleScreen> createState() => _CustomRuleScreenState();
}

class _CustomRuleScreenState extends ConsumerState<CustomRuleScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void addCustomRule() async {
    if (ValidationUtils.isValidRuleTitle(titleController.text) &&
        ValidationUtils.isValidRuleDescription(descriptionController.text)) {
      final newRule = RuleModel(
        title: titleController.text,
        description: descriptionController.text,
      );

      await ref.read(ruleRepositoryProvider).addRule(newRule);
      if (!mounted) return;
      ref.invalidate(rulesProvider);

      titleController.clear();
      descriptionController.clear();

      SnackbarUtil.showSnackbar(context, 'Rule added');
    }
  }

  void deleteCustomRule(int index) async {
    await ref.read(ruleRepositoryProvider).deleteRule(index);
    ref.invalidate(rulesProvider);
  }

  void editCustomRule(int index, RuleModel rule) async {
    await ref.read(ruleRepositoryProvider).updateRule(index, rule);
    ref.invalidate(rulesProvider);
  }

  @override
  Widget build(BuildContext context) {
    final asyncRules = ref.watch(rulesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Rules'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Rule Title'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration:
                      const InputDecoration(labelText: 'Rule Description'),
                ),
                ElevatedButton(
                  onPressed: addCustomRule,
                  child: const Text('Add Rule'),
                ),
              ],
            ),
          ),
          Expanded(
            child: asyncRules.when(
              data: (rules) => ListView.builder(
                itemCount: rules.length,
                itemBuilder: (context, index) {
                  final rule = rules[index];
                  return ListTile(
                    title: Text(rule.title),
                    subtitle: Text(rule.description),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            titleController.text = rule.title;
                            descriptionController.text = rule.description;

                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Edit Rule'),
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
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      final editedRule = RuleModel(
                                        title: titleController.text,
                                        description: descriptionController.text,
                                      );
                                      editCustomRule(index, editedRule);
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Save'),
                                  )
                                ],
                              ),
                            );
                          },
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => deleteCustomRule(index),
                        )
                      ],
                    ),
                  );
                },
              ),
              error: (error, state) => Center(
                child: Text('Error: $error'),
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
          ),
        ],
      ),
    );
  }
}
