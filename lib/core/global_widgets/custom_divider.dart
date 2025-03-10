import 'package:flutter/cupertino.dart';
import 'package:hospital/config/const/app/app_colors.dart';

class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 100,
      color: AppColors.primaryColor,
    );
  }
}
