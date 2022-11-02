import 'package:flutter/material.dart';
class DrawerList extends StatelessWidget {
  String? rName;
  String? cName;
   DrawerList({Key? key,required this.rName,this.cName=''}) : super(key: key);
  // Make multiple Widget
  @override
  Widget build(BuildContext context) {
    return
       ExpansionTile(title:Text(rName!.toUpperCase()),children: [
         ExpansionTile(title: Text(cName!.toUpperCase()))
       ],);
    ;
  }
}
/// Make Multiple widgets in this same file