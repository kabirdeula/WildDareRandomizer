part of 'dashboard_screen.dart';

mixin DashboardScreenMixin {
  final List<Widget> _screens = const [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
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

  Widget buildHomeScreenActionButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        showRuleLevelsDialog(context);
      },
      icon: const Icon(Icons.question_mark_rounded),
    );
  }

  void showRuleLevelsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Rule Levels'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(Icons.circle, color: Colors.green), // Easy
                  SizedBox(width: 10),
                  Text('Easy: Green'),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.circle, color: Colors.blue), // Medium
                  SizedBox(width: 10),
                  Text('Medium: Blue'),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.circle, color: Colors.orange), // Hard
                  SizedBox(width: 10),
                  Text('Hard: Yellow'),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.circle, color: Colors.red), // Extreme
                  SizedBox(width: 10),
                  Text('Extreme: Red'),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
