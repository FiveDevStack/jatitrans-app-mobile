import 'package:intl/intl.dart';

class Helpers {
  static Helpers? _instance;

  Helpers._internal() {
    _instance = this;
  }

  factory Helpers() => _instance ?? Helpers._internal();

  String convertToHoursMinutes(String time) {
    // Split the input string by colon
    List<String> parts = time.split(':');

    // Check if the input string has the correct format
    if (parts.length == 3) {
      String hours = parts[0];
      String minutes = parts[1];

      // Return the formatted string
      return '$hours:$minutes';
    } else {
      // Handle invalid input
      return 'Invalid format';
    }
  }

  String reformatAmount(int number) {
    // Create a NumberFormat instance for the desired pattern
    final formatter = NumberFormat('#,##0', 'en_US');

    // Format the number
    String formatted = formatter.format(number);

    // Replace commas with dots
    return formatted.replaceAll(',', '.');
  }
}
