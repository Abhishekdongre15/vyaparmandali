import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uitoolkit/uitoolkit.dart';
import 'package:vyaparmandali/views/master/codes/add_group_master_view.dart';
import 'package:vyaparmandali/views/add_list_data_view.dart';
import 'package:vyaparmandali/views/master/codes/add_narration_view.dart';

class NarrationView extends StatefulWidget {
  const NarrationView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NarrationViewState();
  }
}

class NarrationViewState extends State<NarrationView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title:Text("Narration View",style: ToolkitTypography.h2.copyWith(color: ToolkitColors.black)),
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
                        "Code",
                        style: ToolkitTypography.h2
                            .copyWith(color: ToolkitColors.black),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Detail",
                        style: ToolkitTypography.h2
                            .copyWith(color: ToolkitColors.black),
                      ),
                    ),  Expanded(
                      flex: 1,
                      child: Text(
                        "Action",
                        style: ToolkitTypography.h2
                            .copyWith(color: ToolkitColors.black),
                      ),
                    ),
                  ],
                ),
              ),
              ListView.separated(
                physics: ClampingScrollPhysics(),
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
      floatingActionButton: FloatingActionButton(onPressed: () {
        Get.to(AddNarrationView());
      },child: const Icon(Icons.add),),
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
                    "Code",
                    style: ToolkitTypography.body1A
                        .copyWith(color: ToolkitColors.black),
                  ),
                ),
                Expanded(
                  child: Text("Description"),
                  flex: 1,
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
