import 'package:flutter/material.dart';
import '../../utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rulesCubit = context.read<RulesCubit>();

    return Scaffold(
      body: ListView(
        children: [
          // ListTile(
          //   title: const Text('Dark Mode'),
          //   trailing: Switch(
          //     value: settings.isDarkMode,
          //     onChanged: (_) => settingsNotifier.toggleTheme(),
          //   ),
          // ),
          // ListTile(
          //   title: const Text('Grid View'),
          //   trailing: Switch(
          //     value: settings.isGridView,
          //     onChanged: (value) => settingsNotifier.toggleViewMode(),
          //   ),
          // ),

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
              SnackbarUtil.showSnackbar(context, 'Rules Imported Successfully');
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
      ),
    );
  }
}