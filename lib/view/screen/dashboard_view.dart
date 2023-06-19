
import 'package:flutter/material.dart';

import 'package:vyaparmandali/app_manager/theme/color_constant.dart';
import 'package:vyaparmandali/authentication/user_repository.dart';
import 'package:vyaparmandali/ui_tool_kit/src/colors.dart';
import 'package:vyaparmandali/widget/app_bar_profile.dart';
import 'package:vyaparmandali/components/light_sidebar.dart';
import 'package:vyaparmandali/model/user.dart';
import 'package:vyaparmandali/widget/my_drawer.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {

    User user=UserRepository.of(context).getUser;
    final theme=Theme.of(context);

    return Scaffold(
      backgroundColor: ToolkitColors.white,
      drawer: const MyDrawer(),
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
