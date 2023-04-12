






extension StringExtensionInt on String? {
  toIntCustom() {
   return int.parse(this==null? "0":this!.isEmpty? "0":this??"0");
  }
}


extension StringExtensionDouble on String? {
  toDoubleCustom() {
    return double.parse(this==null? "0.0":this!.isEmpty? "0.0":this??"0.0");
  }
}