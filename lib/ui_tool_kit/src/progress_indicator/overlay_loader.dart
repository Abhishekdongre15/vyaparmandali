import 'package:flutter/material.dart';
import 'package:vyaparmandali/ui_tool_kit/src/uitoolkit.dart';

import '../colors.dart';

class OverlayProgressIndicator extends StatelessWidget {
  const OverlayProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 72,
        width: 72,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ToolkitColors.greyMedium.withOpacity(0.75),
        ),
        child: UIToolkit.circleIndicator(),
      ),
    );
  }
}
