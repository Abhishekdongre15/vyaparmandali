import 'package:flutter/material.dart';
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
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/new/registered_user/registered_user_master_view.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/new/rojmel/rojmel_master_view.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/new/vacchat/vacchat_master_view.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/new/vehicle/vehicle_master_view.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/new/weight/weight_master_view.dart';
import 'package:vyaparmandali/view/screen/login_screen_view.dart';
import 'package:vyaparmandali/view/screen/profile/profile_page_view.dart';
import 'package:vyaparmandali/view/screen/registration_screen_view.dart';
import 'package:vyaparmandali/view/screen/splash_screen_view.dart';

class RouteName {

  static String initial="/";
  static String login="/login";
  static String dashboard="/dashboard";
  static String addHamaliExpView="/addHamaliExpView";
  static String addItemExp="/addItemExp";
  static String addPlaceMaster="/addPlaceMaster";
  static String registrationScreenView="/registrationScreenView";
  static String forgetPasswordView="/forgetPasswordView";
  static String profilePageView="/profilePageView";
  static String cashBookItemMasterView="/cashBookItemMasterView";
  static String vacchatMasterView="/vacchatMasterView";
  static String dhadaBookMasterView="/dhadaBookMasterView";
  static String farmerMasterView="/farmerMasterView";
  static String productMasterView="/productMasterView";
  static String vehicleMasterView="/vehicleMasterView";
  static String weightMasterView="/weightMasterView";
  static String agentMasterView="/agentMasterView";
  static String bankMasterView="/bankMasterView";
  static String hamalMasterView="/hamalMasterView";
  static String customerMasterView="/customerMasterView";
  static String groupMasterView="/groupMasterView";
  static String narrationMasterView="/narrationMasterView";
  static String acMasterListView="/acMasterListView";
  static String rojmelMasterView="/rojmelMasterView";
  static String itemView="/itemView";
  static String registeredUserMasterView="/registeredUserMasterView";

}



Map<String, WidgetBuilder> routesValue = {
  RouteName.initial: (context)=> const SplashScreenView(),
  RouteName.login: (context)=> const LoginScreenView(),
  RouteName.dashboard: (context)=> const DashboardView(),
  RouteName.addHamaliExpView: (context)=> const AddHamaliExpView(),
  RouteName.addItemExp: (context)=> const AddItemExp(),
  RouteName.addPlaceMaster: (context)=> const AddPlaceMaster(),
  RouteName.registrationScreenView: (context)=> const RegistrationScreenView(),
  RouteName.forgetPasswordView: (context)=> const ForgetPasswordView(),
  RouteName.profilePageView: (context)=> const ProfilePageView(),
  RouteName.cashBookItemMasterView: (context)=> const CashBookItemMasterView(),
  RouteName.vacchatMasterView: (context)=> const VacchatMasterView(),
  RouteName.dhadaBookMasterView: (context)=> const DhadaBookMasterView(),
  RouteName.farmerMasterView: (context)=> const FarmerMasterView(),
  RouteName.productMasterView: (context)=> const ProductMasterView(),
  RouteName.vehicleMasterView: (context)=> const VehicleMasterView(),
  RouteName.weightMasterView: (context)=> const WeightMasterView(),
  RouteName.agentMasterView: (context)=> const AgentMasterView(),
  RouteName.bankMasterView: (context)=> const BankMasterView(),
  RouteName.hamalMasterView: (context)=> const HamalMasterView(),
  RouteName.customerMasterView: (context)=> const CustomerMasterView(),
  RouteName.groupMasterView: (context)=> const GroupMasterView(),
  RouteName.narrationMasterView: (context)=> const NarrationMasterView(),
  RouteName.acMasterListView: (context)=> const ACMasterListView(),
  RouteName.rojmelMasterView: (context)=> const RojmelMasterView(),
  RouteName.itemView: (context)=> const ItemView(),
  RouteName.registeredUserMasterView: (context)=> const RegisteredUserMasterView(),
};



