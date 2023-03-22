import 'package:flutter/material.dart';
import 'package:uitoolkit/uitoolkit.dart';
import 'package:vyaparmandali/view/add_outword_litst_view.dart';

class OutWardListView extends StatefulWidget {
  const OutWardListView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OutWardListViewState();
  }
}

class OutWardListViewState extends State<OutWardListView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("OutWord "),
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
                        "S.no",
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
                        "Vehicle No",
                        style: ToolkitTypography.h2
                            .copyWith(color: ToolkitColors.black),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Inword Date",
                        style: ToolkitTypography.h2
                            .copyWith(color: ToolkitColors.black),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Party Name",
                        style: ToolkitTypography.h2
                            .copyWith(color: ToolkitColors.black),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Lot Name",
                        style: ToolkitTypography.h2
                            .copyWith(color: ToolkitColors.black),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Balance Qty",
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddOutWordLIstView()));
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
                    "S.no",
                    style: ToolkitTypography.body1A
                        .copyWith(color: ToolkitColors.black),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Date",
                    style: ToolkitTypography.body1A
                        .copyWith(color: ToolkitColors.black),
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: Text("Vehicle No"),
                ),
                const Expanded(
                  flex: 1,
                  child: Text("Inword Date"),
                ),  const Expanded(
                  flex: 1,
                  child: Text("Party Name"),
                ),
                const Expanded(
                  flex: 1,
                  child: Text("Lot"),
                ),
                const Expanded(
                  flex: 1,
                  child: Text("Balance Qty"),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      UIToolkitButtons.iconButton(
                          text: "",
                          onPressed: () {},
                          icon: ToolkitAssets.iconEye44),
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
