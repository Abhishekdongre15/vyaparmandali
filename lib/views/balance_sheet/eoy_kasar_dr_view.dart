import 'package:flutter/material.dart';
import 'package:uitoolkit/uitoolkit.dart';

// ignore: camel_case_types, constant_identifier_names
enum radioType { GroupWise, DescriptionWise }

class EOYKasarDrGroupView extends StatefulWidget {
  const EOYKasarDrGroupView({Key? key}) : super(key: key);

  @override
  State<EOYKasarDrGroupView> createState() => _EOYKasarDrGroupViewState();
}

class _EOYKasarDrGroupViewState extends State<EOYKasarDrGroupView> {
  DateTime fdate = DateTime(2022, 11, 17);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ToolkitColors.primary,
        title: Text(
          "EOY Kasar Dr Report",
          style: ToolkitTypography.h2.copyWith(color: Colors.white),
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: width * 0.001),
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
              reUseContainer("<< Year End Kasar >>", height),
              dottedRow(),
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: height * 0.07,
                    width: width * 0.3,
                    decoration: BoxDecoration(
                      color: ToolkitColors.primary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      "From",
                      style: ToolkitTypography.h3
                          .copyWith(color: ToolkitColors.black),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        const Text("["),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: width * 0.01),
                          alignment: Alignment.center,
                          height: height * 0.07,
                          color: Colors.transparent,
                          width: 100,
                          child: const TextField(),
                        ),
                        const Text("]"),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: height * 0.07,
                    width: width * 0.3,
                    decoration: BoxDecoration(
                      color: ToolkitColors.primary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      "To",
                      style: ToolkitTypography.h3
                          .copyWith(color: ToolkitColors.black),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        const Text("["),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: width * 0.01),
                          alignment: Alignment.center,
                          height: height * 0.07,
                          color: Colors.transparent,
                          width: 100,
                          child: const TextField(),
                        ),
                        const Text("]"),
                      ],
                    ),
                  ),
                ],
              ),
              reUseRow(
                height: height,
                width: width,
                text: "As on (DD/MM/YY)",
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
              reUseRow(
                  text: "Enter Amount For > [00.00]",
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.01),
                    alignment: Alignment.center,
                    height: height * 0.07,
                    color: Colors.white,
                    width: width * 0.03,
                    child: const TextField(),
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
