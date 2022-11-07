import 'package:flutter/material.dart';
import 'package:reusekit/reusekit_controller.dart';
import 'package:vyaparmandali/views/components/light_sidebar.dart';
import '../constants.dart';
import '../util/my_box.dart';
import '../util/my_tile.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({Key? key}) : super(key: key);

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ReUseKit.getColor.white,
      appBar: PreferredSize(child: AppBarProfile(), preferredSize:  Size.fromHeight(120),),
      // open drawer
      // drawer: myDrawer,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            myDrawer,
            // first half of page
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  // first 4 boxes in grid
                  AspectRatio(
                    aspectRatio: 3,
                    child: SizedBox(
                      width: double.infinity,
                      child: GridView.count(
                        crossAxisCount: 3,
                        children: [
                          LightSidebar(
                              headName: 'Number of Sales',
                              totalValue: '999',
                              iconName: Icons.menu_open_outlined),
                          LightSidebar(
                              headName: 'Sales Revenue',
                              totalValue: '999',
                              iconName: Icons.shopify_outlined),
                          LightSidebar(
                            headName: 'Average Price',
                            totalValue: '999',
                            iconName: Icons.shopping_bag_rounded,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // list of previous days
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.width * 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: ReUseKit.getColor.white,
                        ),
                        // child: LineChartSample2(),
                      ),
                    ),
                    // List View builder code
                    // ListView.builder(
                    //   itemCount: 7,
                    //   itemBuilder: (context, index) {
                    //     return const MyTile();
                    //   },
                    // ),
                  ),
                ],
              ),
            ),
            // second half of page
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: ReUseKit.getColor.white,
                      ),
                      // child: PieChartSample2(),
                    ),
                  ),
                  // list of stuff
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: ReUseKit.getColor.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
