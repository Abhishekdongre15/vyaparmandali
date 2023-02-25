
import 'package:flutter/material.dart';
import 'package:uitoolkit/uitoolkit.dart';

// ignore: camel_case_types, constant_identifier_names
enum yearBalanceType { Yes, No }

// ignore: camel_case_types, constant_identifier_names
enum zeroBalanceType { Yes, No }

class TrialBalanceDetailScreenView extends StatefulWidget {
  const TrialBalanceDetailScreenView({Key? key}) : super(key: key);

  @override
  State<TrialBalanceDetailScreenView> createState() =>
      _TrialBalanceDetailScreenViewState();
}

class _TrialBalanceDetailScreenViewState
    extends State<TrialBalanceDetailScreenView> {
  DateTime fdate = DateTime(2022, 11, 17);
  yearBalanceType _type = yearBalanceType.No;
  zeroBalanceType _zero = zeroBalanceType.No;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ToolkitColors.primary,
        title: Text(
          "Trial Balance Detail Report",
          style: ToolkitTypography.h2.copyWith(color: Colors.white),
        ),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: height * 0.55,
          width: width * 0.5,
          decoration: BoxDecoration(
            color: ToolkitColors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              reUseContainer("<< Trial Balance Detail Report >>", height),
              dottedRow(),
              reUseRow(
                height: height,
                width: width,
                text: "As On",
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
                      margin: EdgeInsets.symmetric(horizontal: width * 0.01),
                      alignment: Alignment.center,
                      height: height * 0.07,
                      color: Colors.white,
                      width: double.infinity,
                      child: Text(
                        '${fdate.year}/${fdate.month}/${fdate.day}',
                      )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      "Print Previous Year Balance ?",
                      style: ToolkitTypography.h3
                          .copyWith(color: ToolkitColors.black),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: const Text('Yes'),
                      leading: Radio(
                        activeColor: ToolkitColors.black,
                        value: yearBalanceType.Yes,
                        groupValue: _type,
                        onChanged: (yearBalanceType? value) {
                          setState(() {
                            _type = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: const Text('No'),
                      leading: Radio(
                        activeColor: ToolkitColors.black,
                        value: yearBalanceType.No,
                        groupValue: _type,
                        onChanged: (yearBalanceType? value) {
                          setState(() {
                            _type = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      "Print A/C with Zero balance ?",
                      style: ToolkitTypography.h3
                          .copyWith(color: ToolkitColors.black),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: const Text('Yes'),
                      leading: Radio(
                        activeColor: ToolkitColors.black,
                        value: zeroBalanceType.Yes,
                        groupValue: _zero,
                        onChanged: (zeroBalanceType? value) {
                          setState(() {
                            _zero = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: const Text('No'),
                      leading: Radio(
                        activeColor: ToolkitColors.black,
                        value: zeroBalanceType.No,
                        groupValue: _zero,
                        onChanged: (zeroBalanceType? value) {
                          setState(() {
                            _zero = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
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
      margin: EdgeInsets.symmetric(
          horizontal: height * 0.01, vertical: height * 0.01),
      height: height * 0.07,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ToolkitColors.greyLight,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        data,
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
          width: width * 0.2,
          decoration: BoxDecoration(
            color: ToolkitColors.primary,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            text,
            style: ToolkitTypography.h3.copyWith(color: ToolkitColors.black),
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
            color: index % 2 == 0 ? Colors.transparent : Colors.black,
            height: 2,
          ),
        ),
      ),
    );
  }
}
