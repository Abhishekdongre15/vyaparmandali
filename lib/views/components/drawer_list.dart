import 'package:flutter/material.dart';
class DrawerList extends StatelessWidget {
  String? rName;
   DrawerList({Key? key,required this.rName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
       ExpansionTile(title:Text(rName!.toUpperCase()),);
    ;
  }
}
