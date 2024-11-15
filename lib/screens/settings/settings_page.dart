import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wild_dare_randomizer/providers/provider.dart';

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
            onTap: () => ref.read(ruleRepositoryProvider).clearRules().then(
                  (value) => ref.refresh(rulesProvider),
                ),
          ),
          const ListTile(
            title: Text('Import Rules'),
          ),
          const ListTile(
            title: Text('Export Rules'),
          ),
        ],
      ),
    );
  }
}
