import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wild_dare_randomizer/providers/provider.dart';
import 'package:wild_dare_randomizer/utils/util.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final SettingsNotifier = ref.read(settingsProvider.notifier);

    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: settings.isDarkMode,
              onChanged: (_) => SettingsNotifier.toggleTheme(),
            ),
          ),
          ListTile(
            title: const Text('Grid View'),
            trailing: Switch(
              value: settings.isGridView,
              onChanged: (value) => SettingsNotifier.toggleViewMode(),
            ),
          ),
          ListTile(
            title: const Text('Clear All Rules'),
            onTap: () async {
              ref.read(ruleRepositoryProvider).clearRules().then(
                    (_) => ref.invalidate(rulesProvider),
                  );
              SnackbarUtil.showSnackbar(context, 'All rules cleared');
            },
          ),
          ListTile(
            title: const Text('Import Rules'),
            onTap: () {
              ref.read(ruleRepositoryProvider).importData().then(
                    (_) => ref.refresh(rulesProvider),
                  );
              SnackbarUtil.showSnackbar(context, 'Rules Imported Successfully');
            },
          ),
          ListTile(
            title: const Text('Export Rules'),
            onTap: () {
              ref.read(ruleRepositoryProvider).exportData();
              SnackbarUtil.showSnackbar(context, 'Rules Exported');
            },
          ),
        ],
      ),
    );
  }
}
