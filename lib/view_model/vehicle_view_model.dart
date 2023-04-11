import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vyaparmandali/app_manager/api/api_call.dart';
import 'package:vyaparmandali/app_manager/api/api_response.dart';
import 'package:vyaparmandali/app_manager/component/progress_dialogue.dart';
import 'package:vyaparmandali/app_manager/helper/alert.dart';
import 'package:vyaparmandali/app_manager/helper/navigation/navigator.dart';
import 'package:vyaparmandali/app_manager/service/navigation_service.dart';
import 'package:vyaparmandali/authentication/user_repository.dart';
import 'package:vyaparmandali/model/vehicle.dart';

class VehicleViewModel extends ChangeNotifier {

  static VehicleViewModel of(BuildContext context)=>Provider.of<VehicleViewModel>(context,listen: false);

  final ApiCall _api=ApiCall();

  TextEditingController ownerNameC = TextEditingController();
  TextEditingController vehicleNameC = TextEditingController();
  TextEditingController vehicleNumberC = TextEditingController();



  void initiateAddVehicle(){
    _clearFields();
  }



  void _clearFields() {
    ownerNameC.clear();
    vehicleNameC.clear();
    vehicleNumberC.clear();
  }


  void initiateUpdateVehicle(Vehicle thisVehicle){
    _clearFields();
    ownerNameC.text=thisVehicle.ownerName??"";
    vehicleNameC.text=thisVehicle.vehicalName??"";
    vehicleNumberC.text=thisVehicle.vehicalNumber??"";
  }



  ApiResponse<VehicleData> _vehicleDataResponse=ApiResponse<VehicleData>.initial("Initial");
  ApiResponse<VehicleData> get vehicleDataResponse=>_vehicleDataResponse;
  set vehicleDataResponse(ApiResponse<VehicleData> val){
    _vehicleDataResponse=val;
    notifyListeners();
  }


  Future<void> fetchVehicles() async {
    if((vehicleDataResponse.data?.getData??[]).isEmpty){
      vehicleDataResponse=ApiResponse<VehicleData>.loading('Fetching Vehicles');
    }

    try{
      var data=await _api.call(
          url: "get-vehical-master-data",
          apiCallType: ApiCallType.post(body: {
            "id": UserRepository.of(NavigationService.context!).getUser.id.toString(),
            "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),

          }),
          token: true
      );

      if(data['code']==200 && data['status']==true){
        vehicleDataResponse=ApiResponse<VehicleData>.completed(
            VehicleData.fromJson(data)
        );
      }
      else {
        vehicleDataResponse=ApiResponse<VehicleData>.empty("Data Not found");
      }
    }
    catch(e){
      vehicleDataResponse=ApiResponse<VehicleData>.error(e.toString());
    }

  }





  Future<void> addVehicle({
    String? id
  }) async{
    ProgressDialogue.show(message: id==null? "Adding Vehicle":"Updating Vehicle");
    try {

      Map bod={
        "owner_name": ownerNameC.text,
        "vehical_name": vehicleNameC.text,
        "vehical_number": vehicleNumberC.text,
        "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),

      };
      if(id!=null){
        bod['id']=id;
     }
      var data= await _api.call(
          url: id!=null? "update-vehical-master-data":"add-vehical-master-data",
          apiCallType: ApiCallType.post(body: bod),
          token: true
      );
      ProgressDialogue.hide();
      Alert.show(data['message']);
      if(data['code']==200 && data['status']==true){
        MyNavigator.pop();
        fetchVehicles();
      }
      else {
      }
    }
    catch (e){
      Alert.show(e.toString());
      ProgressDialogue.hide();
    }
  }



  Future<void> deleteVehicle({
    required String id
  }) async{
    ProgressDialogue.show(message: "Deleting Vehicle");
    try {
      var data=await _api.call(
          url: "delete-vehical-master-data",
          apiCallType: ApiCallType.post(body: {
            "id": id.toString(),
            "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),

          }),
          token: true
      );
      ProgressDialogue.hide();
      Alert.show(data['message']);
      if(data['code']==200 && data['status']==true){
        fetchVehicles();
      }
      else {
      }
    }
    catch (e){
      Alert.show(e.toString());
      ProgressDialogue.hide();
    }
  }



  Future<dynamic> fetchVehicleNumberForFarmer({
  required String id
}) async {
      try {
        var data=await _api.call(
            url: "fetch-vehical-no-data-by-farmer-id-vacchat-main",
            apiCallType: ApiCallType.post(body: {
              "farmer_id": id,
            }),
            token: true
        );
        return data;
      }
      catch (e){
        rethrow;
      }
  }



  Future<dynamic> fetchInwardDateUsingVehicleNumber({
    required String vehicleNumber
  }) async {
    try {
      var data=await _api.call(
          url: "fetch-inward-date-data-by-vehical-no-vacchat-main",
          apiCallType: ApiCallType.post(body: {
            "vehical_no": vehicleNumber,
          }),
          token: true
      );
      return data;
    }
    catch (e){
      rethrow;
    }
  }



}