



import 'package:vyaparmandali/app_manager/service/navigation_service.dart';
import 'package:flutter/material.dart';

class MyNavigator {
  
  static final BuildContext _context=NavigationService.context!;

  static void  pop() {
    Navigator.pop(_context);
  }

  static Future  push(Widget route,{
    Object? arguments
  }) async{
    var data=await Navigator.push(_context, MaterialPageRoute(

      builder: (BuildContext context)
      {
        return route;
      },
      settings: RouteSettings(
        arguments: arguments,
      ),
    ),

    );
    return data;
  }

  static pushReplacement(route,{
    String? routeName
  }) async{
    var data=await Navigator.pushReplacement(_context, MaterialPageRoute(
        settings: routeName!=null? RouteSettings(name: routeName): null,
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