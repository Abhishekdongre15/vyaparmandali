import 'package:flutter/material.dart';
import 'package:uitoolkit/uitoolkit.dart';

bool isChanged = false;
int srNo = 1;

class PunchingView extends StatefulWidget {
  const PunchingView({Key? key}) : super(key: key);

  @override
  State<PunchingView> createState() => _PunchingViewState();
}

List<DataRow> totalList = [
  DataRow(cells: [
    DataCell(Text('$srNo')),
    DataCell(
      textFiled2(),
    ),
    DataCell(textFiled2()),
    DataCell(textFiled2()),
    DataCell(textFiled2()),
    DataCell(textFiled2()),
    DataCell(textFiled2()),
    DataCell(textFiled2()),
  ]),
];

void counter() {
  srNo++;
}

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
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              counter();
              totalList.add(DataRow(cells: [
                DataCell(Text('$srNo')),
                DataCell(textFiled2()),
                DataCell(textFiled2()),
                DataCell(textFiled2()),
                DataCell(textFiled2()),
                DataCell(textFiled2()),
                DataCell(textFiled2()),
                DataCell(textFiled2()),
              ]));
            });
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
                  color: Colors.green,
                ),
              ],
            ),
          ),
          Container(
            height: height * 0.6,
            width: double.infinity,
            child: ListView(
              children: [
                datTableEntry(),
              ],
            ),
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
      rows: totalList,
    );
  }
}

class textFiled2 extends StatelessWidget {
  textFiled2({Key? key}) : super(key: key);
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      onChanged: (v) {
        if (v.trim().isNotEmpty) {
          isChanged = true;
        }
      },
    );
  }
}
