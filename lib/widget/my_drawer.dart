

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vyaparmandali/app_manager/theme/color_constant.dart';
import 'package:vyaparmandali/authentication/user_repository.dart';
import 'package:vyaparmandali/components/drawer_list.dart';
import 'package:vyaparmandali/model/user.dart';
import 'package:vyaparmandali/util/constants.dart';
import 'package:vyaparmandali/widget/user_avatar.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    return Drawer(
      backgroundColor: AppColor.white,
      elevation: 0,
      child: Column(
          children: <Widget>[
        SizedBox(
          height: 200,
          child: Column(
            children:  [
              const Expanded(
                child: UserAvatar(
                  radius: 40,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Selector<UserRepository, User>(
                    shouldRebuild: (prev, nex) => true,
                    selector: (buildContext, vm) => vm.getUser,
                    builder: (context, User data, child) {
                      return Text('${data.firstname??""} ${data.lastname??""}',
                        style: theme.textTheme.titleMedium,
                      );
                    }),)
            ],
          ),
        ),
        Expanded(
          child: DrawerList(
            entry: data,
          ),
        ),
      ]),
    );
  }
}
