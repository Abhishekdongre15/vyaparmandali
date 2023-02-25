




import 'package:flutter/material.dart';
import 'package:vyaparmandali/app_manager/helper/responsive/responsive.dart';

class ResponsiveSizedBox extends StatelessWidget {

  final Widget? child;
  final double? heightPercent;
  final double? widthPercent;

  const ResponsiveSizedBox({super.key,
    this.child,
    this.heightPercent,
    this.widthPercent,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Responsive.heightPercent(context,percentage: heightPercent),
        width: Responsive.widthPercent(context,percentage: widthPercent),
        child: child
    );
  }
}
