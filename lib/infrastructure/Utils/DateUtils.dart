import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DateUtils {
  static String dateFormatByLocale(DateTime date, String _languageCode) {
    try {
      var formatter = new DateFormat.yMMMMd(_languageCode);
      return formatter.format(date);
    } catch (e) {
      initializeDateFormatting();
      var formatter = new DateFormat.yMMMMd(_languageCode);
      return formatter.format(date);
    }
  }
}
