import 'package:flutter/material.dart';
import 'package:uitoolkit/uitoolkit.dart';

class BankBookView extends StatefulWidget {
  BankBookView({Key? key}) : super(key: key);

  @override
  State<BankBookView> createState() => _BankBookViewState();
}

class _BankBookViewState extends State<BankBookView> {
  DateTime fdate = DateTime(2022, 11, 17);
  DateTime tdate = DateTime(2022, 11, 17);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
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
              reUseContainer("Enter Period"),
              Divider(),
              reUseRow(
                text: "From Date",
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
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      alignment: Alignment.center,
                      height: 50,
                      color: Colors.white,
                      width: double.infinity,
                      child: Text(
                        '${fdate.year}/${fdate.month}/${fdate.day}',
                      )),
                ),
              ),
              reUseRow(
                text: "Till Date",
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
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      alignment: Alignment.center,
                      height: 50,
                      color: Colors.white,
                      width: double.infinity,
                      child: Text(
                        '${tdate.year}/${tdate.month}/${tdate.day}',
                      )),
                ),
              ),
              reUseRow(text: "Bank Name", child: Expanded(child: TextField(
              ),),),
              Divider(),
              reUseContainer("Bank Book"),
            ],
          ),
        ),
      ),
    );
  }

  Widget reUseContainer(String data) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(5),
      height: 40,
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

  Widget reUseRow({required String text, required Widget child}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(
            horizontal: 20,vertical: 10
          ),
          height: 40,
          width: 400,
          decoration: BoxDecoration(
            color: Color(0xffC576F6),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            "$text",
            style: ToolkitTypography.h3.copyWith(color: ToolkitColors.white),
          ),
        ),
        Expanded(child: child),
      ],
    );
  }
}