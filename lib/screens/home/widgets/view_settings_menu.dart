import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wild_dare_randomizer/providers/provider.dart';
import 'package:wild_dare_randomizer/screens/home/home_mixin.dart';

class ViewSettingsMenu extends ConsumerStatefulWidget {
  final bool isGridView;

  const ViewSettingsMenu({required this.isGridView, super.key});

  @override
  ConsumerState<ViewSettingsMenu> createState() => _ViewSettingsMenuState();
}

class _ViewSettingsMenuState extends ConsumerState<ViewSettingsMenu>
    with HomeMixin {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = ref.read(themeProvider.notifier);
    final themeMode = ref.watch(themeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;

    return PopupMenuButton(
      onSelected: (value) {
        switch (value) {
          case 0:
            toggleViewMode(ref, widget.isGridView);
            break;
          case 1:
            themeNotifier.toggleTheme();
            break;
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 0,
          child: Row(
            children: [
              Icon(widget.isGridView ? Icons.view_list : Icons.grid_view),
              const SizedBox(width: 8),
              Text(
                widget.isGridView
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
              Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
              const SizedBox(width: 8),
              Text(
                isDarkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
