import 'package:flutter/material.dart';
import 'package:uitoolkit/uitoolkit.dart';
import '../components/app_bar_profile.dart';
import '../components/drawer_list.dart';
import '../components/light_sidebar.dart';
import '../util/constants.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({Key? key}) : super(key: key);

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;

    return Scaffold(
      backgroundColor: ToolkitColors.white,
      drawer: Drawer(
        backgroundColor: ToolkitColors.white,
        elevation: 0,
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
          SizedBox(
            height:  size.height * 0.25,

            child: DrawerHeader(
              child: Column(
                children: const [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                        'https://media.istockphoto.com/photos/millennial-male-team-leader-organize-virtual-workshop-with-employees-picture-id1300972574?b=1&k=20&m=1300972574&s=170667a&w=0&h=2nBGC7tr0kWIU8zRQ3dMg-C5JLo9H2sNUuDjQ5mlYfo='),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Shivam Pandey',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height:  size.height * 0.75,
            child: DrawerList(
              entry: data,
            ),
          ),
        ]),
      ),
      appBar: const PreferredSize(preferredSize:  Size.fromHeight(52),child: AppBarProfile(),),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  ),          // list of previous days
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.width * 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: ToolkitColors.white,
                        ),
                        // child: LineChartSample2(),
                      ),
                    ),          ),
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
                        color: ToolkitColors.white,
                      ),
                    ),
                  ),
                  // list of stuff
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: ToolkitColors.white,
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
