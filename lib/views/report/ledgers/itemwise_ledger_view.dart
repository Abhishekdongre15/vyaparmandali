import 'package:flutter/material.dart';
import 'package:uitoolkit/uitoolkit.dart';

class ItemWiseLedgerView extends StatefulWidget {
  const ItemWiseLedgerView({Key? key}) : super(key: key);

  @override
  State<ItemWiseLedgerView> createState() => _ItemWiseLedgerViewState();
}

class _ItemWiseLedgerViewState extends State<ItemWiseLedgerView> {
  DateTime fdate = DateTime(2022, 11, 17);
  DateTime tdate = DateTime(2022, 11, 17);
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ToolkitColors.primary,
        title: Text(
          "ItemWise Ledger",
          style: ToolkitTypography.h2.copyWith(color: Colors.white),
        ),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: height * 0.55,
          width: width * 0.7,
          decoration: BoxDecoration(
            color: ToolkitColors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              reUseContainer("Customer Detail Ledger of A/C", height),
              dottedRow(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: reUseRow(
                      height: height,
                      width: width,
                      text: "From ",
                      child: InkWell(
                        onTap: () async {
                          DateTime? fromDate = await showDatePicker(
                            context: context,
                            initialDate: fdate,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );
                          // if 'CANCEL' => null
                          if (fromDate == null) return;
                          // if 'OK' => DateTime
                          setState(() => fdate = fromDate);
                        },
                        child: Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: width * 0.01),
                            alignment: Alignment.center,
                            height: height * 0.07,
                            color: Colors.white,
                            width: double.infinity,
                            child: Text(
                              '${fdate.year}/${fdate.month}/${fdate.day}',
                            )),
                      ),
                    ),
                  ),
                  Expanded(
                    child: reUseRow(
                      height: height,
                      width: width,
                      text: "To",
                      child: InkWell(
                        onTap: () async {
                          DateTime? tillDate = await showDatePicker(
                            context: context,
                            initialDate: tdate,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );
                          // if 'CANCEL' => null
                          if (tillDate == null) return;
                          // if 'OK' => DateTime
                          setState(() => tdate = tillDate);
                        },
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: width * 0.01),
                          alignment: Alignment.center,
                          height: height * 0.07,
                          color: Colors.white,
                          width: double.infinity,
                          child: Text(
                            '${tdate.year}/${tdate.month}/${tdate.day}',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              reUseRow(
                  text: "Name",
                  child: Container(
                    margin:
                        EdgeInsets.only(right: width * 0.3, left: width * 0.01),
                    alignment: Alignment.center,
                    height: height * 0.07,
                    color: Colors.white,
                    width: double.infinity,
                    child: TextField(
                      controller: nameController,
                    ),
                  ),
                  width: width,
                  height: height),
              dottedRow(),
              reUseContainer("Enter Date", height),
            ],
          ),
        ),
      ),
    );
  }

  Widget reUseContainer(String data, double height) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(5),
      height: height * 0.07,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ToolkitColors.greyLight,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        '$data',
        style: ToolkitTypography.h3,
      ),
    );
  }

  Widget reUseRow(
      {required String text,
      required Widget child,
      required double width,
      required double height}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          alignment: Alignment.center,
          height: height * 0.07,
          width: width * 0.1,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            "$text",
            style: ToolkitTypography.h3.copyWith(color: ToolkitColors.white),
          ),
        ),
        SizedBox(
          width: width * 0.02,
        ),
        Expanded(child: child),
      ],
    );
  }

  Widget dottedRow() {
    return Row(
      children: List.generate(
        MediaQuery.of(context).size.width ~/ 10,
        (index) => Expanded(
          child: Container(
            color: index % 2 == 0 ? Colors.transparent : Colors.grey,
            height: 2,
          ),
        ),
      ),
    );
  }
}
