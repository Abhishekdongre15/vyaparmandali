import 'package:flutter/material.dart';
import 'package:vyaparmandali/ui_tool_kit/src/colors.dart';

@immutable
class CircleUIConfig {
  const CircleUIConfig({
    this.borderColor = Colors.transparent,
    this.borderWidth = 1,
    this.fillColor = ToolkitColors.primaryDarkText,
    this.circleSize = 16,
  });

  final Color borderColor;
  final Color fillColor;
  final double borderWidth;
  final double circleSize;
}
