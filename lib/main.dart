
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vyaparmandali/app_manager/constant/project_constant.dart';
import 'package:vyaparmandali/route_name.dart';
import 'package:vyaparmandali/app_manager/service/navigation_service.dart';
import 'package:vyaparmandali/app_manager/theme/theme_provider.dart';
import 'package:vyaparmandali/authentication/user_repository.dart';
import 'package:vyaparmandali/model/dhada_book.dart';
import 'package:vyaparmandali/model/user.dart';
import 'package:vyaparmandali/model/vacchat.dart';
import 'package:vyaparmandali/view/forget_password_view.dart';
import 'package:vyaparmandali/view/master/ac_master_view.dart';
import 'package:vyaparmandali/view/master/add_place_master.dart';
import 'package:vyaparmandali/view/master/items/add_hamali_exp_view.dart';
import 'package:vyaparmandali/view/master/items/add_item_exp.dart';
import 'package:vyaparmandali/view/screen/dashboard_view.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/codes/group/group_master_view.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/codes/narrartion/narration_master_view.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/new/agent/agent_master_view.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/new/bank/bank_master_view.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/new/cash_book_item/cash_book_item_master_view.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/new/customer/customer_master_view.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/new/dhada_book/dhada_book_details_view.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/new/hamal/hamal_master_view.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/new/vacchat/vacchat_details_view.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/reports/report_view.dart';
import 'package:vyaparmandali/view/screen/login_screen_view.dart';
import 'package:vyaparmandali/view/screen/profile/profile_page_view.dart';
import 'package:vyaparmandali/view/screen/splash_screen_view.dart';
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
import 'package:vyaparmandali/view_model/report_view_model.dart';
import 'package:vyaparmandali/view_model/rojmel_view_model.dart';
import 'package:vyaparmandali/view_model/user_registration_master_view_model.dart';
import 'package:vyaparmandali/view_model/vacchat_view_model.dart';
import 'package:vyaparmandali/view_model/vehicle_view_model.dart';
import 'package:vyaparmandali/view_model/weight_view_model.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

import 'view/master/items/item_view.dart';
import 'view/screen/drawer_options_Screen/masters/new/dhada_book/dhada_book_master_view.dart';
import 'view/screen/drawer_options_Screen/masters/new/farmer/farmer_master_view.dart';
import 'view/screen/drawer_options_Screen/masters/new/product/product_master_view.dart';
import 'view/screen/drawer_options_Screen/masters/new/registered_user/registered_user_master_view.dart';
import 'view/screen/drawer_options_Screen/masters/new/rojmel/rojmel_master_view.dart';
import 'view/screen/drawer_options_Screen/masters/new/vacchat/vacchat_master_view.dart';
import 'view/screen/drawer_options_Screen/masters/new/vehicle/vehicle_master_view.dart';
import 'view/screen/drawer_options_Screen/masters/new/weight/weight_master_view.dart';
import 'view/screen/registration_screen_view.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

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
  if(kIsWeb){
    usePathUrlStrategy();
  }
  else {
    await FlutterDownloader.initialize(
        debug: true,
        ignoreSsl: true
    );
  }

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
        ChangeNotifierProvider<ReportViewModel>(
            create: (_) => ReportViewModel()),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {

  const MyApp({super.key,});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp.router(
      routerConfig: _router,
      theme: themeProvider.getThemeData,
      title: ProjectConstant.name,
      debugShowCheckedModeBanner: false,
    );
  }
}



final GoRouter _router = GoRouter(
  navigatorKey: NavigationService.navigatorKey,
  routes: <RouteBase>[
    GoRoute(
      path: RoutePath.initial,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreenView();
      },
    ),
    GoRoute(
      path: RoutePath.login,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreenView();
      },
    ),
    GoRoute(
      path: RoutePath.registrationScreenView,
      builder: (BuildContext context, GoRouterState state) {
        User? user = state.extra as User?;
        return  RegistrationScreenView(
            updateUser: user
        );
      },
    ),


    GoRoute(
      path: RoutePath.dashboard,
      builder: (BuildContext context, GoRouterState state) {
        return const DashboardView();
      },
    ),
    GoRoute(
      path: RoutePath.addHamaliExpView,
      builder: (BuildContext context, GoRouterState state) {
        return const AddHamaliExpView();
      },
    ),
    GoRoute(
      path: RoutePath.addItemExp,
      builder: (BuildContext context, GoRouterState state) {
        return const AddItemExp();
      },
    ),
    GoRoute(
      path: RoutePath.addPlaceMaster,
      builder: (BuildContext context, GoRouterState state) {
        return const AddPlaceMaster();
      },
    ),
    GoRoute(
      path: RoutePath.forgetPasswordView,
      builder: (BuildContext context, GoRouterState state) {
        return const ForgetPasswordView();
      },
    ),
    GoRoute(
      path: RoutePath.profilePageView,
      builder: (BuildContext context, GoRouterState state) {
        return const ProfilePageView();
      },
    ),
    GoRoute(
      path: RoutePath.cashBookItemMasterView,
      builder: (BuildContext context, GoRouterState state) {
        return const CashBookItemMasterView();
      },
    ),
    GoRoute(
      path: RoutePath.vacchatMasterView,
      builder: (BuildContext context, GoRouterState state) {
        return const VacchatMasterView();
      },
    ),
    GoRoute(
      path: RoutePath.dhadaBookMasterView,
      builder: (BuildContext context, GoRouterState state) {
        return const DhadaBookMasterView();
      },
    ),
    GoRoute(
      path: RoutePath.farmerMasterView,
      builder: (BuildContext context, GoRouterState state) {
        return const FarmerMasterView();
      },
    ),
    GoRoute(
      path: RoutePath.productMasterView,
      builder: (BuildContext context, GoRouterState state) {
        return const ProductMasterView();
      },
    ),
    GoRoute(
      path: RoutePath.vehicleMasterView,
      builder: (BuildContext context, GoRouterState state) {
        return const VehicleMasterView();
      },
    ),
    GoRoute(
      path: RoutePath.weightMasterView,
      builder: (BuildContext context, GoRouterState state) {
        return const WeightMasterView();
      },
    ),
    GoRoute(
      path: RoutePath.agentMasterView,
      builder: (BuildContext context, GoRouterState state) {
        return const AgentMasterView();
      },
    ),
    GoRoute(
      path: RoutePath.bankMasterView,
      builder: (BuildContext context, GoRouterState state) {
        return const BankMasterView();
      },
    ),
    GoRoute(
      path: RoutePath.hamalMasterView,
      builder: (BuildContext context, GoRouterState state) {
        return const HamalMasterView();
      },
    ),
    GoRoute(
      path: RoutePath.customerMasterView,
      builder: (BuildContext context, GoRouterState state) {
        return const CustomerMasterView();
      },
    ),
    GoRoute(
      path: RoutePath.groupMasterView,
      builder: (BuildContext context, GoRouterState state) {
        return const GroupMasterView();
      },
    ),
    GoRoute(
      path: RoutePath.narrationMasterView,
      builder: (BuildContext context, GoRouterState state) {
        return const NarrationMasterView();
      },
    ),
    GoRoute(
      path: RoutePath.acMasterListView,
      builder: (BuildContext context, GoRouterState state) {
        return const ACMasterListView();
      },
    ),
    GoRoute(
      path: RoutePath.rojmelMasterView,
      builder: (BuildContext context, GoRouterState state) {
        return const RojmelMasterView();
      },
    ),
    GoRoute(
      path: RoutePath.itemView,
      builder: (BuildContext context, GoRouterState state) {
        return const ItemView();
      },
    ),
    GoRoute(
      path: RoutePath.registeredUserMasterView,
      builder: (BuildContext context, GoRouterState state) {
        return const RegisteredUserMasterView();
      },
    ),
    GoRoute(
      path: RoutePath.vacchatDetailsView,
      builder: (BuildContext context, GoRouterState state) {
        Vacchat vacchat = state.extra as Vacchat;
        return VacchatDetailsView(vacchat: vacchat);
      },
    ),
    GoRoute(
      path: RoutePath.dhadaBookDetailsView,
      builder: (BuildContext context, GoRouterState state) {
        DhadaBook dhadabook = state.extra as DhadaBook;
        return DhadaBookDetailsView(dhadabook: dhadabook);
      },
    ),
    GoRoute(
      path: RoutePath.reportView,
      builder: (BuildContext context, GoRouterState state) {
        return const ReportView();
      },
    ),
  ],
);



