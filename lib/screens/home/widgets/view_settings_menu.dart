import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wild_dare_randomizer/providers/provider.dart';
import 'package:wild_dare_randomizer/providers/settings_notifier.dart';
import 'package:wild_dare_randomizer/screens/home/home_mixin.dart';

class ViewSettingsMenu extends ConsumerStatefulWidget {
  const ViewSettingsMenu({super.key});

  @override
  ConsumerState<ViewSettingsMenu> createState() => _ViewSettingsMenuState();
}

class _ViewSettingsMenuState extends ConsumerState<ViewSettingsMenu>
    with HomeMixin {
  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsProvider);
    final settingsNotifier = ref.read(settingsProvider.notifier);

    return PopupMenuButton(
      onSelected: (value) {
        switch (value) {
          case 0:
            settingsNotifier.toggleViewMode();
            break;
          case 1:
            settingsNotifier.toggleTheme();
            break;
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 0,
          child: Row(
            children: [
              Icon(settings.isGridView ? Icons.view_list : Icons.grid_view),
              const SizedBox(width: 8),
              Text(
                settings.isGridView
                    ? 'Switch to List View'
                    : 'Switch to Grid View',
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: 1,
          child: Row(
            children: [
              Icon(settings.isDarkMode ? Icons.light_mode : Icons.dark_mode),
              const SizedBox(width: 8),
              Text(
                settings.isDarkMode
                    ? 'Switch to Light Mode'
                    : 'Switch to Dark Mode',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
