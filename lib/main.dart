import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:vyaparmandali/responsive/desktop_body.dart';
import 'package:vyaparmandali/responsive/mobile_body.dart';
import 'package:vyaparmandali/responsive/responsive_layout.dart';
import 'package:vyaparmandali/responsive/tablet_body.dart';
import 'package:vyaparmandali/views/login_view.dart';
import 'package:vyaparmandali/widget/list_data.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vyapar Mandali',
      home:
      // ToDoView(),
      ResponsiveLayout(
        mobileBody: const LoginView(),
        tabletBody: const LoginView(),
        desktopBody: const ListData(),
      ),
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
