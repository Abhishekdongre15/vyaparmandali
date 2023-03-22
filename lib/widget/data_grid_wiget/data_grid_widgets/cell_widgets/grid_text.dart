



import 'package:flutter/material.dart';

class GridText extends StatelessWidget {

  final String text;
  final bool manageOverFlow;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;

  const GridText({super.key,
    required this.text,
    this.manageOverFlow=true,
    this.fontWeight,
    this.fontSize,
    this.color,
  });


  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      style:  TextStyle(
          fontSize: fontSize??12,
          fontWeight: fontWeight??FontWeight.w400,
        color: color,
        overflow: manageOverFlow?TextOverflow.ellipsis:null
      ),
    );
  }
}
