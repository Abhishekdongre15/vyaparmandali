import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vyaparmandali/app_manager/api/api_call.dart';
import 'package:vyaparmandali/app_manager/component/progress_dialogue.dart';
import 'package:vyaparmandali/app_manager/helper/alert.dart';
import 'package:vyaparmandali/route_name.dart';
import 'package:vyaparmandali/authentication/user_repository.dart';
import 'package:vyaparmandali/model/user.dart';

class LoginViewModel extends ChangeNotifier {

  static LoginViewModel of(BuildContext context)=>Provider.of<LoginViewModel>(context,listen: false);

  final ApiCall _api=ApiCall();

  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();



  Future<void> login(
      BuildContext context,
      {
  required String email,
  required String password,
    bool updating=false,
}) async{

    try  {
      if(updating==false){
        ProgressDialogue.show(message: "Processing Data");
      }

      var data= await _api.call(
          url: "user-login",
          apiCallType: ApiCallType.post(
              body: {
                "email": email,
                "password": password,
              }
          ),
      token: true,
      newToken: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6NTk4MTB9.ZmJjYjc3OTE4OTIxYjdjY2JjYzQzOTYyZmU5NDk0ZjllMTgyNDExZWE2Y2YyYTE4MTk3Y2QyYzVjZDVmYjRjOQ");

      if(updating==false){
        ProgressDialogue.hide();
      }
      if(data['code']==200 && data['status']==true){
        emailC.clear();
        passwordC.clear();

        // ignore: use_build_context_synchronously
        UserRepository.of(context).updateUserData(User.fromJson(data['data'][0])).then((value) {
          if(updating==false){
            context.pushReplacement(RoutePath.dashboard);
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