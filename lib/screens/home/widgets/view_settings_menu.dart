import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wild_dare_randomizer/providers/provider.dart';
import 'package:wild_dare_randomizer/screens/home/home_mixin.dart';
import 'package:wild_dare_randomizer/utils/enums/routes.dart';

class ViewSettingsMenu extends ConsumerWidget with HomeMixin {
  final bool isGridView;

  ViewSettingsMenu({required this.isGridView, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.read(themeProvider.notifier);
    final darkMode = isDarkMode(ref);

    return PopupMenuButton(
      onSelected: (value) {
        switch (value) {
          case 0:
            toggleViewMode(ref, isGridView);
            break;
          case 1:
            context.go(Routes.rules.path);
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
                value: darkMode,
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
