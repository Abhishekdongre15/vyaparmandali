import 'package:vyaparmandali/app_manager/theme/color_constant.dart';
import 'package:flutter/material.dart';

class CustomButtonTheme {
  static TextButtonThemeData primary = TextButtonThemeData(
    style: TextButton.styleFrom(


        backgroundColor: AppColor.primaryColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.all(10),
        textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        side:  const BorderSide(color: AppColor.primaryColor)),
  );

  static TextButtonThemeData wPrimary = TextButtonThemeData(
    style: TextButton.styleFrom(
        backgroundColor: AppColor.white,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.fromLTRB(14,8,14,8,),
        textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold,
        color: Colors.black),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        side:  const BorderSide(color: AppColor.white)),
  );

  static TextButtonThemeData text = TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: Colors.transparent,
      foregroundColor: AppColor.primaryColor,
      textStyle: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
  static TextButtonThemeData textWhite = TextButtonThemeData(
    style: TextButton.styleFrom(

      backgroundColor: Colors.transparent,
      foregroundColor: AppColor.white,
      padding: const EdgeInsets.all(0),
      textStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: AppColor.white
      ),
    ),
  );
  static TextButtonThemeData secondary = TextButtonThemeData(
    style: TextButton.styleFrom(
        backgroundColor: AppColor.primaryColor,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        side:  const BorderSide(color: AppColor.primaryColor)),
  );

  static TextButtonThemeData whiteSecondaryButton = TextButtonThemeData(
    style: TextButton.styleFrom(
        backgroundColor: AppColor.white,
        foregroundColor: AppColor.black,
        textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        side:  const BorderSide(color: AppColor.primaryColor)),
  );
}
