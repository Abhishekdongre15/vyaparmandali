
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vyaparmandali/app_manager/constant/project_constant.dart';
import 'package:vyaparmandali/app_manager/helper/navigation/navigator.dart';
import 'package:vyaparmandali/app_manager/helper/navigation/route_name.dart';
import 'package:vyaparmandali/app_manager/theme/color_constant.dart';
import 'package:vyaparmandali/authentication/user_repository.dart';
import 'package:vyaparmandali/model/user.dart';
import 'package:vyaparmandali/view/screen/dashboard_view.dart';
import 'package:vyaparmandali/view/screen/login_screen_view.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    //time to load new page
    Future.delayed(const Duration(seconds: 1), () {
      if(mounted){
        User user = UserRepository.of(context).getUser;
        if (user.id == null) {
          MyNavigator.pushReplacementNamed(RouteName.login);
        } else {
          MyNavigator.pushReplacementNamed(RouteName.dashboard);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: Text(
          ProjectConstant.name,
          style: theme.textTheme.titleLarge,
        ),
      ),
    );
  }
}
