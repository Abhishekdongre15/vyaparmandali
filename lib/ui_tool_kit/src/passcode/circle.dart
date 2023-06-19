import 'package:flutter/material.dart';
import 'package:vyaparmandali/ui_tool_kit/src/colors.dart';
import 'package:vyaparmandali/ui_tool_kit/src/passcode/qovarian_theme.dart';

class Circle extends StatelessWidget {
  final bool filled;
  final CircleUIConfig circleUIConfig;
  final double extraSize;
  final bool isError;

  const Circle({
    Key? key,
    this.filled = false,
    this.isError = false,
    required this.circleUIConfig,
    this.extraSize = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: extraSize),
      width: circleUIConfig.circleSize,
      height: circleUIConfig.circleSize,
      decoration: BoxDecoration(
        color: getFilledColor(),
        shape: BoxShape.circle,
        border: Border.all(
          color: getBorderColor(),
          width: circleUIConfig.borderWidth,
        ),
      ),
    );
  }

  Color getFilledColor() {
    if (filled) {
      if (isError) {
        return ToolkitColors.error;
      } else {
        return circleUIConfig.fillColor;
      }
    } else {
      return circleUIConfig.borderColor;
    }
  }

  Color getBorderColor() {
    if (filled) {
      if (isError) {
        return ToolkitColors.error;
      } else {
        return circleUIConfig.fillColor;
      }
    } else {
      return ToolkitColors.secondaryDarkText;
    }
  }
}
