import 'package:intl/intl.dart';

class AppDateUtils {
  static String getDayOFweek(String stringDate) {
    return DateFormat('EEEE').format(_parseDate(stringDate));
  }

  static DateTime _parseDate(String stringDate) {
    return DateTime.parse(stringDate);
  }

  static getAbbrDayName(String stringDate) {
    return DateFormat(DateFormat.ABBR_WEEKDAY).format(_parseDate(stringDate));
  }
}
