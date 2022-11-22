import 'package:flutter/material.dart';
import 'package:uitoolkit/uitoolkit.dart';

class PunchingView extends StatefulWidget {
  const PunchingView({Key? key}) : super(key: key);

  @override
  State<PunchingView> createState() => _PunchingViewState();
}

List<DataCell> totalList = [
  DataCell(Text('1')),
  DataCell(TextField()),
  DataCell(TextField()),
  DataCell(TextField()),
  DataCell(TextField()),
  DataCell(TextField()),
  DataCell(TextField()),
  DataCell(TextField()),
];

class _PunchingViewState extends State<PunchingView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ToolkitColors.primary,
        title: Text(
          "Punching View",
          style: ToolkitTypography.h2.copyWith(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {});
          }),
      body: Column(
        children: [
          Container(
            color: Colors.grey,
            height: height * 0.3,
            width: double.infinity,
            // margin: EdgeInsets.only(top: 5),
            child: Column(
              children: [
                Container(
                  color: ToolkitColors.primary,
                ),
              ],
            ),
          ),
          Container(
            height: height * 0.5,
            width: width * 1,
            child: datTableEntry(),
          ),
        ],
      ),
    );
  }

  Widget datTableEntry() {
    return DataTable(
      border: TableBorder.all(
        width: 1.0,
        color: Colors.grey,
      ),
      columns: <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              'No',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Patti No',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'A/C No',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Ammount',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'check no',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Nr.Cd',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Narr.Description',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Lott Des',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ],
      rows: <DataRow>[
        DataRow(cells: [
          DataCell(Text('1')),
          DataCell(TextField()),
          DataCell(TextField()),
          DataCell(TextField()),
          DataCell(TextField()),
          DataCell(TextField()),
          DataCell(TextField()),
          DataCell(TextField()),
        ]),
      ],
    );
  }
}
