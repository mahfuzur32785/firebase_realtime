import 'package:hospital/config/const/app/app_colors.dart';
import 'package:flutter/material.dart';

class NoDataFoundWidget extends StatelessWidget {
  const NoDataFoundWidget({super.key, this.msg = 'Data', this.alignment =  Alignment.center});

  final String msg;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: alignment,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        // decoration: BoxDecoration(
        //   border: Border.all(color: AppColors.primaryColor)
        // ),
        child: Text('No $msg found',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
            fontSize: 14, color: AppColors.red)),
      ),
    );
  }
}
