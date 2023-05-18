
import 'package:vyaparmandali/app_manager/theme/color_constant.dart';
import 'package:flutter/material.dart';

class CustomTextFieldTheme {
  static InputDecorationTheme primary = InputDecorationTheme(
    isDense: true,
    prefixStyle: const TextStyle(
        color: AppColor.black
    ),
    hintStyle:  TextStyle(
        color: AppColor.black.withOpacity(0.6)
    ),
    contentPadding: const EdgeInsets.all(
      10
    ),
    labelStyle: const TextStyle(
      color: AppColor.black,

    ),
    filled: true,
    border: InputBorder.none,
    focusedBorder: InputBorder.none,
    focusedErrorBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    disabledBorder: InputBorder.none,

    errorBorder: InputBorder.none,
  );

  static InputDecorationTheme secondary = InputDecorationTheme(
    isDense: true,
    prefixStyle: Typography.whiteMountainView.titleMedium,
    hintStyle:  TextStyle(
        color: AppColor.black.withOpacity(0.6)
    ),
    contentPadding: const EdgeInsets.all(
        10
    ),
    labelStyle: const TextStyle(
      color: AppColor.black,

    ),
    filled: true,
    border: InputBorder.none,
    focusedBorder: InputBorder.none,
    focusedErrorBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    disabledBorder: InputBorder.none,

    errorBorder: InputBorder.none,
  );
}
