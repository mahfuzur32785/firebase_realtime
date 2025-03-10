
class ApiEndPoints {
  ApiEndPoints._privateConstructor();
  static final ApiEndPoints instance = ApiEndPoints._privateConstructor();

  static const String baseUrl = 'https://demo.medprohis.com/api/v1';

  static String roomDisplayShowAllApi = '$baseUrl/roomDisplayShowAll';
  static String roomDisplayShowSingleApi(int id) => '$baseUrl/roomDisplayShow/$id';

  static String multiRoomDisplayAllApi = '$baseUrl/multiRoomDisplayAll';
  static String multiRoomDisplaySingleApi(int id) => '$baseUrl/multiRoomDisplay/$id';


















}


