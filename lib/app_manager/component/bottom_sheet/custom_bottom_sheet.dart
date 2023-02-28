

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:vyaparmandali/app_manager/component/shadow_container.dart';

class CustomBottomSheet {


  static dynamic open(BuildContext context,{
    Widget? child
  }) async{

    final theme=Theme.of(context);
    var data= await showBarModalBottomSheet (
      context: context,
      isDismissible: true,
      backgroundColor: Colors.white,
      builder: (context) => SingleChildScrollView(
        child: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: child??ShadowContainer(
            color: theme.primaryColor,
          ),
        ),
      ),
    );
    return data;
  }



}