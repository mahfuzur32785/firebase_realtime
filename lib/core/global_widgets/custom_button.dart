import 'package:flutter/material.dart';
import 'package:hospital/config/const/app/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.btnTxt,
    required this.onPressed, this.height = 45,
    this.fontSize = 16,
    this.width = double.infinity,
    this.padding,
    this.textColor = AppColors.white,
    this.backgroundColor = AppColors.primaryColor,
    this.foregroundColor = Colors.white});

  final void Function()? onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final String btnTxt;
  final double height;
  final double width;
  final double fontSize;
  final Color textColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: onPressed,
        child: Text(btnTxt, style: Theme.of(context).textTheme.labelSmall?.copyWith(
          fontSize: fontSize,
          color: textColor
        )),
      ),
    );
  }
}
