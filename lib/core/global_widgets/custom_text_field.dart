import 'package:flutter/material.dart';
import 'package:hospital/config/const/app/app_colors.dart';
import 'package:hospital/config/utilities/app_utils.dart';

class CustomTextInputField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? textInputType;
  final String hintText;
  final int? textLength;
  final bool? isSecure;
  final String? Function(String?)? validatorFunction;
  final String? Function(String?)? onChanged;
  final void Function(String)? onSubmit;
  final void Function()? onTab;
  final bool? readOnly;
  final bool? enabled;
  final bool filled;
  final bool showLabel;
  final Color fillColor;
  final int? maxLine;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? prefix;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry contentPadding;

  const CustomTextInputField(
      {super.key,
        this.isSecure,
        required this.controller,
        this.textInputType,
        required this.hintText,
        this.validatorFunction,
        this.textInputAction,
        this.onChanged,
        this.onSubmit,
        this.onTab,
        this.readOnly,
        this.enabled,
        this.focusNode,
        this.maxLine = 1,
        this.fillColor = const Color(0xfff8f6f6),
        this.contentPadding = const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        this.filled = false,
        this.showLabel = true,
        this.suffixIcon,
        this.prefixIcon,
        this.prefix,
        this.textLength});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // readOnly: readOnly??false,
      validator: validatorFunction,
      onChanged: onChanged,
      style: const TextStyle(
        color: AppColors.black,
        fontSize: 12,
      ),
      onFieldSubmitted: onSubmit,
      controller: controller,
      keyboardType: textInputType,
      maxLines: maxLine,
      textInputAction: textInputAction,
      cursorColor: AppColors.black,
      obscureText: isSecure??false,
      onTap: onTab,
      focusNode: focusNode,
      // autofocus: focusNode!=null?true:false,
      decoration: InputDecoration(
        enabled: enabled??true,
        fillColor: fillColor,
        filled: true,
        contentPadding: contentPadding,
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        labelText: showLabel ? AppUtils.formatText(hintText) : null,
        labelStyle: Theme.of(context).textTheme.labelLarge,
        prefix: prefix,
        hintStyle: TextStyle(
            color: AppColors.grey,
            fontSize: 12,
            fontWeight: FontWeight.normal),
        errorStyle: const TextStyle(
            color: AppColors.red,
            fontSize: 12,
            fontWeight: FontWeight.normal),
        alignLabelWithHint: true,
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.customGrey,
              width: 1,
            )
        ),
        border: const OutlineInputBorder(
          // borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 1,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          // borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 1,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          // borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 1,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          // borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          // borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
      ),
    );
  }
}