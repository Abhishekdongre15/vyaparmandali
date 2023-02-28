


import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vyaparmandali/app_manager/theme/color_constant.dart';
import 'package:vyaparmandali/gen/assets.gen.dart';

class ProjectConstant {


  static String name="Vyapar Mandali";

  static LinearGradient getGradient(gradientColor){
    return  LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [

        gradientColor!.withOpacity(0.7),
        gradientColor!.withOpacity(0.8),
        gradientColor!,
        gradientColor!,

      ],
    );
  }


  static Widget get noDatFoundWidget=>Center(child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children:  [
      SizedBox(
          height: 100,
          child: Lottie.asset(Assets.json.noDataFound)),
       const Text("No Data Found",
      style: TextStyle(
        color: AppColor.greyLight
      ),),
    ],
  ));


  static Widget imageErrorWidget=  const Padding(padding: EdgeInsets.all(5),
    child: Icon(Icons.photo_library,
      color: AppColor.primaryColor,),
  );
  static Widget imageErrorIconWidget=   const Icon(Icons.error,
    color: AppColor.primaryColor,);
  static Widget placeHolder= const Center(child: CircularProgressIndicator());
  static Widget buttonProgressIndicator = const SizedBox(
    width: 60,
    height: 20,
    child: Center(
      child: SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    ),
  );


}