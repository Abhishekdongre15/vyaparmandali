
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vyaparmandali/app_manager/constant/project_constant.dart';
import 'package:vyaparmandali/app_manager/service/navigation_service.dart';
import 'package:vyaparmandali/app_manager/theme/theme_provider.dart';
import 'package:vyaparmandali/authentication/user_repository.dart';
import 'package:vyaparmandali/model/user.dart';
import 'package:vyaparmandali/view/screen/splash_screen_view.dart';
import 'package:vyaparmandali/view_model/agent_view_model.dart';
import 'package:vyaparmandali/view_model/bank_view_model.dart';
import 'package:vyaparmandali/view_model/cash_book_item_view_model.dart';
import 'package:vyaparmandali/view_model/group_view_model.dart';
import 'package:vyaparmandali/view_model/hamal_view_model.dart';
import 'package:vyaparmandali/view_model/login_view_model.dart';
import 'package:vyaparmandali/view_model/narration_view_model.dart';
import 'package:vyaparmandali/view_model/registration_view_model.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  bool isLightTheme = await ThemeProvider().retrieveStoredTheme();
  User user = await UserRepository.fetchUserData();

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider(isLightTheme: isLightTheme),
        ),
        ChangeNotifierProvider<UserRepository>(
          create: (_) => UserRepository(currentUser: user),
        ),
        ChangeNotifierProvider<RegistrationViewModel>(
        create: (_) => RegistrationViewModel()),
        ChangeNotifierProvider<LoginViewModel>(
            create: (_) => LoginViewModel()),
        ChangeNotifierProvider<GroupViewModel>(
            create: (_) => GroupViewModel()),
        ChangeNotifierProvider<NarrationViewModel>(
            create: (_) => NarrationViewModel()),
        ChangeNotifierProvider<CashBookItemViewModel>(
            create: (_) => CashBookItemViewModel()),
        ChangeNotifierProvider<HamalViewModel>(
            create: (_) => HamalViewModel()),
        ChangeNotifierProvider<AgentViewModel>(
            create: (_) => AgentViewModel()),
        ChangeNotifierProvider<BankViewModel>(
            create: (_) => BankViewModel()),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {

  const MyApp({super.key,});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Widget initialWidget = const SplashScreenView();

   //  initialWidget= const DashboardView();
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      theme: themeProvider.getThemeData,
      title: ProjectConstant.name,
      debugShowCheckedModeBanner: false,
      home:  initialWidget,
    );
  }
}
