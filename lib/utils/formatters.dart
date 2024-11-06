import 'package:intl/intl.dart';

String formatPrice(double price) {
  final formatter = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
  );
  return formatter.format(price);
}

String formatDate(DateTime date) {
  final formatter = DateFormat('dd/MM/yyyy HH:mm');
  return formatter.format(date);
}