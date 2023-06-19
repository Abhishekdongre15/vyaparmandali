import 'package:flutter/material.dart';

class ToolkitColors {
  static final ToolkitColors instance = ToolkitColors._();
  factory ToolkitColors() => instance;
  ToolkitColors._();

  late Map<String, dynamic> _data;

  // Future<bool> initialize(BuildContext context) async {
  //   _data = jsonDecode(await DefaultAssetBundle.of(context).loadString('assets/colors.json'));
  //   return true;
  // }

  static const Color white = Colors.white;
  static const Color black = Colors.black;

  static const Color primary = Color(0xFFFAC243);
  static const Color secondary = Color(0xFF242424);
  static const Color tertiary = Color(0xFFD1D1D1);

  //Text colours on light backgrounds
  static const Color primaryDarkText = Color(0xFF242424);
  static const Color secondaryDarkText = Color(0xFF707070);

  //Text colours on dark backgrounds
  static const Color primaryLightText = Color(0xFFFFFFFF);
  static const Color secondaryLightText = Color(0xFFE3E3E3);

  //Main background colours
  static const Color lightBackground = Color(0xFFF6F6F6);
  static const Color whiteBackground = Color(0xFFFFFFFF);

  //Utility colours
  static const Color lightPrimary = Color(0xFFFFE9B8);
  static const Color veryLightPrimary = Color(0xFFFFF4D9);
  static const Color lightError = Color(0xFFFFDBDB);
  static const Color error = Color(0xFFDD0E0E);
  static const Color successLight = Color(0xFFD1E6D8);
  static const Color success = Color(0xFF1B833E);
  static const Color linkBlue = Color(0xFF145FDB);
  static const Color lightGreen = Color(0xFFD1E6D8);

  //Greyscale colours
  static const Color greyDark = Color(0xFF707070);
  static const Color greyMediumDark = Color(0xFF9A9A9A);
  static const Color greyMedium = Color(0xFFC6C6C6);
  static const Color greyLight = Color(0xFFE3E3E3);
  static const Color greyLightest = Color(0xFFF5F5F5);
  static const Color primaryBlack = Color(0xFF333333);
  static const Color shadowColor = Color.fromRGBO(0, 0, 0, 0.1);

  static const Color formCursor = Color(0xFF446BF2);

  //Passcode
  static const Color numberBackground = Color(0xFFFAC243);
  static const Color cameraPreviewBackground = Color(0xFFD9D9D9);

  //
}
