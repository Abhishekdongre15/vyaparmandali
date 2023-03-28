import 'package:flutter/material.dart';
import 'package:uitoolkit/uitoolkit.dart';
import 'package:vyaparmandali/app_manager/helper/navigation/navigator.dart';
import 'package:vyaparmandali/app_manager/helper/navigation/route_name.dart';

class HamaliExpView extends StatefulWidget {
  const HamaliExpView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HamaliExpViewState();
  }
}

class HamaliExpViewState extends State<HamaliExpView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title:  Text("Hamali Exp View",style: ToolkitTypography.h2.copyWith(color: ToolkitColors.black)),
        backgroundColor: ToolkitColors.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Item Code",
                        style: ToolkitTypography.h2
                            .copyWith(color: ToolkitColors.black),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Item Detail",
                        style: ToolkitTypography.h2
                            .copyWith(color: ToolkitColors.black),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Register",
                        style: ToolkitTypography.h2
                            .copyWith(color: ToolkitColors.black),
                      ),
                    ), Expanded(
                      flex: 1,
                      child: Text(
                        "Trolly no",
                        style: ToolkitTypography.h2
                            .copyWith(color: ToolkitColors.black),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Actions",
                        style: ToolkitTypography.h2
                            .copyWith(color: ToolkitColors.black),
                      ),
                    ),
                  ],
                ),
              ),
              ListView.separated(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.only(left: 0),
                  );
                },
                padding: EdgeInsets.zero,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return _gstBottomValue();
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            MyNavigator.pushNamed(RouteName.addHamaliExpView);
          },
          child: const Icon(Icons.add)),
    );
  }

  Widget _gstBottomValue() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: ToolkitColors.white,
        shadowColor: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "0",
                    style: ToolkitTypography.body1A
                        .copyWith(color: ToolkitColors.black),
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: Text("Detail"),
                ),
                const Expanded(
                  flex: 1,
                  child: Text("Register"),
                ),const Expanded(
                  flex: 1,
                  child: Text("Trolly no"),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      UIToolkitButtons.iconButton(
                          text: "",
                          onPressed: () {},
                          icon: ToolkitAssets.editIcon44),
                      UIToolkitButtons.iconButton(
                          text: "",
                          onPressed: () {},
                          icon: ToolkitAssets.iconTrash44),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}