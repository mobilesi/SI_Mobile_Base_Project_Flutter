import 'dart:math' as Math;

import 'package:intl/intl.dart';
import 'package:share/share.dart';

class Common {
  static DateTime? parserDate(String? date, {String? format}) {
    try {
      if (format == null) {
        return DateTime.parse(date!);
      }
      return DateFormat(format).parse(date!);
    } catch (e) {
      return null;
    }
  }

  static String fromDate(DateTime date, format) {
    try {
      String dateString = DateFormat(format).format(date);
      return dateString;
    } catch (e) {
      return "";
    }
  }

  static int strToInt(String data, {int defaultValue = 0}) {
    try {
      if (data.isEmpty) return defaultValue;
      return int.parse(data);
    } catch (e) {
      return defaultValue ?? -1;
    }
  }

  static num? doubleWithoutDecimalToInt(double? val) {
    if (val == null) {
      return null;
    }
    return val % 1 == 0 ? val.toInt() : val;
  }

  static double strToDouble(String data, {double? defaultValue}) {
    try {
      if (data.isEmpty) return 0;
      return double.parse(data);
    } catch (e) {
      return defaultValue ?? -Math.e;
    }
  }

  static String formatPrice(price, {bool showPrefix = true}) {
    if (price == null) {
      return "";
    }
    try {
      final numberFormat = NumberFormat("#,###");
      return numberFormat.format(double.parse(price.toString()).round()) + "${showPrefix ? " đ" : ""}";
    } catch (e) {
      return price?.toString() ?? "";
    }
  }

  static bool validateEmail(String text) {
    RegExp regex = RegExp("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}");
    return regex.hasMatch(text);
  }

  static bool validatePhone(String text) {
    RegExp regex = RegExp("^[0-9\-\+]{10,15}\$");
    return regex.hasMatch(text);
  }

  static bool validateAccount(String text) {
    RegExp regex = RegExp("^[A-Z0-9a-z]*\$");
    return regex.hasMatch(text);
  }

  static bool validateName(String text) {
    RegExp regex = RegExp("^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*\$");
    return regex.hasMatch(text);
  }

  static String getStringDateToday() {
    var now = new DateTime.now();
    var formatter = new DateFormat('dd/MM/yyyy');
    return formatter.format(now);
  }

  static String getStringDateFirstDayOfMonth() {
    var now = new DateTime.now();
    var date = DateTime(now.year, now.month, 1);
    var formatter = new DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }

  static String getStringDateLastDayOfMonth() {
    var now = new DateTime.now();
    var date = DateTime(now.year, now.month + 1, 0);
    var formatter = new DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }

  static String datetimeToSting(DateTime date) {
    var formatter = new DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }

  static shareContent(String content) {
    Share.share(content);
  }
}
