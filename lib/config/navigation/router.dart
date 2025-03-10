import 'package:flutter/material.dart';
import 'package:hospital/config/navigation/name_route.dart';
import 'package:hospital/features/home/presentation/page/all_room/all_room_display_screen.dart';
import 'package:hospital/features/home/presentation/page/all_room/all_room_single_screen.dart';
import 'package:hospital/features/home/presentation/page/home_screen.dart';
import 'package:hospital/features/home/presentation/page/multi_room/multi_room_display_screen.dart';
import 'package:hospital/features/splash/presentation/splash_screen.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {

      case NameRoute.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case NameRoute.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case NameRoute.roomDisplayShowAllScreen:
        return MaterialPageRoute(builder: (context) => const AllRoomDisplayScreen());

      case NameRoute.roomDisplayShowSingleScreen:
        return MaterialPageRoute(builder: (context) => AllRoomSingleScreen());

      case NameRoute.multiRoomDisplayShowAllScreen:
        return MaterialPageRoute(builder: (context) => const MultiRoomDisplayScreen());


      default:
        return MaterialPageRoute(builder: (context) => Container());
    }
  }
}
