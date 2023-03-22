import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:vyaparmandali/app_manager/api/api_call.dart';
import 'package:vyaparmandali/app_manager/api/api_response.dart';
import 'package:vyaparmandali/app_manager/component/progress_dialogue.dart';
import 'package:vyaparmandali/app_manager/helper/alert.dart';
import 'package:vyaparmandali/app_manager/helper/navigator.dart';
import 'package:vyaparmandali/app_manager/service/navigation_service.dart';
import 'package:vyaparmandali/authentication/user_repository.dart';
import 'package:vyaparmandali/model/farmer.dart';

class FarmerViewModel extends ChangeNotifier {

  static FarmerViewModel of(BuildContext context)=>Provider.of<FarmerViewModel>(context,listen: false);

  final ApiCall _api=ApiCall();

  TextEditingController farmerNameC = TextEditingController();
  TextEditingController addressC = TextEditingController();
  TextEditingController cityC = TextEditingController();
  TextEditingController phoneC = TextEditingController();



  void initiateAddFarmer(){
    _clearFields();
  }



  void _clearFields() {
    farmerNameC.clear();
    cityC.clear();
    addressC.clear();
    phoneC.clear();
  }


  void initiateUpdateFarmer(Farmer thisFarmer){
    _clearFields();
    farmerNameC.text=thisFarmer.farmerName??"";
    addressC.text=thisFarmer.address??"";
    cityC.text=thisFarmer.city??"";
    phoneC.text=thisFarmer.phoneNumber??"";
  }



  ApiResponse<FarmerData> _farmerDataResponse=ApiResponse<FarmerData>.initial("Initial");
  ApiResponse<FarmerData> get farmerDataResponse=>_farmerDataResponse;
  set farmerDataResponse(ApiResponse<FarmerData> val){
    _farmerDataResponse=val;
    notifyListeners();
  }


  Future<void> fetchFarmers() async {
    if((farmerDataResponse.data?.getAllData??[]).isEmpty){
      farmerDataResponse=ApiResponse<FarmerData>.loading('Fetching Farmers');
    }

    try{
      var data=await _api.call(
          url: "get-farmer-master-data",
          apiCallType: ApiCallType.post(body: {
            "id": UserRepository.of(NavigationService.context!).getUser.id.toString()
          }),
          token: true
      );

      if(data['code']==200 && data['status']==true){
        farmerDataResponse=ApiResponse<FarmerData>.completed(
            FarmerData.fromJson(data)
        );
      }
      else {
        farmerDataResponse=ApiResponse<FarmerData>.empty("Data Not found");
      }
    }
    catch(e){
      farmerDataResponse=ApiResponse<FarmerData>.error(e.toString());
    }

  }




  Future<void> addFarmer({
    String? id
  }) async{
    ProgressDialogue.show(message: id==null? "Adding Farmer":"Updating Farmer");
    try {

      Map bod={
        "farmer_name": farmerNameC.text,
        "address": addressC.text,
        "city": cityC.text,
        "phone_number": phoneC.text,
      };
      if(id!=null){
        bod['id']=id;
      }
      var data= await _api.call(
          url: id!=null? "update-farmer-master-data":"add-farmer-master-data",
          apiCallType: ApiCallType.post(body: bod),
          token: true
      );
      ProgressDialogue.hide();
      Alert.show(data['message']);
      if(data['code']==200 && data['status']==true){
        MyNavigator.pop();
        fetchFarmers();
      }
      else {
      }
    }
    catch (e){
      Alert.show(e.toString());
      ProgressDialogue.hide();
    }
  }



  Future<void> deleteFarmer({
    required String id
  }) async{
    ProgressDialogue.show(message: "Deleting Farmer");
    try {
      var data=await _api.call(
          url: "delete-farmer-master-data",
          apiCallType: ApiCallType.post(body: {
            "id": id.toString(),
          }),
          token: true
      );
      ProgressDialogue.hide();
      Alert.show(data['message']);
      if(data['code']==200 && data['status']==true){
        fetchFarmers();
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