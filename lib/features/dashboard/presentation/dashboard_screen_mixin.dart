part of 'dashboard_screen.dart';

mixin DashboardScreenMixin {
  final List<Widget> _screens = const [
    HomePage(),
    HomePage(),
    HomePage(),
  ];

  NavigationBar _buildNavigationBar({
    required int currentIndex,
    required ValueChanged<int> onItemTapped,
  }) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onItemTapped,
      destinations: List.generate(
        ListStrings.screenTitles.length,
        (index) => NavigationDestination(
          icon: Icon(getIcon(index, isSelected: false)),
          selectedIcon: Icon(getIcon(index, isSelected: true)),
          label: ListStrings.screenTitles[index],
        ),
      ),
    );
  }

  IconData getIcon(int index, {required bool isSelected}) {
    switch (index) {
      case 0:
        return isSelected ? AppIcons.home : AppIcons.homeOff;
      case 1:
        return isSelected ? AppIcons.rules : AppIcons.rulesOff;
      case 2:
        return isSelected ? AppIcons.settings : AppIcons.settingsOff;
      default:
        return AppIcons.home;
    }
  }
}
