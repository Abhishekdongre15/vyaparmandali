import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:vyaparmandali/app_manager/api/api_call.dart';
import 'package:vyaparmandali/app_manager/api/api_response.dart';
import 'package:vyaparmandali/app_manager/component/progress_dialogue.dart';
import 'package:vyaparmandali/app_manager/helper/alert.dart';
import 'package:vyaparmandali/app_manager/helper/navigator.dart';
import 'package:vyaparmandali/app_manager/service/navigation_service.dart';
import 'package:vyaparmandali/authentication/user_repository.dart';
import 'package:vyaparmandali/model/bank.dart';

class BankViewModel extends ChangeNotifier {

  static BankViewModel of(BuildContext context)=>Provider.of<BankViewModel>(context,listen: false);

  final ApiCall _api=ApiCall();

  TextEditingController bankNameC = TextEditingController();
  TextEditingController branchCode = TextEditingController();
  TextEditingController ifscC = TextEditingController();



  void initiateAddBank(){
    _clearFields();
  }



  void _clearFields() {
    bankNameC.clear();
    branchCode.clear();
    ifscC.clear();
  }


  void initiateUpdateBank(Bank thisBank){
    _clearFields();
    bankNameC.text=thisBank.bankName??"";
    branchCode.text=thisBank.branchCode??"";
    ifscC.text=thisBank.ifscCode??"";
  }



  ApiResponse<BankData> _bankDataResponse=ApiResponse<BankData>.initial("Initial");
  ApiResponse<BankData> get bankDataResponse=>_bankDataResponse;
  set bankDataResponse(ApiResponse<BankData> val){
    _bankDataResponse=val;
    notifyListeners();
  }


  Future<void> fetchBanks() async {
    if((bankDataResponse.data?.getAllData??[]).isEmpty){
      bankDataResponse=ApiResponse<BankData>.loading('Fetching Banks');
    }

    try{
      var data=await _api.call(
          url: "get-bank-master-data",
          apiCallType: ApiCallType.post(body: {
            "id": UserRepository.of(NavigationService.context!).getUser.id.toString()
          }),
          token: true
      );

      if(data['code']==200 && data['status']==true){
        bankDataResponse=ApiResponse<BankData>.completed(
            BankData.fromJson(data)
        );
      }
      else {
        bankDataResponse=ApiResponse<BankData>.empty("Data Not found");
      }
    }
    catch(e){
      bankDataResponse=ApiResponse<BankData>.error(e.toString());
    }

  }




  Future<void> addBank({
    String? id
  }) async{
    ProgressDialogue.show(message: id==null? "Adding Bank":"Updating Bank");
    try {

      Map bod={
        "bank_name": bankNameC.text,
        "branch_code": branchCode.text,
        "ifsc_code": ifscC.text,
      };
      if(id!=null){
        bod['id']=id;
      }
      var data= await _api.call(
          url: id!=null? "update-bank-master-data":"add-bank-master-data",
          apiCallType: ApiCallType.post(body: bod),
          token: true
      );
      ProgressDialogue.hide();
      Alert.show(data['message']);
      if(data['code']==200 && data['status']==true){
        MyNavigator.pop();
        fetchBanks();
      }
      else {
      }
    }
    catch (e){
      Alert.show(e.toString());
      ProgressDialogue.hide();
    }
  }



  Future<void> deleteBank({
    required String id
  }) async{
    ProgressDialogue.show(message: "Deleting Bank");
    try {
      var data=await _api.call(
          url: "delete-bank-master-data",
          apiCallType: ApiCallType.post(body: {
            "id": id.toString(),
          }),
          token: true
      );
      ProgressDialogue.hide();
      Alert.show(data['message']);
      if(data['code']==200 && data['status']==true){
        fetchBanks();
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