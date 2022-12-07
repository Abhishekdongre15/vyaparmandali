import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:uitoolkit/uitoolkit.dart';
import 'package:uitoolkit/uitoolkit.dart';
import 'package:uitoolkit/uitoolkit.dart';
import 'package:vyaparmandali/responsive/mobile_body.dart';
import 'package:vyaparmandali/responsive/responsive_layout.dart';

class AccountSettingView extends StatefulWidget {
  const AccountSettingView({Key? key}) : super(key: key);

  @override
  State<AccountSettingView> createState() => _AccountSettingViewState();
}

class _AccountSettingViewState extends State<AccountSettingView> {
  TextEditingController accountCodeController = TextEditingController();
  TextEditingController accountBoxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print(width);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ToolkitColors.primary,
        title: Text(
          "Account Setting".toUpperCase(),
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
              reUseContainer("Account Setting".toUpperCase(), height),
              dottedRow(),
              reUseRow(
                tStyle:
                    ToolkitTypography.h3.copyWith(color: ToolkitColors.black),
                height: height,
                width: width,
                text: "Account Code".toUpperCase(),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          right: height * 0.03, bottom: height * 0.01),
                      height: height * 0.07,
                      width: double.infinity,
                      color: Colors.white,
                      child: TextField(),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: height * 0.03),
                        height: height * 0.07,
                        width: double.infinity,
                        color: Colors.white,
                        child: TextField(),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: height * 0.03),
                        height: height * 0.07,
                        width: width / 0.25,
                        color: Colors.white,
                        child: TextField(),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: height * 0.01),
                margin: EdgeInsets.only(
                    left: height * 0.01,
                    right: height * 0.01,
                    bottom: height * 0.02),
                height: height * 0.1,
                width: width,
                color: Colors.white,
                child: width < 750
                    ? ListView(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Text("Commision",
                                      style: ToolkitTypography.body1A)),
                              Expanded(
                                  flex: 1,
                                  child: Text("Hamali",
                                      style: ToolkitTypography.body1A)),
                              Expanded(
                                  flex: 1,
                                  child: Text("Levy",
                                      style: ToolkitTypography.body1A)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Text("Tolai",
                                      style: ToolkitTypography.body1A)),
                              Expanded(
                                  flex: 1,
                                  child: Text("Vatav",
                                      style: ToolkitTypography.body1A)),
                              Expanded(
                                  flex: 1,
                                  child: Text("Market",
                                      style: ToolkitTypography.body1A)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Text("Market Fees",
                                      style: ToolkitTypography.body1A)),
                              Expanded(
                                  flex: 2,
                                  child: Text("Monitoring Fees",
                                      style: ToolkitTypography.body1A)),
                            ],
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Text("Commision",
                                      style: ToolkitTypography.h3)),
                              Expanded(
                                  flex: 1,
                                  child: Text("Hamali",
                                      style: ToolkitTypography.h3)),
                              Expanded(
                                  flex: 1,
                                  child: Text("Levy",
                                      style: ToolkitTypography.h3)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Text("Tolai",
                                      style: ToolkitTypography.h3)),
                              Expanded(
                                  flex: 1,
                                  child: Text("Vatav",
                                      style: ToolkitTypography.h3)),
                              Expanded(
                                  flex: 1,
                                  child: Text("Market",
                                      style: ToolkitTypography.h3)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Text("Market Fees",
                                      style: ToolkitTypography.h3)),
                              Expanded(
                                  flex: 2,
                                  child: Text("Monitoring Fees",
                                      style: ToolkitTypography.h3)),
                            ],
                          ),
                        ],
                      ),
              ),
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
      required TextStyle tStyle,
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
            "$text",
            style: tStyle,
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
