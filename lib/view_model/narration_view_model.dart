import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:vyaparmandali/app_manager/api/api_call.dart';
import 'package:vyaparmandali/app_manager/api/api_response.dart';
import 'package:vyaparmandali/app_manager/component/progress_dialogue.dart';
import 'package:vyaparmandali/app_manager/helper/alert.dart';
import 'package:vyaparmandali/app_manager/helper/navigator.dart';
import 'package:vyaparmandali/app_manager/service/navigation_service.dart';
import 'package:vyaparmandali/authentication/user_repository.dart';
import 'package:vyaparmandali/model/narration.dart';

class NarrationViewModel extends ChangeNotifier {

  static NarrationViewModel of(BuildContext context)=>Provider.of<NarrationViewModel>(context,listen: false);

  final ApiCall _api=ApiCall();

  TextEditingController codeC = TextEditingController();
  TextEditingController descriptionC = TextEditingController();



  void initiateAddNarration(){
    _clearFields();
  }



  void _clearFields() {
    codeC.clear();
    descriptionC.clear();
  }


  void initiateUpdateNarration(Narration thisNarration){
    _clearFields();
    codeC.text=thisNarration.code??"";
    descriptionC.text=thisNarration.description??"";
  }



  ApiResponse<NarrationData> _narrationDataResponse=ApiResponse<NarrationData>.initial("Initial");
  ApiResponse<NarrationData> get narrationDataResponse=>_narrationDataResponse;
  set narrationDataResponse(ApiResponse<NarrationData> val){
    _narrationDataResponse=val;
    notifyListeners();
  }


  Future<void> fetchNarrations() async {
    if((narrationDataResponse.data?.getAllData??[]).isEmpty){
      narrationDataResponse=ApiResponse<NarrationData>.loading('Fetching Narrations');
    }

    try{
      var data=await _api.call(
          url: "get-narration-data",
          apiCallType: ApiCallType.post(body: {
            "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),

            "id": UserRepository.of(NavigationService.context!).getUser.id.toString()
          }),
          token: true
      );

      if(data['code']==200 && data['status']==true){
        narrationDataResponse=ApiResponse<NarrationData>.completed(
            NarrationData.fromJson(data)
        );
      }
      else {
        narrationDataResponse=ApiResponse<NarrationData>.empty("Data Not found");
      }
    }
    catch(e){
      narrationDataResponse=ApiResponse<NarrationData>.error(e.toString());
    }

  }




  Future<void> addNarration({
    String? id
  }) async{
    ProgressDialogue.show(message: id==null? "Adding Narration":"Updating Narration");
    try {
      var data=
      id!=null?
      await _api.call(
          url: "update-narration-data",
          apiCallType: ApiCallType.post(body: {
            "code": codeC.text,
            "description": descriptionC.text,
            "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),

            "id": id
          }),
          token: true
      )
          :await _api.call(
          url: "add-narration-data",
          apiCallType: ApiCallType.post(body: {
            "code": codeC.text,
            'id' : id,
            "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),

            "description": descriptionC.text,
          }),
          token: true
      );
      ProgressDialogue.hide();
      Alert.show(data['message']);
      if(data['code']==200 && data['status']==true){
        MyNavigator.pop();
        fetchNarrations();
      }
      else {
      }
    }
    catch (e){
      Alert.show(e.toString());
      ProgressDialogue.hide();
    }
  }



  Future<void> deleteNarration({
    required String id
  }) async{
    ProgressDialogue.show(message: "Deleting Narration");
    try {
      var data=await _api.call(
          url: "delete-narration-data",
          apiCallType: ApiCallType.post(body: {
            "id": id.toString(),
            "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),

          }),
          token: true
      );
      ProgressDialogue.hide();
      Alert.show(data['message']);
      if(data['code']==200 && data['status']==true){
        fetchNarrations();
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