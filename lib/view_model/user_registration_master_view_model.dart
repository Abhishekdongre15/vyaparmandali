import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:vyaparmandali/app_manager/api/api_call.dart';
import 'package:vyaparmandali/app_manager/api/api_response.dart';
import 'package:vyaparmandali/app_manager/component/progress_dialogue.dart';
import 'package:vyaparmandali/app_manager/helper/alert.dart';
import 'package:vyaparmandali/app_manager/service/navigation_service.dart';
import 'package:vyaparmandali/authentication/user_repository.dart';
import 'package:vyaparmandali/model/registered_user.dart';

class UserRegistrationMasterViewModel extends ChangeNotifier {

  static UserRegistrationMasterViewModel of(BuildContext context)=>Provider.of<UserRegistrationMasterViewModel>(context,listen: false);

  final ApiCall _api=ApiCall();






  ApiResponse<RegisteredUserData> _registeredUserDataResponse=ApiResponse<RegisteredUserData>.initial("Initial");
  ApiResponse<RegisteredUserData> get registeredUserDataResponse=>_registeredUserDataResponse;
  set registeredUserDataResponse(ApiResponse<RegisteredUserData> val){
    _registeredUserDataResponse=val;
    notifyListeners();
  }


  Future<void> fetchRegisteredUsers() async {
    if((registeredUserDataResponse.data?.getAllData??[]).isEmpty){
      registeredUserDataResponse=ApiResponse<RegisteredUserData>.loading('Fetching Registered Users');
    }

    try{
      String userId=UserRepository.of(NavigationService.context!).getUser.id.toString();
      var data=await _api.call(
          url: "get-user-register-data",
          apiCallType: ApiCallType.post(body: {
            "id": userId
          }),
          token: true
      );

      if(data['code']==200 && data['status']==true){
        registeredUserDataResponse=ApiResponse<RegisteredUserData>.completed(
            RegisteredUserData.fromJson(data)
        );
      }
      else {
        registeredUserDataResponse=ApiResponse<RegisteredUserData>.empty("Data Not found");
      }
    }
    catch(e){
      registeredUserDataResponse=ApiResponse<RegisteredUserData>.error(e.toString());
    }

  }




  Future<void> deleteRegisteredUser({
    required String id
  }) async{
    ProgressDialogue.show(message: "Deleting User");
    try {
      var data=await _api.call(
          url: "get-enable-user-register-data",
          apiCallType: ApiCallType.post(body: {
            "id": id.toString(),
            "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),
          }),
          token: true
      );
      ProgressDialogue.hide();
      Alert.show(data['message']);
      if(data['code']==200 && data['status']==true){
        fetchRegisteredUsers();
      }
      else {
      }
    }
    catch (e){
      Alert.show(e.toString());
      ProgressDialogue.hide();
    }
  }



  Future<void> changeUserStatus({
    required String id,
    required bool status,
  }) async{
    ProgressDialogue.show(message: "Changing Status");
    try {
      var data=await _api.call(
          url: "get-enable-user-register-data",
          apiCallType: ApiCallType.post(body: {
            "id": id.toString(),
            "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),
            "user_status": status?"1":"0",
          }),
          token: true
      );
      ProgressDialogue.hide();
      Alert.show(data['message']);
      if(data['code']==200 && data['status']==true){
        fetchRegisteredUsers();
      }
      else {
      }
    }
    catch (e){
      Alert.show(e.toString());
      ProgressDialogue.hide();
    }
  }






}