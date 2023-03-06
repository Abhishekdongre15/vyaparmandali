import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:vyaparmandali/app_manager/api/api_call.dart';
import 'package:vyaparmandali/app_manager/api/api_response.dart';
import 'package:vyaparmandali/app_manager/component/progress_dialogue.dart';
import 'package:vyaparmandali/app_manager/helper/alert.dart';
import 'package:vyaparmandali/app_manager/helper/navigator.dart';
import 'package:vyaparmandali/app_manager/service/navigation_service.dart';
import 'package:vyaparmandali/authentication/user_repository.dart';
import 'package:vyaparmandali/model/group.dart';

class GroupViewModel extends ChangeNotifier {

  static GroupViewModel of(BuildContext context)=>Provider.of<GroupViewModel>(context,listen: false);

  final ApiCall _api=ApiCall();

  TextEditingController codeC = TextEditingController();
  TextEditingController nameC = TextEditingController();



  void initiateAddGroup(){
    _clearFields();
  }



  void _clearFields() {
    codeC.clear();
    nameC.clear();
  }


  void initiateUpdateGroup(Group thisGroup){
    _clearFields();
    codeC.text=thisGroup.code??"";
    nameC.text=thisGroup.name??"";
  }



  ApiResponse<GroupData> _groupDataResponse=ApiResponse<GroupData>.initial("Initial");
  ApiResponse<GroupData> get groupDataResponse=>_groupDataResponse;
  set groupDataResponse(ApiResponse<GroupData> val){
    _groupDataResponse=val;
    notifyListeners();
  }


  Future<void> fetchGroups() async {
    if((groupDataResponse.data?.getAllData??[]).isEmpty){
      groupDataResponse=ApiResponse<GroupData>.loading('Fetching Group');
    }

    try{
      var data=await _api.call(
          url: "get_group_master_data",
          apiCallType: ApiCallType.post(body: {
            "id": UserRepository.of(NavigationService.context!).getUser.id.toString()
          }),
          token: true
      );

      if(data['code']==200 && data['status']==true){
          groupDataResponse=ApiResponse<GroupData>.completed(
              GroupData.fromJson(data)
          );
      }
      else {
        groupDataResponse=ApiResponse<GroupData>.empty("Data Not found");
      }
    }
    catch(e){
      groupDataResponse=ApiResponse<GroupData>.error(e.toString());
    }

  }




  Future<void> addGroup({
  String? id
}) async{
    PD.show(message: id==null? "Adding Group":"Updating Group");
    try {
      var data=
      id!=null?
      await _api.call(
          url: "update_group_master_data",
          apiCallType: ApiCallType.post(body: {
            "code": codeC.text,
            "name": nameC.text,
            "id": id
          }),
          token: true
      )
      :await _api.call(
          url: "add_group_master_data",
          apiCallType: ApiCallType.post(body: {
            "code": codeC.text,
            "name": nameC.text,
          }),
          token: true
      );
      PD.hide();
      Alert.show(data['message']);
      if(data['code']==200 && data['status']==true){
        MyNavigator.pop();
        fetchGroups();
      }
      else {
      }
    }
    catch (e){
      Alert.show(e.toString());
      PD.hide();
    }
  }



  Future<void> deleteGroup({
  required String id
}) async{
    PD.show(message: "Deleting Group");
    try {
      var data=await _api.call(
          url: "delete_group_master_data",
          apiCallType: ApiCallType.post(body: {
            "id": id.toString(),
          }),
          token: true
      );
      PD.hide();
      Alert.show(data['message']);
      if(data['code']==200 && data['status']==true){
        fetchGroups();
      }
      else {
      }
    }
    catch (e){
      Alert.show(e.toString());
      PD.hide();
    }
  }




}