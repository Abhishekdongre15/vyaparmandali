import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uitoolkit/uitoolkit.dart';
import 'package:vyaparmandali/app_manager/helper/navigation/navigator.dart';
import 'package:vyaparmandali/route_name.dart';

class ItemExpView extends StatefulWidget {
  const ItemExpView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ItemExpViewState();
  }
}

class ItemExpViewState extends State<ItemExpView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Item Exp"),
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
                        "Sr.no",
                        style: ToolkitTypography.h2
                            .copyWith(color: ToolkitColors.black),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Date",
                        style: ToolkitTypography.h2
                            .copyWith(color: ToolkitColors.black),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Mitm_cd",
                        style: ToolkitTypography.h2
                            .copyWith(color: ToolkitColors.black),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Comm",
                        style: ToolkitTypography.h2
                            .copyWith(color: ToolkitColors.black),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "P.Hamali",
                        style: ToolkitTypography.h2
                            .copyWith(color: ToolkitColors.black),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "B.hamali",
                        style: ToolkitTypography.h2
                            .copyWith(color: ToolkitColors.black),
                      ),
                    ),  Expanded(
                      flex: 1,
                      child: Text(
                        "Levy",
                        style: ToolkitTypography.h2
                            .copyWith(color: ToolkitColors.black),
                      ),
                    ),  Expanded(
                      flex: 1,
                      child: Text(
                        "Total",
                        style: ToolkitTypography.h2
                            .copyWith(color: ToolkitColors.black),
                      ),
                    ),
                    Expanded(
                      flex: 2,
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
           context.go(RoutePath.addItemExp);
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
                    "1",
                    style: ToolkitTypography.body1A
                        .copyWith(color: ToolkitColors.black),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "11/11/1111",
                    style: ToolkitTypography.body1A
                        .copyWith(color: ToolkitColors.black),
                  ),
                ), const Expanded(
                  flex: 1,
                  child: Text("Onion"),
                ),const Expanded(
                  flex: 1,
                  child: Text("6.50"),
                ),const Expanded(
                  flex: 1,
                  child: Text("4.09"),
                ),const Expanded(
                  flex: 1,
                  child: Text("6.85"),
                ),const Expanded(
                  flex: 1,
                  child: Text("0.00"),
                ),const Expanded(
                  flex: 1,
                  child: Text("2.67"),
                ),
                Expanded(
                  flex: 2,
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
