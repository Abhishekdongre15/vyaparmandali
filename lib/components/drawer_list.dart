import 'package:flutter/material.dart';
import 'package:vyaparmandali/widget/Entry.dart';

import '../widget/EntryItem.dart';
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
      ),
    );
  }
}
/// Make Multiple widgets in this same file