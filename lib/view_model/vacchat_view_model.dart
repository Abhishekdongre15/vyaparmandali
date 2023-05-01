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
import 'package:vyaparmandali/model/vacchat.dart';

class VacchatViewModel extends ChangeNotifier {

  static VacchatViewModel of(BuildContext context)=>Provider.of<VacchatViewModel>(context,listen: false);

  final ApiCall _api=ApiCall();


  TextEditingController dateC = TextEditingController();
  TextEditingController vehicleNumberC = TextEditingController();
  TextEditingController totalPackageC = TextEditingController();
  TextEditingController vasuliDarC = TextEditingController();



  void selectedProductOnIndex(int index,{
    String? val
}) {
    details[index].item=val;
    notifyListeners();
  }



  List<VacchatDetails> details=[];

  void addDetails() {
    details.add(VacchatDetails());
    notifyListeners();
  }

  void clearDetailOnIndex(int index){
    details.removeAt(index);
    notifyListeners();
  }


  void initiateAddVacchat(){
    _clearFields();
    dateC.text=DateTime.now().toString();
    notifyListeners();
  }



  void _clearFields() {
    dateC.clear();
    vehicleNumberC.clear();
    totalPackageC.clear();
    vasuliDarC.clear();
    details.clear();
    notifyListeners();
  }


  void initiateUpdateVacchat(Vacchat thisVacchat){
    _clearFields();
    dateC.text= DateFormat("yyyy-MM-dd").parse(thisVacchat.date??"").toString();
    vehicleNumberC.text=thisVacchat.vehicalNo??"";
    totalPackageC.text=thisVacchat.totalPackage??"";
    vasuliDarC.text=thisVacchat.vasuliDar??"";
    for(int i=0; i<(thisVacchat.vacchatDetails??[]).length; i++){
      VacchatDetails thiDetail=(thisVacchat.vacchatDetails??[])[i];
      details.add(
          thiDetail
      );
    }
    notifyListeners();
  }



  ApiResponse<VacchatData> _vacchatDataResponse=ApiResponse<VacchatData>.initial("Initial");
  ApiResponse<VacchatData> get vacchatDataResponse=>_vacchatDataResponse;
  set vacchatDataResponse(ApiResponse<VacchatData> val){
    _vacchatDataResponse=val;
    notifyListeners();
  }


  Future<void> fetchVacchat() async {
    if((vacchatDataResponse.data?.getData??[]).isEmpty){
      vacchatDataResponse=ApiResponse<VacchatData>.loading('Fetching Vacchat');
    }

    try{
      var data=await _api.call(
          url: "get-vacchat-main-and-details-data",
          apiCallType: ApiCallType.post(body: {
            "id": UserRepository.of(NavigationService.context!).getUser.id.toString(),
            "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),

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
      Map body= {
          "date": DateFormat("dd/MM/yyyy").format(DateTime.parse(dateC.text)),
          "vehical_no": vehicleNumberC.text,
          "total_package": totalPackageC.text,
          "vasuli_dar": vasuliDarC.text,
          "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),
          "vacchat_details": details.map((e) => e.toJson()).toList()
        };
      if(id!=null){
        body['id']=id;
      }
      var data= await _api.call(
          url: id!=null? "update-vacchat-main-and-details-data":"add-vacchat-main-and-details-data",
          apiCallType: ApiCallType.rawPost(body: body),
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
          url: "delete-vacchat-main-and-details-data",
          apiCallType: ApiCallType.post(body: {
            "id": id.toString(),
            "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),
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





  Future<void> subDeleteVacchatDetails({
    required String id,
    int? index,
  }) async{
    ProgressDialogue.show(message: "Deleting Vacchat Detail");
    try {
      var data=await _api.call(
          url: "sub-delete-vacchat-main-and-details-data",
          apiCallType: ApiCallType.post(body: {
            "id": id.toString(),
            "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),
          }),
          token: true
      );
      ProgressDialogue.hide();
      Alert.show(data['message']);
      if(data['code']==200 && data['status']==true){
        if(index!=null){
          clearDetailOnIndex(index);
        }
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