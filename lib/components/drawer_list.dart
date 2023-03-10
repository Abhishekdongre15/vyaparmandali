import 'package:flutter/material.dart';
import 'package:vyaparmandali/widget/entry.dart';

import '../widget/entry_item.dart';
// ignore: must_be_immutable
class DrawerList extends StatelessWidget {
  List<Entry> entry;

  DrawerList({Key? key, required this.entry, })
      : super(key: key);

  // Make multiple Widget
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: entry.length,
      itemBuilder: (BuildContext context, int index) => EntryItem(
        entry[index],
        context
      ),
    );
  }
}