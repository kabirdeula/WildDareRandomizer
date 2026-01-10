import 'package:flutter/material.dart';
import '../../data/models/model.dart';
import '../../utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rulesCubit = context.read<RulesCubit>();
    final settingsCubit = context.read<SettingsCubit>();

    return Scaffold(
      body: BlocBuilder<SettingsCubit, SettingsModel>(
        builder: (context, state) {
          return ListView(
            children: [
              ListTile(
                title: const Text('Dark Mode'),
                trailing: Switch(
                  value: state.isDarkMode,
                  onChanged: (_) => settingsCubit.toggleTheme(),
                ),
              ),
              ListTile(
                title: const Text('Grid View'),
                trailing: Switch(
                  value: state.isGridView,
                  onChanged: (value) => settingsCubit.toggleViewMode(),
                ),
              ),
              ListTile(
                title: const Text('Clear All Rules'),
                onTap: () {
                  rulesCubit.clearRules();
                  SnackbarUtil.showSnackbar(context, 'All rules cleared');
                },
              ),
              ListTile(
                title: const Text('Import Rules'),
                onTap: () {
                  rulesCubit.importRules();
                  SnackbarUtil.showSnackbar(
                      context, 'Rules Imported Successfully');
                },
              ),
              ListTile(
                title: const Text('Export Rules'),
                onTap: () {
                  rulesCubit.exportRules();
                  SnackbarUtil.showSnackbar(context, 'Rules Exported');
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
