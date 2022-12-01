import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vyaparmandali/responsive/desktop_body.dart';
import 'package:vyaparmandali/responsive/responsive_layout.dart';
import 'package:vyaparmandali/views/data_entry/PunchingView.dart';
import 'package:vyaparmandali/views/login_view.dart';
import 'package:vyaparmandali/views/master/ac_master_view.dart';
import 'package:vyaparmandali/views/report/cash%20bank%20book/rojmel_ac_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vyapar Mandali',
      home: Scaffold(
        body:
            // PunchingView(),
            ResponsiveLayout(
          mobileBody: const ACMasterListView(),
          tabletBody: const ACMasterListView(),
          desktopBody: const ACMasterListView(),
        ),
      ),
      // home: ResponsiveLayout(
      //   mobileBody: const LoginView(),
      //   tabletBody: const LoginView(),
      //   desktopBody: const DesktopScaffold(),
      // ),
    );
  }
}

class CustomScrollBehaviour extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
