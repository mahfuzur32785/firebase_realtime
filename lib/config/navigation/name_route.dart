class NameRoute {
  static final NameRoute _singleton = NameRoute._internal();

  NameRoute._internal();

  factory NameRoute() => _singleton;

  static const String splashScreen = '/';
  static const String homeScreen = '/homeScreen';
  static const String roomDisplayShowAllScreen = '/roomDisplayShowAllScreen';
  static const String roomDisplayShowSingleScreen = '/roomDisplayShowSingleScreen';

  static const String multiRoomDisplayShowAllScreen = '/multiRoomDisplayShowAllScreen';
  static const String multiRoomDisplayShowSingleScreen = '/multiRoomDisplayShowSingleScreen';





}
