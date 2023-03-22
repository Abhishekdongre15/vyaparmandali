



import 'package:flutter/cupertino.dart';

class Responsive {



  static double smallScreenWidth=600;

  static Size size(BuildContext context)=>MediaQuery.of(context).size;
  static bool isSmallScreen(BuildContext context)=>size(context).width<smallScreenWidth;


  static double widthPercent(BuildContext context,{
    double? percentage=100
  })=>((size(context).width*(percentage??100))/100);

  static double heightPercent(BuildContext context,{
    double? percentage=100
  })=>((size(context).height*(percentage??100))/100);


}