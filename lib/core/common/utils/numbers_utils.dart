import 'package:intl/intl.dart';

final formatter = NumberFormat("#,##0.00", "en_US");

String toCurrency(double number) {
  return formatter.format(number);
}
