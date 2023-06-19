import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vyaparmandali/app_manager/helper/navigation/navigator.dart';
import 'package:vyaparmandali/route_name.dart';
import 'entry.dart';

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry, this.context, {super.key});

  final Entry entry;
  final BuildContext context;


  @override
  Widget build(BuildContext context) {

// This function recursively creates the multi-level list rows.
    Widget buildTiles(Entry root) {
      if (root.children.isEmpty) {
        return ListTile(
          title: GestureDetector(
              onTap: () {
                /* if (root.title.toLowerCase() == 'GROUP'.toLowerCase()) {
                Navigator.pushNamed(context, MaterialPageRoute(builder: (context) => const GroupMasterListView(),));

              }else if() {

              }*/

                callPages(root.title.toLowerCase());
              },
              child: Text(
                root.title,
              )),
        );
      } else {
        return root.title=="FOR ADMIN"? Container():ExpansionTile(
          collapsedIconColor: Colors.black,
          key: PageStorageKey<Entry>(root),
          title: Text(
            root.title,
          ),
          children: root.children.map<Widget>(buildTiles).toList(),
        );
      }
    }



    return buildTiles(entry);
  }

  void callPages(String pages) async{
    switch (pages) {
      case 'cash bill':
        context.push(RoutePath.cashBillMaster);
        break;
      case 'reports':
        context.push(RoutePath.reportView);
        break;
      case 'cash book item':
         context.push(RoutePath.cashBookItemMasterView);
        break;
      case 'registered user':
        context.push(RoutePath.registeredUserMasterView);
        break;
      case 'vacchat':
        context.push(RoutePath.vacchatMasterView);
        break;
      case 'dhada book':
        context.push(RoutePath.dhadaBookMasterView);
        break;
      case 'farmer':
        context.push(RoutePath.farmerMasterView);
        break;
      case 'product':
        context.push(RoutePath.productMasterView);
        break;
      case 'vehicle':
        context.push(RoutePath.vehicleMasterView);
        break;
      case 'weight':
        context.push(RoutePath.weightMasterView);
        break;
      case 'agent':
        context.push(RoutePath.agentMasterView);
        break;
      case 'bank':
        context.push(RoutePath.bankMasterView);
        break;
      case 'hamal':
        context.push(RoutePath.hamalMasterView);
        break;
      case 'customer':
        context.push(RoutePath.customerMasterView);
        break;
      case 'group':
        context.push(RoutePath.groupMasterView);
        break;
      case 'narration':
        context.push(RoutePath.narrationMasterView);
        break;
      case 'a/c master':
        context.push(RoutePath.acMasterListView);
        break;
     case 'rojmel':
        context.push(RoutePath.rojmelMasterView);
        break;
      case 'item name':
        context.push(RoutePath.itemView);
        break;
    }
  }
}
