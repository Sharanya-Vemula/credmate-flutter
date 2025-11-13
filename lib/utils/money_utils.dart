import 'package:intl/intl.dart';


String formatCurrency(double value) => NumberFormat.currency(locale: 'en_IN', symbol: '₹', decimalDigits: 0).format(value);