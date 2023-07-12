import 'package:intl/intl.dart';

class Formater {
  static String formatPrice(int price) {
    final numberFormat = NumberFormat("#,##,###");
    return numberFormat.format(price);
  }
}
