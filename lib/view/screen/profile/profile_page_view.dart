import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vyaparmandali/app_manager/helper/responsive/responsive.dart';
import 'package:vyaparmandali/app_manager/theme/color_constant.dart';
import 'package:vyaparmandali/authentication/user_repository.dart';
import 'package:vyaparmandali/gen/assets.gen.dart';
import 'package:vyaparmandali/model/user.dart';

import 'widget/profile_info.dart';


class ProfilePageView extends StatelessWidget {
  const ProfilePageView({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: SafeArea(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              const TopBackground(),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: AppColor.black.withOpacity(0.4),
                          offset: const Offset(0,0,),
                          spreadRadius: 1,
                          blurRadius: 5
                      )
                    ]
                ),
                margin: Responsive.isSmallScreen(context)?
                const EdgeInsets.all(20) : const EdgeInsets.only(top: 100,left: 50,right: 50,bottom: 100),
                height:  double.infinity,
                child: Center(
                  child: Selector<UserRepository, User>(
                      shouldRebuild: (prev, nex) => true,
                      selector: (buildContext, vm) => vm.getUser,
                      builder: (context, User data, child) {
                        return ProfileInfoView(
                            user: data
                        );
                      }),
                ),
              ),],
          )),
    );
  }
}


class TopBackground extends StatelessWidget {
  const TopBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Assets.images.mount.image(
        fit: BoxFit.cover,
      ),
    );
  }
}
