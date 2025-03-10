import 'package:flutter/material.dart';
import 'package:hospital/config/const/app/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget action;
  final double fontSize;
  final PreferredSizeWidget? bottom;

  const CustomAppBar({super.key, required this.title, this.action = const SizedBox(), this.fontSize = 20, this.bottom});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.white,
      title: Text(title,style: Theme.of(context).textTheme.labelLarge?.copyWith(
        fontSize: 18, color: AppColors.white
      ),),
      titleTextStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
          fontSize: fontSize,
          color: AppColors.white
      ),
      scrolledUnderElevation: 0,
      actions: [
        action
      ],
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight( bottom == null ? 45.0 : 90); // Default AppBar height
}
