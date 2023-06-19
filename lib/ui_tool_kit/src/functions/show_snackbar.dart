import 'package:flutter/material.dart';
import 'package:vyaparmandali/ui_tool_kit/src/colors.dart';
import 'package:vyaparmandali/ui_tool_kit/src/typography.dart';


showCommonSnackbar(
  BuildContext context, {
  required String content,
  bool isError = false,
  double? width,
  Duration? duration,
  SnackBarAction? action,
  TextStyle? textStyle,
  bool hidePrevious = false,
}) {
  if (hidePrevious) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  TextStyle _style = ToolkitTypography.body3B.merge(textStyle);

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    width: width,
    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
    action: action,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    backgroundColor: isError ? ToolkitColors.error : ToolkitColors.secondary,
    duration: duration ?? const Duration(seconds: 2),
    content: Text(
      content,
      style: _style,
      textAlign: TextAlign.center,
    ),
  ));
}
