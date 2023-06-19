class CardDetails {
  String cardNumber;
  String? expiryDate;
  String? cvvCode;

  CardDetails({
    required this.cardNumber,
    this.expiryDate,
    this.cvvCode,
  });

  String get frontCardNumber {
    String _number = cardNumber.replaceAll(' ', '');
    if (_number.length > 6) {
      return _number.substring(_number.length - 6, _number.length);
    }
    return '**4500';
  }
}
