import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/custom_bottom_sheet.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/functional_sheet.dart';
import 'package:vyaparmandali/app_manager/constant/storage_constant.dart';
import 'package:vyaparmandali/app_manager/helper/navigation/navigator.dart';
import 'package:vyaparmandali/app_manager/helper/navigation/route_name.dart';
import 'package:vyaparmandali/model/user.dart';

class UserRepository extends ChangeNotifier {
  User? currentUser;

  UserRepository({
    this.currentUser,
  });

  User get getUser => currentUser ?? User();

  static UserRepository of(BuildContext context) =>
      Provider.of<UserRepository>(context, listen: false);

  Future updateUserData(User userData) async {
    String user = jsonEncode(userData.toJson());
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(StorageConstant.userStorage, user);
    currentUser = await fetchUserData();
    notifyListeners();
  }

  static Future<User> fetchUserData() async {
    final prefs = await SharedPreferences.getInstance();
    return User.fromJson(
        jsonDecode(prefs.getString(StorageConstant.userStorage) ?? "{}"));
  }

  Future logOutUser(BuildContext context) async {
    CustomBottomSheet.open(
        child: FunctionalSheet(
            message: "Do you want to logout?",
            buttonName: "Logout",
            onPressButton: () async {
              directLogOut();
            }));
  }



  Future directLogOut() async {
    await updateUserData(User()).then((value) {
      MyNavigator.pushNamedAndRemoveUntil( RouteName.login);
    });
    notifyListeners();
  }
}
