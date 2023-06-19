import 'dart:io';

import 'package:intl/intl.dart';

String commonCurrencyFormat(
  double amount, {
  bool discrete = false,
  String? currencySymbol,
  int decimalPlaces = 2,
  String delimiter = '',
}) {
  NumberFormat format = NumberFormat.simpleCurrency(locale: Platform.localeName);
  String _amount = amount.toStringAsFixed(decimalPlaces);
  List<String> _items = [
    currencySymbol ?? format.currencySymbol
  ];

  if (discrete) {
    String _hidden = '*' * amount.toString().length;
    _items.add(_hidden);
  } else {
    _items.add(_amount);
  }
  return _items.join(delimiter);
}
