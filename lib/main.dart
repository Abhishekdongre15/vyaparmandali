
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:vyaparmandali/app_manager/constant/project_constant.dart';
import 'package:vyaparmandali/app_manager/helper/navigation/go_routes.dart';
import 'package:vyaparmandali/app_manager/helper/navigation/route_name.dart';
import 'package:vyaparmandali/app_manager/service/navigation_service.dart';
import 'package:vyaparmandali/app_manager/theme/theme_provider.dart';
import 'package:vyaparmandali/authentication/user_repository.dart';
import 'package:vyaparmandali/model/user.dart';
import 'package:vyaparmandali/view_model/customer_view_model.dart';
import 'package:vyaparmandali/view_model/agent_view_model.dart';
import 'package:vyaparmandali/view_model/bank_view_model.dart';
import 'package:vyaparmandali/view_model/cash_book_item_view_model.dart';
import 'package:vyaparmandali/view_model/dhada_book_view_model.dart';
import 'package:vyaparmandali/view_model/farmer_view_model.dart';
import 'package:vyaparmandali/view_model/group_view_model.dart';
import 'package:vyaparmandali/view_model/hamal_view_model.dart';
import 'package:vyaparmandali/view_model/login_view_model.dart';
import 'package:vyaparmandali/view_model/narration_view_model.dart';
import 'package:vyaparmandali/view_model/product_view_model.dart';
import 'package:vyaparmandali/view_model/registration_view_model.dart';
import 'package:vyaparmandali/view_model/rojmel_view_model.dart';
import 'package:vyaparmandali/view_model/user_registration_master_view_model.dart';
import 'package:vyaparmandali/view_model/vacchat_view_model.dart';
import 'package:vyaparmandali/view_model/vehicle_view_model.dart';
import 'package:vyaparmandali/view_model/weight_view_model.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

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
  usePathUrlStrategy();
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
        ChangeNotifierProvider<RojmelViewModel>(
            create: (_) => RojmelViewModel()),
        ChangeNotifierProvider<HamalViewModel>(
            create: (_) => HamalViewModel()),
        ChangeNotifierProvider<CustomerViewModel>(
            create: (_) => CustomerViewModel()),
        ChangeNotifierProvider<AgentViewModel>(
            create: (_) => AgentViewModel()),
        ChangeNotifierProvider<BankViewModel>(
            create: (_) => BankViewModel()),
        ChangeNotifierProvider<ProductViewModel>(
            create: (_) => ProductViewModel()),
        ChangeNotifierProvider<WeightViewModel>(
            create: (_) => WeightViewModel()),
        ChangeNotifierProvider<VehicleViewModel>(
            create: (_) => VehicleViewModel()),
        ChangeNotifierProvider<FarmerViewModel>(
            create: (_) => FarmerViewModel()),
        ChangeNotifierProvider<VacchatViewModel>(
            create: (_) => VacchatViewModel()),
        ChangeNotifierProvider<DhadaBookViewModel>(
            create: (_) => DhadaBookViewModel()),
        ChangeNotifierProvider<CashBookItemViewModel>(
            create: (_) => CashBookItemViewModel()),
        ChangeNotifierProvider<UserRegistrationMasterViewModel>(
            create: (_) => UserRegistrationMasterViewModel()),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {

  const MyApp({super.key,});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return GetMaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      theme: themeProvider.getThemeData,
      title: ProjectConstant.name,
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.initial,
      getPages: getPages,
    );
  }
}

