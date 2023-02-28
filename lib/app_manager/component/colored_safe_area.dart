


import 'package:flutter/material.dart';
import 'package:vyaparmandali/app_manager/theme/color_constant.dart';
class ColoredSafeArea extends StatelessWidget {
  final Widget child;
  final Color? color;

  const ColoredSafeArea({Key? key, required this.child, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? AppColor.primaryColor,
      child: SafeArea(
        child: child,
      ),
    );
  }
}

