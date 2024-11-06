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
}
