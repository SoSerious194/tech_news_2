import 'package:flutter/material.dart';
import 'package:tech_news_2/utils/app_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? color;
  final double? elevation;
  final Widget? leading;
  final List<Widget>? actions;
  final bool? centerTitle;
  const CustomAppBar({
    Key? key,
    this.title,
    this.color,
    this.elevation,
    this.leading,
    this.actions,
    this.centerTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: centerTitle,
      elevation: elevation,
      leading: leading,
      actions: actions,
      backgroundColor: color,
      title: Text(
        title ?? "",
        style: AppStyles.contentStyle.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: Theme.of(context).indicatorColor,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
