import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:vyaparmandali/app_manager/api/api_call.dart';
import 'package:vyaparmandali/app_manager/api/api_response.dart';
import 'package:vyaparmandali/app_manager/component/progress_dialogue.dart';
import 'package:vyaparmandali/app_manager/helper/alert.dart';
import 'package:vyaparmandali/app_manager/helper/navigator.dart';
import 'package:vyaparmandali/app_manager/service/navigation_service.dart';
import 'package:vyaparmandali/authentication/user_repository.dart';

class VehicalViewModel extends ChangeNotifier {

  static VehicalViewModel of(BuildContext context)=>Provider.of<VehicalViewModel>(context,listen: false);

  final ApiCall _api=ApiCall();

  TextEditingController VehicalNameC = TextEditingController();



  void initiateAddVehical(){
    _clearFields();
  }



  void _clearFields() {
    VehicalNameC.clear();
  }


  void initiateUpdateVehical(Vehical thisVehical){
    _clearFields();
    VehicalNameC.text=thisVehical.VehicalName??"";
  }



  ApiResponse<VehicalData> _VehicalDataResponse=ApiResponse<VehicalData>.initial("Initial");
  ApiResponse<VehicalData> get VehicalDataResponse=>_VehicalDataResponse;
  set VehicalDataResponse(ApiResponse<VehicalData> val){
    _VehicalDataResponse=val;
    notifyListeners();
  }


  Future<void> fetchVehicals() async {
    if((VehicalDataResponse.data?.getAllData??[]).isEmpty){
      VehicalDataResponse=ApiResponse<VehicalData>.loading('Fetching Vehicals');
    }

    try{
      var data=await _api.call(
          url: "get-Vehical-type-master-data",
          apiCallType: ApiCallType.post(body: {
            "id": UserRepository.of(NavigationService.context!).getUser.id.toString()
          }),
          token: true
      );

      if(data['code']==200 && data['status']==true){
        VehicalDataResponse=ApiResponse<VehicalData>.completed(
            VehicalData.fromJson(data)
        );
      }
      else {
        VehicalDataResponse=ApiResponse<VehicalData>.empty("Data Not found");
      }
    }
    catch(e){
      VehicalDataResponse=ApiResponse<VehicalData>.error(e.toString());
    }

  }




  Future<void> addVehical({
    String? id
  }) async{
    ProgressDialogue.show(message: id==null? "Adding Vehical":"Updating Vehical");
    try {

      Map bod={
        "Vehical_name": VehicalNameC.text,
      };
      if(id!=null){
        bod['id']=id;
      }
      var data= await _api.call(
          url: id!=null? "update-Vehical-type-master-data":"add-Vehical-type-master-data",
          apiCallType: ApiCallType.post(body: bod),
          token: true
      );
      ProgressDialogue.hide();
      Alert.show(data['message']);
      if(data['code']==200 && data['status']==true){
        MyNavigator.pop();
        fetchVehicals();
      }
      else {
      }
    }
    catch (e){
      Alert.show(e.toString());
      ProgressDialogue.hide();
    }
  }



  Future<void> deleteVehical({
    required String id
  }) async{
    ProgressDialogue.show(message: "Deleting Vehical");
    try {
      var data=await _api.call(
          url: "delete-Vehical-type-master-data",
          apiCallType: ApiCallType.post(body: {
            "id": id.toString(),
          }),
          token: true
      );
      ProgressDialogue.hide();
      Alert.show(data['message']);
      if(data['code']==200 && data['status']==true){
        fetchVehicals();
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