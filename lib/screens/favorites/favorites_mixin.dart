part of 'favorites_page.dart';

mixin FavoritesMixin on State<FavoritesPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  void addCustomRule(WidgetRef ref) async {
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
      Navigator.pop(context);
    } else {
      SnackbarUtil.showSnackbar(
        context,
        'Please enter a valid rule title and description. Rule title must be at least 3 characters long and description must be at least 10 characters long.',
      );
    }
  }

  void deleteCustomRule({required int index, required WidgetRef ref}) async {
    await ref.read(ruleRepositoryProvider).deleteRule(index);

    if (!mounted) return;
    ref.invalidate(rulesProvider);

    SnackbarUtil.showSnackbar(context, 'Rule deleted');
  }

  void editCustomRule({
    required int index,
    required WidgetRef ref,
  }) async {
    final editedRule = RuleModel(
      title: titleController.text,
      description: descriptionController.text,
    );
    await ref.read(ruleRepositoryProvider).updateRule(index, editedRule);

    if (!mounted) return;
    ref.invalidate(rulesProvider);

    SnackbarUtil.showSnackbar(context, 'Rule edited');
  }

  customDialog({
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

  void showAddRuleDialog(WidgetRef ref) {
    customDialog(
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
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            addCustomRule(ref);
          },
          child: const Text('Save'),
        )
      ],
    );
  }

  void showEditRuleDialog({
    required WidgetRef ref,
    required int index,
    required RuleModel rule,
  }) {
    titleController.text = rule.title;
    descriptionController.text = rule.description;

    customDialog(
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
            editCustomRule(
              index: index,
              ref: ref,
            );
            Navigator.pop(context);
          },
          child: const Text('Save'),
        ),
      ],
    );
  }

  void showDeleteRuleDialog({required WidgetRef ref, required int index}) {
    customDialog(
      title: 'Delete Rule',
      content: const Text('Are you sure you want to delete this rule?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            deleteCustomRule(index: index, ref: ref);
            Navigator.pop(context);
          },
          child: const Text('Delete'),
        ),
      ],
    );
  }
}
