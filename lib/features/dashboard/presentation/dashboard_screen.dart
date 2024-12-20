import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wild_dare_randomizer/core/constants/constants.dart';
import 'package:wild_dare_randomizer/core/constants/strings/strings.dart';
import 'package:wild_dare_randomizer/core/widgets/widgets.dart';
import 'package:wild_dare_randomizer/features/dashboard/dashboard.dart';
import 'package:wild_dare_randomizer/features/home/home.dart';

part 'dashboard_screen_mixin.dart';

class DashboardScreen extends StatelessWidget with DashboardScreenMixin {
  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, int>(
      builder: (context, selectedIndex) {
        return Scaffold(
          key: context.read<DashboardCubit>().scaffoldKey,
          appBar: CustomAppBar(
            title: ListStrings.screenTitles[selectedIndex],
            actions: selectedIndex == 0
                ? [buildHomeScreenActionButton(context)]
                : null,
          ),
          body: _screens[selectedIndex],
          bottomNavigationBar: _buildNavigationBar(
            currentIndex: selectedIndex,
            onItemTapped: (index) =>
                context.read<DashboardCubit>().updateIndex(index),
          ),
        );
      },
    );
  }
}
