import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class AppUtils {
  static void closeKeyBoard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static String formatText(String text) {
    // Remove "Enter " if it exists at the beginning
    String newText = text.replaceFirst('Enter ', '');

    // Capitalize the first letter of the next word
    if (newText.isNotEmpty) {
      List<String> words = newText.split(' ');
      words[0] = words[0][0].toUpperCase() + words[0].substring(1);
      return words.join(' ');
    }

    return newText;
  }
  static String colorToHex(Color color, {bool leadingHashSign = true}) {
    return "${leadingHashSign ? "#" : ""}${color.value.toRadixString(16).substring(2).toUpperCase()}";
  }

  static String amPmTimeFormater(TimeOfDay? time) {
    if (time == null) return '';

    final amPm = time.hour >= 12 ? 'PM' : 'AM';
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod; // Convert 0 to 12 for AM/PM
    final formattedTime = '${hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')} $amPm';

    return formattedTime;
  }

  static Color hexToColor(String hex) {
    hex = hex.replaceFirst('#', ''); // Remove '#' if present
    if (hex.length == 6) {
      hex = 'FF$hex'; // Add full opacity if only 6 characters
    }
    return Color(int.parse(hex, radix: 16));
  }

  static String formatDateString(String dateString) {
    try {
      DateTime dateTime = DateTime.parse(dateString);
      return DateFormat('yyyy-MM-dd').format(dateTime);
    } catch (e) {
      return 'Invalid date';
    }
  }

  static String formatCurrentTime() {
    final DateTime time = DateTime.now();
    String formatTime =
        '${time.hour.toString()}:${time.minute.toString()}:${time.second.toString()}';
    return formatTime;
  }

  static String formatCurrentDate() {
    try {
      DateTime dateTime = DateTime.now();
      return DateFormat('yyyy-MM-dd').format(dateTime);
    } catch (e) {
      print('Invalid date format: $e');
      return 'Invalid date';
    }
  }

  static Future<TimeOfDay> pickTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );

    return pickedTime!;
  }

  static Future<DateTime> calenderDatePiker(BuildContext context) async {
    DateTime? newDate = await showDatePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime.now(),
        currentDate: DateTime.now());
    return newDate!;
  }

  // static String amPmTimeFormat(TimeOfDay? time) {
  //   var amPm = time!.hour > 11 && time.hour != 00 ? 'PM' : 'AM';
  //   var hour = time.hour > 12 ? time.hour - 12 : time.hour;
  //   String formatTime =
  //       '${hour.toString()}:${time.minute.toString()} ${amPm.toString()} ';
  //   return formatTime;
  // }

  static String convertMinutesToReadableFormat(int minutes) {
    int hours = minutes ~/ 60; // Calculate the whole hours
    int remainingMinutes = minutes % 60; // Calculate the remaining minutes

    // Construct the readable string
    String hoursText = hours > 0 ? "$hours Hour${hours > 1 ? 's' : ''}" : '';
    String minutesText = remainingMinutes > 0 ? "$remainingMinutes Minute${remainingMinutes > 1 ? 's' : ''}" : '';

    // Combine hours and minutes
    return [hoursText, minutesText].where((part) => part.isNotEmpty).join(' ');
  }

  static String amPmTimeFormat(dynamic time) {
    // Check if input is a String
    if (time is String) {
      try {
        // Parse the String to TimeOfDay using a custom logic or DateFormat
        final parts = time.split(':');
        if (parts.length == 2) {
          int hour = int.parse(parts[0]);
          int minute = int.parse(parts[1]);
          time = TimeOfDay(hour: hour, minute: minute);
        } else {
          throw const FormatException('Invalid time format');
        }
      } catch (e) {
        return 'Invalid input';
      }
    }

    // Ensure the input is now a TimeOfDay
    if (time is TimeOfDay) {
      var amPm = time.hour >= 12 ? 'PM' : 'AM';
      var hour = time.hour > 12 ? time.hour - 12 : (time.hour == 0 ? 12 : time.hour);
      String formatTime = '${hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')} $amPm';
      return formatTime;
    }

    return 'Invalid input'; // If input is neither a String nor a TimeOfDay
  }


  static String formatTime(dynamic time) {
    DateTime parsedTime;
    if (time is DateTime) {
      parsedTime = time;
    } else if (time is String) {
      if (RegExp(r'^\d{2}:\d{2}(:\d{2})?$').hasMatch(time)) {
        final today = DateTime.now();
        final dateString = "${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}T$time";
        parsedTime = DateTime.parse(dateString);
      } else {
        parsedTime = DateTime.parse(time);
      }
    } else {
      throw ArgumentError('Invalid time input. Must be a DateTime or a String.');
    }

    // Format the parsed time
    String formattedTime = DateFormat.jm().format(parsedTime);
    return formattedTime;
  }


  static Future<String> getCurrentTime() async {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('HH:mm:ss').format(now);
    print('Current Time: $formattedTime');
    return formattedTime;
  }

  static String formatPrice(var price) {
    if (price is double) return price.toStringAsFixed(2);
    if (price is String) {
      final p = double.tryParse(price) ?? 0.0;
      return p.toStringAsFixed(2);
    }
    return '${price.toStringAsFixed(2)}';
  }

  static String formatPriceIcon(var price, String icon) {
    if (price is double) return icon + price.toStringAsFixed(2);
    if (price is String) {
      final p = double.tryParse(price) ?? 0.0;
      return icon + p.toStringAsFixed(2);
    }
    return icon + price.toStringAsFixed(2);
  }

  static String formatDate(var date) {
    var format = DateFormat('yyyy-MM-dd');
    late DateTime dateTime;
    if (date is String) {
      dateTime = DateTime.parse(date);
    } else {
      dateTime = date;
    }
    return format.format(dateTime.toLocal());
  }

  static String formatDayName(var date) {
    var format = DateFormat('EEEE');
    late DateTime dateTime;
    if (date is String) {
      dateTime = DateTime.parse(date);
    } else {
      dateTime = date;
    }
    return format.format(dateTime.toLocal());
  }

  static String formatDayNameWithDate(var date) {
    var format = DateFormat('d, MMMM');
    late DateTime dateTime;
    if (date is String) {
      dateTime = DateTime.parse(date);
    } else {
      dateTime = date;
    }
    return format.format(dateTime.toLocal());
  }

  static String formatDateByMoth(var date) {
    var format = DateFormat('dd-MMM-yyyy');
    late DateTime dateTime;
    if (date is String) {
      dateTime = DateTime.parse(date);
    } else {
      dateTime = date;
    }

    return format.format(dateTime.toLocal());
  }

  static String formatDateWithTime(var date) {
    var formatter = DateFormat('yyyy-MM-dd hh:mm aa');
    late DateTime dateTime;
    if (date is String) {
      dateTime = DateTime.parse(date);
    } else {
      dateTime = date;
    }

    return formatter.format(dateTime);
  }

  static String numberCompact(num number) => NumberFormat.compact().format(number);


  static double toDouble(String? number) {
    try {
      if (number == null) return 0;
      return double.tryParse(number) ?? 0;
    } catch (e) {
      return 0;
    }
  }

  static String dropPricePercentage(int priceS, int offerPriceS) {
    double price = priceS.toDouble();
    double offerPrice = offerPriceS.toDouble();
    double dropPrice = (price - offerPrice) * 100;

    double percentage = dropPrice / price;
    return '-${percentage.toStringAsFixed(2)}%';
  }

  static double toInt(String? number) {
    try {
      if (number == null) return 0;
      return double.tryParse(number) ?? 0;
    } catch (e) {
      return 0;
    }
  }

  static loadingDialog(BuildContext context,
      {bool barrierDismissible = false}) {
    showCustomDialog(
      context,
      child: const SizedBox(
        height: 200,
        width: 200,
        child: Center(child: CircularProgressIndicator()),
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  static String capitalizeFirstLetter(String input) {
    if (input.isEmpty) return input;
    return input[0].toUpperCase() + input.substring(1).toLowerCase();
  }

  static Future showCustomDialog(
    BuildContext context, {
    Widget? child,
    bool barrierDismissible = false,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: child,
        );
      },
    );
  }

  static int calculateMaxDays(String startDate, String endDate) {
    final startDateTime = DateTime.parse(startDate);
    final endDateTime = DateTime.parse(endDate);
    final totalDays = endDateTime.difference(startDateTime).inDays;

    return totalDays >= 0 ? totalDays : 0;
  }

  static int calculateRemainingHours(String startDate, String endDate) {
    final startDateTime =
        DateTime.now().toLocal().subtract(const Duration(days: 9));
    final endDateTime = DateTime.parse(endDate).toLocal();
    final totalHours = endDateTime.difference(startDateTime).inHours;

    if (totalHours < 0) return 24;

    return 24 - (totalHours % 24);
  }

  static int calculateRemainingMinutes(String startDate, String endDate) {
    final startDateTime = DateTime.now().toLocal();
    final endDateTime = DateTime.parse(endDate).toLocal();
    final totalMinutes = endDateTime.difference(startDateTime).inMinutes;

    if (totalMinutes < 0) return 60;

    return 60 - (totalMinutes % (24 * 60));
  }

  static int calculateRemainingDays(String startDate, String endDate) {
    final endDateTime = DateTime.parse(endDate).toLocal();
    final totalDaysGone =
        endDateTime.difference(DateTime.now().toLocal()).inDays;
    final totalDays = calculateMaxDays(startDate, endDate);
    return totalDaysGone >= 0 ? totalDays - totalDaysGone : totalDays;
  }

  /// Checks if string is a valid username.
  static bool isUsername(String s) =>
      hasMatch(s, r'^[a-zA-Z0-9][a-zA-Z0-9_.]+[a-zA-Z0-9]$');

  /// Checks if string is Currency.
  static bool isCurrency(String s) => hasMatch(s,
      r'^(S?\$|\₩|Rp|\¥|\€|\₹|\₽|fr|R\$|R)?[ ]?[-]?([0-9]{1,3}[,.]([0-9]{3}[,.])*[0-9]{3}|[0-9]+)([,.][0-9]{1,2})?( ?(USD?|AUD|NZD|CAD|CHF|GBP|CNY|EUR|JPY|IDR|MXN|NOK|KRW|TRY|INR|RUB|BRL|ZAR|SGD|MYR))?$');

  /// Checks if string is phone number.
  static bool isPhoneNumber(String s) {
    if (s.length > 16 || s.length < 9) return false;
    return hasMatch(s, r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
  }

  /// Checks if string is email.
  static bool isEmail(String s) => hasMatch(
        s,
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
      );

  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your username';
    }
    return null;
  }

  static String? validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your first name';
    }
    return null;
  }

  static String? validateMiddleName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your middle name';
    }
    return null;
  }

  static String? validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your last name';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!isEmail(value)) {
      return 'Please enter valid email';
    }
    return null;
  }


  static String? validateCommonField(
      {String? value, String defaultMsg = 'Please enter', String msg = ''}) {
    if (value == null || value.isEmpty) {
      return '$defaultMsg $msg';
    }
    return null;
  }


  static String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your address';
    }
    return null;
  }

  static String? validateRescheduleReason(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter reschedule reason';
    }
    return null;
  }

  static String? validateRemainder(String? value, bool isTrue) {
    if (isTrue && (value == null || value.isEmpty)) {
      return 'Please enter a reminder time!';
    }
    else if (isTrue && (value != null || value!.isNotEmpty) && int.parse(value)>120) {
      return 'Reminder time must be less or equal to 120 minute!';
    }
    return null;
  }

  static String? validateUsernameOrEmail(String? value) {
    final emailPattern = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (value == null || value.isEmpty) {
      return 'Please enter your username or email';
    }
    if (value.contains('@')) {
      if (!emailPattern.hasMatch(value)) {
        return 'Please enter a valid email';
      }
    }
    return null;
  }

  static String? passwordValidator(String? value, {String msg = ''}) {
    if (value == null || value.isEmpty) {
      if(msg.isEmpty){
        return 'Please enter your password';
      }
      else {
        return 'Please enter your $msg password';
      }
    }

    final List<String> errors = [];
    if (value.length < 8) {
      errors.add('Password must be at least 8 characters long');
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      errors.add('Password must include at least one uppercase letter');
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      errors.add('Password must include at least one lowercase letter');
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      errors.add('Password must include at least one number');
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      errors.add('Password must include at least one special character');
    }

    if (errors.isNotEmpty) {
      return errors[0];
    }

    return null;
  }

  static String? validateCountryName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select country';
    }
    return null;
  }

  static String? validateCountryCodeName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select country code';
    }
    return null;
  }

  static String? validatePhoneNo(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone';
    }
    return null;
  }

  static bool hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }

  static String removeBracket(String input) {
    // Match the first "(" and the last ")" and remove them
    final regExp = RegExp(r'^\((.*)\)$');
    return input.replaceFirstMapped(regExp, (match) => match.group(1) ?? '');
  }

  static bool isEmpty(dynamic value) {
    if (value is String) {
      return value.toString().trim().isEmpty;
    }
    if (value is Iterable || value is Map) {
      return value.isEmpty ?? false;
    }
    return false;
  }

  static void errorSnackBar(BuildContext context, String errorMsg) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          content: Text(errorMsg, style: const TextStyle(color: Colors.red)),
        ),
      );
  }

  static void errorSnackBarWeb(BuildContext context, String errorMsg) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          duration: const Duration(milliseconds: 800),
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 160,
            left: MediaQuery.of(context).size.height - 150,
            right: MediaQuery.of(context).size.height - 150,
          ),
          content: Text(errorMsg, style: const TextStyle(color: Colors.red)),
        ),
      );
  }

  static showSuccessToast({required String msg}) {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP_RIGHT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static showErrorToast({required String msg}) {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP_RIGHT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static dateFormat(String date) {
    return DateFormat('d MMM yyyy').format(DateTime.parse(date));
  }


  static loadingDialogWithText(
    BuildContext context, {
    String text = '',
    bool barrierDismissible = false,
  }) {
    // closeDialog(context);
    showCustomDialog(
      context,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 100,
        child: Row(
          children: [
            const CircularProgressIndicator(),
            const SizedBox(
              width: 16,
            ),
            Text(text),
          ],
        ),
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  static bool _isDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;

  static void closeDialog(BuildContext context) {
    if (_isDialogShowing(context)) {
      Navigator.pop(context);
    }
  }

  static Route createPageRouteTop(BuildContext context, Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(0.0, 0.1);
        var end = Offset.zero;
        var curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end);
        var curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve,
        );

        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      },
    );
  }
}
