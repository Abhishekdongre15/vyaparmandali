

import 'package:flutter/material.dart';
import 'package:vyaparmandali/app_manager/helper/responsive/responsive.dart';
import 'package:vyaparmandali/app_manager/service/navigation_service.dart';

class CustomBottomSheet {


  static dynamic open({
    required Widget child
  }) async{
    BuildContext context=NavigationService.context!;
    var data= await showModalBottomSheet<void> (
      context: context,
      isDismissible: true,
        isScrollControlled: true,

      constraints: BoxConstraints(
        maxWidth: Responsive.smallScreenWidth
      ),
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        )
      ),
      builder: (context) => SingleChildScrollView(
        child: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: child,
        ),
      )
    );
    return data;
  }


  static dynamic openWithContext(context,{
    required Widget child,
  }) async{
    var data= await showModalBottomSheet<void> (
        context: context,
        isDismissible: true,
        isScrollControlled: true,

        constraints: BoxConstraints(
            maxWidth: Responsive.smallScreenWidth
        ),
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            )
        ),
        builder: (context) => SingleChildScrollView(
          child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: child,
          ),
        )
    );
    return data;
  }


}