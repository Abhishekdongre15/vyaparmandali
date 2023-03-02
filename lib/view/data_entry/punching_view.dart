import 'package:flutter/material.dart';
import 'package:uitoolkit/uitoolkit.dart';

// ignore: constant_identifier_names, camel_case_types
enum radioType { GroupWise, DescriptionWise }

bool isChanged = false;
int srNo = 1;

class PunchingView extends StatefulWidget {
  const PunchingView({Key? key}) : super(key: key);

  @override
  State<PunchingView> createState() => _PunchingViewState();
}

radioType _type = radioType.DescriptionWise;
List<DataRow> totalList = [
  DataRow(cells: [
    DataCell(Text('$srNo')),
    const DataCell(
      TextField(),
    ),
    const DataCell(TextField()),
    const DataCell(TextField()),
    const DataCell(TextField()),
    const DataCell(TextField()),
    const DataCell(TextField()),
    const DataCell(TextField()),
  ]),
];

void counter() {
  srNo++;
}

DateTime fdate = DateTime(2022, 11, 17);

class _PunchingViewState extends State<PunchingView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ToolkitColors.primary,
          title: const Text(
            "Punching View",
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              setState(() {
                counter();
                totalList.add(DataRow(cells: [
                  DataCell(Text('$srNo')),
                  const DataCell(TextField()),
                  const DataCell(TextField()),
                  const DataCell(TextField()),
                  const DataCell(TextField()),
                  const DataCell(TextField()),
                  const DataCell(TextField()),
                  const DataCell(TextField()),
                ]));
              });
            }),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              height: height * 0.3,
              width: double.infinity,
              // margin: EdgeInsets.only(top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.05,
                    width: double.infinity,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: height * 0.05,
                        color: Colors.green,
                        width: width * 0.05,
                        child: Center(
                          child: Text(
                            "A.no",
                            style: ToolkitTypography.h3
                                .copyWith(color: ToolkitColors.black),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: width * 0.01,
                          vertical: height * 0.01,
                        ),
                        height: height * 0.05,
                        color: Colors.white,
                        width: width * 0.07,
                        child: const TextField(),
                      ),
                      SizedBox(
                        height: height * 0.05,
                        width: width * 0.2,
                        child: ListTile(
                          title: const Text('Payment T'),
                          leading: Radio(
                            activeColor: ToolkitColors.black,
                            value: radioType.DescriptionWise,
                            groupValue: _type,
                            onChanged: (radioType? value) {
                              setState(() {
                                _type = value!;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.05,
                        width: width * 0.2,
                        child: ListTile(
                          title: const Text('Receipt T'),
                          leading: Radio(
                            activeColor: ToolkitColors.black,
                            value: radioType.GroupWise,
                            groupValue: _type,
                            onChanged: (radioType? value) {
                              setState(() {
                                _type = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
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
      ),
    );
  }

  Widget datTableEntry() {
    return DataTable(
      border: TableBorder.all(
        width: 1.0,
        color: Colors.grey,
      ),
      columns: const <DataColumn>[
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
