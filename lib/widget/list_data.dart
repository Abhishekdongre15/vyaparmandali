import 'package:flutter/material.dart';
import 'package:uitoolkit/uitoolkit.dart';
import 'package:vyaparmandali/widget/add_item.dart';

class ListData extends StatelessWidget {
  const ListData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 90),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Id"),
                  Text("Product Tile"),
                  Text("Product Body"),
                  Text("Actions"),
                ],
              ),
            ),

            ListRow(),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddItems()));
      },child: Icon(Icons.add)),
    );
  }
}

class ListRow extends StatefulWidget {
   ListRow({Key? key}) : super(key: key);


  @override
  State<ListRow> createState() => _ListRowState();
}

class _ListRowState extends State<ListRow> {
  var noOfItem = 10;
  void subValue(){
    noOfItem--;
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: noOfItem,
      itemBuilder: (context, index) {
        return rowView();
      },
    );
  }

  Widget rowView() {
    return Column(
      children: [
        Divider(),
        Padding(
          padding: const EdgeInsets.only(
            left: 25,
            right: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Code",
                style:
                    ToolkitTypography.body1A.copyWith(color: ToolkitColors.black),
              ),
              Text("Name"),
              Text("Rate(Kg)"),
              Row(
                children: [
                  UIToolkitButtons.primaryButton(
                    text: "Edit",
                    onPressed: () {},
                    style:ElevatedButton.styleFrom( shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),

                    ), backgroundColor:ToolkitColors.primary),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  UIToolkitButtons.secondaryButtonDark(
                      text: "Delete",
                      style:ElevatedButton.styleFrom( shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)
                      ),backgroundColor: Colors.redAccent),
                      onPressed: () {
                        setState(() {
                          subValue();
                        });
                      }),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
