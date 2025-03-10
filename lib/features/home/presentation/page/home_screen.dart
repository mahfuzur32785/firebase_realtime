import 'package:hospital/config/const/app/app_colors.dart';
import 'package:hospital/config/const/app/resource.dart';
import 'package:hospital/config/navigation/name_route.dart';
import 'package:hospital/config/utilities/extension/num_extensions.dart';
import 'package:hospital/core/global_widgets/custom_button.dart';
import 'package:hospital/core/global_widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              height: 60,
              btnTxt: 'Room Display', onPressed: () {
                Navigator.pushNamed(context, NameRoute.roomDisplayShowAllScreen);
            },),
            30.vertical,

            CustomButton(
              height: 60,
              btnTxt: 'Multi Room Display', onPressed: () {
              Navigator.pushNamed(context, NameRoute.multiRoomDisplayShowAllScreen);
            },),30.vertical,

          ],
        ),
      ),
    );
  }
}
