// Create the Widget for the row
import 'package:flutter/material.dart';
import 'package:uitoolkit/uitoolkit.dart';
import 'package:vyaparmandali/views/group_master_list_view.dart';
import 'package:vyaparmandali/views/list_data_view.dart';

import 'Entry.dart';

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry, this.context);

  final Entry entry;
  final BuildContext context;

// This function recursively creates the multi-level list rows.
  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) {
      return ListTile(
        title: GestureDetector(
            onTap: () {
              /* if (root.title.toLowerCase() == 'GROUP'.toLowerCase()) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const GroupMasterListView(),));

              }else if() {

              }*/

              callPages(root.title.toLowerCase());
            },
            child: Text(
              root.title,
            )),
      );
    }
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: GestureDetector(
          onTap: () {
            if (root.title.toLowerCase() == 'GROUP'.toLowerCase()) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GroupMasterListView(),
                  ));
            }
          },
          child: GestureDetector(
            onTap: () {
              if (root.title.toLowerCase() == 'GROUP'.toLowerCase()) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GroupMasterListView(),
                    ));
              }
            },
            child: Text(
              root.title,
              style:
                  ToolkitTypography.body1A.copyWith(color: ToolkitColors.black),
            ),
          )),
      children: root.children.map<Widget>(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }

  void callPages(String pages) {
    switch (pages) {
      case 'group':
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const GroupMasterListView(),
            ));
        break;
      case 'group':
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ListDataView(),
            ));
        break;
    }
  }
}