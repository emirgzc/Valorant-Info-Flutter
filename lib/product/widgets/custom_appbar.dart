import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({super.key, this.leading, this.actions, this.title, this.flexibleSpace, this.foregroundColor});
  final Widget? leading;
  final List<Widget>? actions;
  final Widget? title;
  final Widget? flexibleSpace;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: flexibleSpace,
      leading: leading,
      title: title,
      actions: actions,
      foregroundColor: foregroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
