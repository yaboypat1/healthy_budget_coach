import 'package:intl/intl.dart';

String priceFormatter(num value) {
  final format = NumberFormat.currency(locale: 'en_US');
  return format.format(value);
}

String macroFormatter(num grams, String macro) {
  final format = NumberFormat.decimalPattern();
  return '${format.format(grams)} g $macro';
}

String kcalFormatter(num kcal) {
  final format = NumberFormat.decimalPattern();
  return '${format.format(kcal)} kcal';
}
