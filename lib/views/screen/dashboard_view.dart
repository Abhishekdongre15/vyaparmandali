

import 'package:flutter/material.dart';
import 'package:uitoolkit/uitoolkit.dart';
import 'package:vyaparmandali/app_manager/theme/color_constant.dart';
import 'package:vyaparmandali/authentication/user_repository.dart';
import 'package:vyaparmandali/components/app_bar_profile.dart';
import 'package:vyaparmandali/components/drawer_list.dart';
import 'package:vyaparmandali/components/light_sidebar.dart';
import 'package:vyaparmandali/model/user.dart';
import 'package:vyaparmandali/util/constants.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    User user=UserRepository.of(context).getUser;
    final theme=Theme.of(context);

    return Scaffold(
      backgroundColor: ToolkitColors.white,
      drawer: Drawer(
        backgroundColor: ToolkitColors.white,
        elevation: 0,
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[

          SizedBox(
            height: size.height * 0.25,
            child: DrawerHeader(
              child: Column(
                children: const [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                        'https://media.istockphoto.com/photos/millennial-male-team-leader-organize-virtual-workshop-with-employees-picture-id1300972574?b=1&k=20&m=1300972574&s=170667a&w=0&h=2nBGC7tr0kWIU8zRQ3dMg-C5JLo9H2sNUuDjQ5mlYfo='),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
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
            height: size.height * 0.70,
            child: DrawerList(
              entry: data,
            ),
          ),
        ]),
      ),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(52),
        child: AppBarProfile(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:       Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            Text("Welcome ${user.firstname??""}",
            style: theme.textTheme.titleMedium!.copyWith(
              color: AppColor.primaryColor
            ),),
            const SizedBox(height: 20,),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
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
            )
          ],
        ),
      ),
    );
  }
}
