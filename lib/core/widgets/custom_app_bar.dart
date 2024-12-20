import 'package:flutter/material.dart';
import 'package:wild_dare_randomizer/core/constants/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  final List<Widget>? actions;
  final Widget? leading;
  final bool showBackButton;

  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
    this.leading,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showBackButton ? BackButton(color: AppColors.text) : leading,
      title: Text(
        title ?? '',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      actions: actions,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
