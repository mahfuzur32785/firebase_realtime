import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hospital/config/const/state_management_provider.dart';
import 'package:hospital/config/navigation/name_route.dart';
import 'package:hospital/config/navigation/router.dart';
import 'package:hospital/core/dependency_inject/dependency_injector.dart';
import 'package:hospital/core/theme/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

late SharedPreferences prefs;

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  prefs = await SharedPreferences.getInstance();

  /// Dependencies Injector
  await configureDependencies();

  /// turn off the portrait mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  /// Routing
  final AppRouter router = AppRouter();

  runApp(
    MultiProvider(
      providers: StateManagementProviders.providers,
      child: MyApp(
        router: router,
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.router});

  final AppRouter router;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ));

    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      title: 'CLIENTS',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      navigatorKey: AppRouter.navigatorKey,
      theme: AppTheme.lightTheme(textTheme),
      darkTheme: AppTheme.darkTheme(textTheme),
      onGenerateRoute: widget.router.onGenerateRoute,
      initialRoute: NameRoute.splashScreen,
    );
  }
}
