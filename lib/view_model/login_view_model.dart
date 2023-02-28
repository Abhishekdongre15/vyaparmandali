import 'package:flutter/cupertino.dart';
import 'package:vyaparmandali/app_manager/api/api_call.dart';
import 'package:vyaparmandali/app_manager/component/progress_dialogue.dart';
import 'package:vyaparmandali/app_manager/helper/alert.dart';
import 'package:vyaparmandali/app_manager/helper/navigator.dart';
import 'package:vyaparmandali/app_manager/service/navigation_service.dart';
import 'package:vyaparmandali/authentication/user_repository.dart';
import 'package:vyaparmandali/model/user.dart';
import 'package:vyaparmandali/views/screen/dashboard_view.dart';

class LoginViewModel {


  final ApiCall _api=ApiCall();

  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();



  Future<void> login({
  required String email,
  required String password,
}) async{

    try  {
      PD.show(message: "Processing Data");
      var data= await _api.call(
          url: "user_login",
          apiCallType: ApiCallType.post(
              body: {
                "email": email,
                "password": password,
              }
          ));
      PD.hide();
      if(data['code']==200 && data['status']==true){
        emailC.clear();
        passwordC.clear();
        UserRepository.of(NavigationService.context!).updateUserData(User.fromJson(data['data'][0])).then((value) =>
            MyNavigator.pushReplacement( const DashboardView())
        );
      }
      else {
        Alert.show(data['message']);
      }
    }
    catch (e) {
      PD.hide();
      Alert.show(e.toString());
    }
  }


}