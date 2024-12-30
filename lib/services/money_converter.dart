import 'package:intl/intl.dart';

class MoneyConverter {
  String convertMoney(double amount, {String? currency = "KES"}) {
    final oCcy = NumberFormat("#,##0.00", "en_US");
    String formattedAmount = currency == null
        ? oCcy.format(amount)
        : "$currency ${oCcy.format(amount)}";
    return formattedAmount;
  }
}
