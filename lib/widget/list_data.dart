import 'package:flutter/material.dart';

class ListData extends StatelessWidget {
  const ListData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Id"),
                Text("Product Tile"),
                Text("Product Body"),
                Text("Actions"),
              ],
            ),
            Divider(),
            ListRow(),
            Divider(),
          ],
        ),
      ),
    );
  }

}

class ListRow extends StatelessWidget {
  const ListRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Id"),
          Text("Product Tile"),
          Text("Product Body"),
          Row(children: [

          ],),
        ],
      ),
    );
  }
}
