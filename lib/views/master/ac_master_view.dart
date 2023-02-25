import 'package:flutter/material.dart';
import 'package:uitoolkit/uitoolkit.dart';
import 'package:vyaparmandali/views/master/add_ac_master_view.dart';

class ACMasterListView extends StatefulWidget {
  const ACMasterListView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ACMasterListViewState();
  }
}

class ACMasterListViewState extends State<ACMasterListView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ac Master"),
        backgroundColor: ToolkitColors.primary,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        child: SingleChildScrollView(
          // scrollDirection: ScrollDirection.,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Name",
                      style: ToolkitTypography.h2
                          .copyWith(color: ToolkitColors.black),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Email Id",
                      style: ToolkitTypography.h2
                          .copyWith(color: ToolkitColors.black),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Phone no",
                      style: ToolkitTypography.h2
                          .copyWith(color: ToolkitColors.black),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Opening Balance",
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
                    builder: (context) => const AddACMasterList()));
          },
          child: const Icon(Icons.add)),
    );
  }

  Widget _gstBottomValue() {
    return Card(
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
                  "Shivam Pandey",
                  style: ToolkitTypography.body1A
                      .copyWith(color: ToolkitColors.black),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "shivamPandey@gmail.com",
                  style: ToolkitTypography.body1A
                      .copyWith(color: ToolkitColors.black),
                ),
              ),
              const Expanded(
                flex: 1,
                child: Text("9999007766"),
              ),
              const Expanded(
                flex: 1,
                child: Text("Rs: 99990"),
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
    );
  }
}
