



import 'package:flutter/material.dart';
import 'package:vyaparmandali/app_manager/helper/responsive/responsive.dart';

class MyResponsiveScreen extends StatelessWidget {
  final Widget child;
  final double? bigScreenWidth;
  final AlignmentGeometry? alignment;

  const MyResponsiveScreen({Key? key, required this.child, this.bigScreenWidth, this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (Responsive.isSmallScreen(context)) {
        return child;
      } else {
        return Container(
          alignment: alignment,
          child: SizedBox(
              width: bigScreenWidth?? Responsive.smallScreenWidth,
              child: child),
        );
      }
    });
  }
}