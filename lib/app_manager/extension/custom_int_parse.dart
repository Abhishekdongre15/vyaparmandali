






extension StringExtension on String? {
  toIntCustom() {
   return int.parse(this==null? "0":this!.isEmpty? "0":this??"0");
  }
}