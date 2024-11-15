import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wild_dare_randomizer/providers/provider.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const ListTile(
            title: Text('Dark Mode'),
            trailing: Switch(
              value: false,
              onChanged: null,
            ),
          ),
          const ListTile(
            title: Text('Grid View'),
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
