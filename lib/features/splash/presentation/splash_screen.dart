import 'package:hospital/config/const/app/app_colors.dart';
import 'package:hospital/config/const/app/resource.dart';
import 'package:hospital/config/navigation/name_route.dart';
import 'package:hospital/core/global_widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    awaitAMoment();

    super.initState();

  }

  awaitAMoment() async {
    Future.delayed(const Duration(seconds: 3), () async {
      if (mounted) {
        Navigator.pushReplacementNamed(context, NameRoute.homeScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CustomImage(
              path: AppResources.appLogo,
              // color: AppColors.white,
              height: MediaQuery.sizeOf(context).height * 0.5,
              width: MediaQuery.sizeOf(context).width * 0.5,
            ).animate(effects: [
              const ShimmerEffect(
                  duration: Duration(seconds: 3), color: AppColors.white),
            ]),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.2,
            child: const LinearProgressIndicator(
              backgroundColor: AppColors.secondaryColor,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
            ),
          ),
        ],
      ),
    );
  }
}
