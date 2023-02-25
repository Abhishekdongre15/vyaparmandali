import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vyaparmandali/views/login_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vyapar Mandali',
      home: Scaffold(
        body: LoginView(),
        // ResponsiveLayout(
        //   mobileBody: const LoginView(),
        //   tabletBody: const LoginView(),
        //   desktopBody: const DesktopScaffold(),
        // ),

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
