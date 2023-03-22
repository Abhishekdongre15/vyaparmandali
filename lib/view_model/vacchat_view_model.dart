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
import 'package:vyaparmandali/model/vacchat.dart';

class VacchatViewModel extends ChangeNotifier {

  static VacchatViewModel of(BuildContext context)=>Provider.of<VacchatViewModel>(context,listen: false);

  final ApiCall _api=ApiCall();


  TextEditingController dateC = TextEditingController();
  TextEditingController vehicleNumberC = TextEditingController();
  TextEditingController totalPackageC = TextEditingController();
  TextEditingController vasuliDarC = TextEditingController();



  void initiateAddVacchat(){
    _clearFields();
  }



  void _clearFields() {
    dateC.clear();
    vehicleNumberC.clear();
    totalPackageC.clear();
    vasuliDarC.clear();
  }


  void initiateUpdateVacchat(Vacchat thisVacchat){
    _clearFields();
    dateC.text= DateFormat("dd/MM/yyyy").parse(thisVacchat.date??"").toString();
    vehicleNumberC.text=thisVacchat.vehicalNo??"";
    totalPackageC.text=thisVacchat.totalPackage??"";
    vasuliDarC.text=thisVacchat.vasuliDar??"";
  }



  ApiResponse<VacchatData> _vacchatDataResponse=ApiResponse<VacchatData>.initial("Initial");
  ApiResponse<VacchatData> get vacchatDataResponse=>_vacchatDataResponse;
  set vacchatDataResponse(ApiResponse<VacchatData> val){
    _vacchatDataResponse=val;
    notifyListeners();
  }


  Future<void> fetchVacchat() async {
    if((vacchatDataResponse.data?.getAllData??[]).isEmpty){
      vacchatDataResponse=ApiResponse<VacchatData>.loading('Fetching Vacchat');
    }

    try{
      var data=await _api.call(
          url: "get-vacchat-main-data",
          apiCallType: ApiCallType.post(body: {
            "id": UserRepository.of(NavigationService.context!).getUser.id.toString()
          }),
          token: true
      );

      if(data['code']==200 && data['status']==true){
        vacchatDataResponse=ApiResponse<VacchatData>.completed(
            VacchatData.fromJson(data)
        );
      }
      else {
        vacchatDataResponse=ApiResponse<VacchatData>.empty("Data Not found");
      }
    }
    catch(e){
      vacchatDataResponse=ApiResponse<VacchatData>.error(e.toString());
    }

  }




  Future<void> addVacchat({
    String? id
  }) async{
    ProgressDialogue.show(message: id==null? "Adding Vacchat":"Updating Vacchat");
    try {
      Map bod={
        "date": DateFormat("dd/MM/yyyy").format(DateTime.parse(dateC.text)),
        "vehical_no": vehicleNumberC.text,
        "total_package": totalPackageC.text,
        "vasuli_dar": vasuliDarC.text,
      };
      if(id!=null){
        bod['id']=id;
      }
      var data= await _api.call(
          url: id!=null? "update-vacchat-main-data":"add-vacchat-main-data",
          apiCallType: ApiCallType.post(body: bod),
          token: true
      );
      ProgressDialogue.hide();
      Alert.show(data['message']);
      if(data['code']==200 && data['status']==true){
        MyNavigator.pop();
        fetchVacchat();
      }
      else {
      }
    }
    catch (e){
      Alert.show(e.toString());
      ProgressDialogue.hide();
    }
  }



  Future<void> deleteVacchat({
    required String id
  }) async{
    ProgressDialogue.show(message: "Deleting Vacchat");
    try {
      var data=await _api.call(
          url: "delete-vacchat-main-data",
          apiCallType: ApiCallType.post(body: {
            "id": id.toString(),
          }),
          token: true
      );
      ProgressDialogue.hide();
      Alert.show(data['message']);
      if(data['code']==200 && data['status']==true){
        fetchVacchat();
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