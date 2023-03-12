import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:vyaparmandali/app_manager/api/api_call.dart';
import 'package:vyaparmandali/app_manager/component/progress_dialogue.dart';
import 'package:vyaparmandali/app_manager/helper/alert.dart';
import 'package:vyaparmandali/app_manager/helper/navigator.dart';
import 'package:vyaparmandali/app_manager/service/navigation_service.dart';
import 'package:vyaparmandali/authentication/user_repository.dart';
import 'package:vyaparmandali/model/user.dart';
import 'package:vyaparmandali/view/screen/dashboard_view.dart';

class LoginViewModel extends ChangeNotifier {

  static LoginViewModel of(BuildContext context)=>Provider.of<LoginViewModel>(context,listen: false);

  final ApiCall _api=ApiCall();

  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();



  Future<void> login({
  required String email,
  required String password,
    bool updating=false,
}) async{

    try  {
      if(updating==false){
        ProgressDialogue.show(message: "Processing Data");
      }

      var data= await _api.call(
          url: "user_login",
          apiCallType: ApiCallType.post(
              body: {
                "email": email,
                "password": password,
              }
          ));

      if(updating==false){
        ProgressDialogue.hide();
      }
      if(data['code']==200 && data['status']==true){
        emailC.clear();
        passwordC.clear();

        UserRepository.of(NavigationService.context!).updateUserData(User.fromJson(data['data'][0])).then((value) {
          if(updating==false){
            MyNavigator.pushReplacement( const DashboardView());
          }
        }
        );
      }
      else {
        Alert.show(data['message']);
      }
    }
    catch (e) {
      if(updating==false){
        ProgressDialogue.hide();
      }
      Alert.show(e.toString());
    }
  }


}