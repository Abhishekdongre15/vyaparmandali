import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:reusekit/reusekit.dart';
import 'package:reusekit/utills/reuse_button_util.dart';
import 'package:reusekit/utills/reuse_image_picker_util.dart';
import 'package:reusekit/utills/reuse_theme_util.dart';
import 'package:vyaparmandali/views/homeLoginView.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ReUseKit.initiate(
      progressJson: "assets/progress_animation.json",
      noDataFoundJson: "assets/no_data_found.json",
      noInternetJson: "assets/no_internet_found.json",
      baseUrl: "base url here ",
      reUseColor: ReUseColor(
          primaryColor: Colors.lightGreen,
          secondaryColor: ReUseKit.getColor.errorColor
      ),

      primaryTextFieldUtil: ReUseTextFieldUtil(

      ),
      secondaryTextFieldUtil: ReUseTextFieldUtil(

      ),
      primaryButtonUtil: ReUseButtonUtil(
      ),
      secondaryButtonUtil: ReUseButtonUtil(
      ),
      imagePickerUtil: ReUseImagePickerUtil(

      ),
      textThemeUtil: ReUseTextThemeUtil(
        // smallTextSize: 100
      )



  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'vyaparmandali',
      theme: ReUseThemeProvider().getThemeData,
      home:  HomeLoginView(),
    );
  }
}
class CustomScrollBehaviour extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}
