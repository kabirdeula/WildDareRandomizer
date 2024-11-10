import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        children: const [
          ListTile(
            title: Text('Dark Mode'),
            trailing: Switch(
              value: false,
              onChanged: null,
            ),
          ),
          ListTile(
            title: Text('Grid View'),
          ),
          ListTile(
            title: Text('Clear All Rules'),
          ),
          ListTile(
            title: Text('Import Rules'),
          ),
          ListTile(
            title: Text('Export Rules'),
          ),
        ],
      ),
    );
  }
}
