import 'package:intl/intl.dart';

String getDate() {
  var now = DateTime.now();
  var formatter = DateFormat('yyyy-MM-dd');
  String formattedDate = formatter.format(now);
  return formattedDate;
}

List<String> getLastWeekDates() {
  var now = DateTime.now();
  var formatter = DateFormat('yyyy-MM-dd');
  List<String> last7Days = [];
  for (int i = 0; i < 7; i++) {
    last7Days.add(formatter.format(now.subtract(Duration(days: i))));
  }
  return last7Days;
}

Map<String, String> getLastWeekDays() {
  var now = DateTime.now();
  Map<String, String> dateAndDay = {};
  for (int i = 0; i < 7; i++) {
    String date = DateFormat('yyyy-MM-dd').format(now.subtract(Duration(days: i)));
    String day = DateFormat('EEE').format(now.subtract(Duration(days: i)));
    dateAndDay[date] = day;
  }
  return dateAndDay;
}