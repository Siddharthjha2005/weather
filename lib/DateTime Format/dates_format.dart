import 'package:intl/intl.dart';

class DatesFormat {

  String extractDay(DateTime dt){
    String day = DateFormat("EEEE").format(dt);
    return day;
  }

  String extractShortDay(DateTime dt){
    String day = DateFormat("EEE").format(dt);
    return day;
  }

  String extractMonth(DateTime dt){
    String month = DateFormat("MMMM").format(dt);
    return month;
  }

  // sunrise & sunset
  String extractHour12Format(var dt) {
    String hour = DateFormat("hh:mm a").format(dt);
    return hour;
  }

}