import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vyaparmandali/app_manager/api/api_call.dart';
import 'package:vyaparmandali/app_manager/api/api_response.dart';
import 'package:vyaparmandali/app_manager/component/progress_dialogue.dart';
import 'package:vyaparmandali/app_manager/helper/alert.dart';
import 'package:vyaparmandali/app_manager/helper/navigator.dart';
import 'package:vyaparmandali/app_manager/service/navigation_service.dart';
import 'package:vyaparmandali/authentication/user_repository.dart';
import 'package:vyaparmandali/model/hamal.dart';

class HamalViewModel extends ChangeNotifier {

  static HamalViewModel of(BuildContext context)=>Provider.of<HamalViewModel>(context,listen: false);

  final ApiCall _api=ApiCall();

  TextEditingController hamalNameC = TextEditingController();
  TextEditingController dateOfJoiningC = TextEditingController();



  void initiateAddHamal(){
    _clearFields();
  }



  void _clearFields() {
    hamalNameC.clear();
    dateOfJoiningC.clear();
  }


  void initiateUpdateHamal(Hamal thisHamal){
    _clearFields();
    hamalNameC.text=thisHamal.hamalName??"";
    dateOfJoiningC.text= DateFormat("dd/MM/yyyy").parse(thisHamal.dateOfJoining??"").toString();
  }



  ApiResponse<HamalData> _hamalDataResponse=ApiResponse<HamalData>.initial("Initial");
  ApiResponse<HamalData> get hamalDataResponse=>_hamalDataResponse;
  set hamalDataResponse(ApiResponse<HamalData> val){
    _hamalDataResponse=val;
    notifyListeners();
  }


  Future<void> fetchHamal() async {
    if((hamalDataResponse.data?.getAllData??[]).isEmpty){
      hamalDataResponse=ApiResponse<HamalData>.loading('Fetching Hamal');
    }

    try{
      var data=await _api.call(
          url: "get_hamal_master_data",
          apiCallType: ApiCallType.post(body: {
            "id": UserRepository.of(NavigationService.context!).getUser.id.toString()
          }),
          token: true
      );

      if(data['code']==200 && data['status']==true){
        hamalDataResponse=ApiResponse<HamalData>.completed(
            HamalData.fromJson(data)
        );
      }
      else {
        hamalDataResponse=ApiResponse<HamalData>.empty("Data Not found");
      }
    }
    catch(e){
      hamalDataResponse=ApiResponse<HamalData>.error(e.toString());
    }

  }




  Future<void> addHamal({
    String? id
  }) async{
    ProgressDialogue.show(message: id==null? "Adding Haml":"Updating Hamal");
    try {
      var data=
      id!=null?
      await _api.call(
          url: "update_hamal_master_data",
          apiCallType: ApiCallType.post(body: {
            "hamal_name": hamalNameC.text,
            "date_of_joining": DateFormat("dd/MM/yyyy").format(DateTime.parse(dateOfJoiningC.text)),
            "id": id
          }),
          token: true
      )
          :await _api.call(
          url: "add_hamal_master_data",
          apiCallType: ApiCallType.post(body: {
            "hamal_name": hamalNameC.text,
            "date_of_joining": DateFormat("dd/MM/yyyy").format(DateTime.parse(dateOfJoiningC.text)),
          }),
          token: true
      );
      ProgressDialogue.hide();
      Alert.show(data['message']);
      if(data['code']==200 && data['status']==true){
        MyNavigator.pop();
        fetchHamal();
      }
      else {
      }
    }
    catch (e){
      Alert.show(e.toString());
      ProgressDialogue.hide();
    }
  }



  Future<void> deleteHamal({
    required String id
  }) async{
    ProgressDialogue.show(message: "Deleting Hamal");
    try {
      var data=await _api.call(
          url: "delete_hamal_master_data",
          apiCallType: ApiCallType.post(body: {
            "id": id.toString(),
          }),
          token: true
      );
      ProgressDialogue.hide();
      Alert.show(data['message']);
      if(data['code']==200 && data['status']==true){
        fetchHamal();
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