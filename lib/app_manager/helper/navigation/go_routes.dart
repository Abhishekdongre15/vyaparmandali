import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:vyaparmandali/app_manager/helper/navigation/route_name.dart';
import 'package:vyaparmandali/view/forget_password_view.dart';
import 'package:vyaparmandali/view/master/ac_master_view.dart';
import 'package:vyaparmandali/view/master/add_place_master.dart';
import 'package:vyaparmandali/view/master/items/add_hamali_exp_view.dart';
import 'package:vyaparmandali/view/master/items/add_item_exp.dart';
import 'package:vyaparmandali/view/master/items/item_view.dart';
import 'package:vyaparmandali/view/screen/dashboard_view.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/codes/group/group_master_view.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/codes/narrartion/narration_master_view.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/new/agent/agent_master_view.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/new/bank/bank_master_view.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/new/cash_book_item/cash_book_item_master_view.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/new/customer/customer_master_view.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/new/dhada_book/dhada_book_master_view.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/new/farmer/farmer_master_view.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/new/hamal/hamal_master_view.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/new/product/product_master_view.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/new/rojmel/rojmel_master_view.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/new/vacchat/vacchat_master_view.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/new/vehicle/vehicle_master_view.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/new/weight/weight_master_view.dart';
import 'package:vyaparmandali/view/screen/login_screen_view.dart';
import 'package:vyaparmandali/view/screen/profile/profile_page_view.dart';
import 'package:vyaparmandali/view/screen/registration_screen_view.dart';
import 'package:vyaparmandali/view/screen/splash_screen_view.dart';

final List<GetPage> getPages = [
  GetPage(
    name:  RouteName.initial,
    page: () {
      return const SplashScreenView();
    },
  ),
  GetPage(
    name: RouteName.login,
    page: () {
      return const LoginScreenView();
    },
  ),
  GetPage(
    name: RouteName.dashboard,
    page: () {
      return const DashboardView();
    },
  ),
  GetPage(
    name: RouteName.addHamaliExpView,
    page: () {
      return const AddHamaliExpView();
    },
  ),
  GetPage(
    name: RouteName.addItemExp,
    page: () {
      return const AddItemExp();
    },
  ),
  GetPage(
    name: RouteName.addPlaceMaster,
    page: () {
      return const AddPlaceMaster();
    },
  ),
  GetPage(
    name: RouteName.registrationScreenView,
    page: () {
      return const RegistrationScreenView();
    },
  ),
  GetPage(
    name: RouteName.forgetPasswordView,
    page: () {
      return const ForgetPasswordView();
    },
  ),
  GetPage(
    name: RouteName.profilePageView,
    page: () {
      return const ProfilePageView();
    },
  ),
  GetPage(
    name: RouteName.cashBookItemMasterView,
    page: () {
      return const CashBookItemMasterView();
    },
  ),
  GetPage(
    name: RouteName.vacchatMasterView,
    page: () {
      return const VacchatMasterView();
    },
  ),
  GetPage(
    name: RouteName.dhadaBookMasterView,
    page: () {
      return const DhadaBookMasterView();
    },
  ),
  GetPage(
    name: RouteName.farmerMasterView,
    page: () {
      return const FarmerMasterView();
    },
  ),
  GetPage(
    name: RouteName.productMasterView,
    page: () {
      return const ProductMasterView();
    },
  ),
  GetPage(
    name: RouteName.vehicleMasterView,
    page: () {
      return const VehicleMasterView();
    },
  ),
  GetPage(
    name: RouteName.weightMasterView,
    page: () {
      return const WeightMasterView();
    },
  ),
  GetPage(
    name: RouteName.agentMasterView,
    page: () {
      return const AgentMasterView();
    },
  ),
  GetPage(
    name: RouteName.bankMasterView,
    page: () {
      return const BankMasterView();
    },
  ),
  GetPage(
    name: RouteName.hamalMasterView,
    page: () {
      return const HamalMasterView();
    },
  ),
  GetPage(
    name: RouteName.customerMasterView,
    page: () {
      return const CustomerMasterView();
    },
  ),
  GetPage(
    name: RouteName.groupMasterView,
    page: () {
      return const GroupMasterView();
    },
  ),
  GetPage(
    name: RouteName.narrationMasterView,
    page: () {
      return const NarrationMasterView();
    },
  ),
  GetPage(
    name: RouteName.acMasterListView,
    page: () {
      return const ACMasterListView();
    },
  ),
  GetPage(
    name: RouteName.rojmelMasterView,
    page: () {
      return const RojmelMasterView();
    },
  ),
  GetPage(
    name: RouteName.itemView,
    page: () {
      return const ItemView();
    },
  ),
];
