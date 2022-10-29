import 'package:flutter/material.dart';
import 'package:reusekit/reusekit.dart';
import 'package:reusekit/utills/reuse_button_util.dart';
import 'package:reusekit/utills/reuse_image_picker_util.dart';
import 'package:reusekit/utills/reuse_theme_util.dart';
import 'package:vyaparmandali/views/signUp_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ReUseKit.initiate(
      progressJson: "assets/progress_animation.json",
      noDataFoundJson: "assets/no_data_found.json",
      noInternetJson: "assets/no_internet_found.json",
      baseUrl: "base url here ",
      reUseColor: ReUseColor(
          primaryColor: Colors.pink,
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
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  SignUpView(),
    );
  }
}