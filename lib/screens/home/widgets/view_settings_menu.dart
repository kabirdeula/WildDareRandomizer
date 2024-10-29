import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wild_dare_randomizer/providers/provider.dart';
import 'package:wild_dare_randomizer/screens/screen.dart';

class ViewSettingsMenu extends ConsumerWidget {
  final bool isGridView;

  const ViewSettingsMenu({required this.isGridView, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.read(themeProvider.notifier);
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;

    return PopupMenuButton(
      onSelected: (value) {
        switch (value) {
          case 0:
            ref.read(viewModeProvider.notifier).state = !isGridView;
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CustomRuleScreen()),
            );
            break;
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 0,
          child: Row(
            children: [
              Icon(isGridView ? Icons.view_list : Icons.grid_view),
              const SizedBox(width: 8),
              Text(
                isGridView ? 'Switch to List View' : 'Switch to Grid View',
              ),
            ],
          ),
        ),
        const PopupMenuItem(
          value: 1,
          child: Row(
            children: [
              Icon(Icons.settings),
              SizedBox(width: 8),
              Text('Custom Rules'),
            ],
          ),
        ),
        PopupMenuItem(
          child: Row(
            children: [
              const Text('Dark Mode'),
              const Spacer(),
              Switch(
                value: isDarkMode,
                onChanged: (value) {
                  themeNotifier.toggleTheme();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
