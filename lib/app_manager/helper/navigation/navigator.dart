


import 'package:vyaparmandali/app_manager/service/navigation_service.dart';
import 'package:flutter/material.dart';

class MyNavigator {

  static final BuildContext _context=NavigationService.context!;

  static void  pop() {
    Navigator.pop(_context);
  }

//
//   static Future  pushNamed(String route,{
//     Object? arguments
// }) async{
//     var data=await Get.toNamed(route,
//     arguments: arguments);
//     return data;
//   }
//
//   static Future pushReplacementNamed(String route) async{
//     var data=await Get.offNamed( route);
//     return data;
//   }
//
//   static pushNamedAndRemoveUntil(String route) async{
//     var data=await   Navigator.pushNamedAndRemoveUntil(
//       _context,
//       route,
//           (route) => false,
//     );
//     return data;
//   }
//



  static Future  push(Widget route,{
    Object? arguments
  }) async{
    var data=await Navigator.push(NavigationService.context!, MaterialPageRoute(builder: (context){
      return route;
    }));
    return data;
  }

  static pushReplacement(route,{
    String? RoutePath
  }) async{
    var data=await Navigator.pushReplacement(_context, MaterialPageRoute(
        settings: RoutePath!=null? RouteSettings(name: RoutePath): null,
        builder: (BuildContext context)
        {
          return route;
        }));
    return data;
  }

  static pushAndRemoveUntil(Widget route) async{
    var data=await   Navigator.pushAndRemoveUntil(
      _context,
      MaterialPageRoute(
        builder: (BuildContext context) => route,
      ),
          (route) => false,
    );
    return data;
  }





  static navigateTransparent(route) async{
    var data=await Navigator.push(_context, PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return route;
      },
      transitionsBuilder: (context, a1, a2, widget) {
        return widget;
      },
      transitionDuration: const Duration(milliseconds: 200),
    )
    );
    return data;
  }



}