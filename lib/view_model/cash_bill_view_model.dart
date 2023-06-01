



import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:vyaparmandali/app_manager/api/api_call.dart';
import 'package:vyaparmandali/app_manager/api/api_response.dart';
import 'package:vyaparmandali/app_manager/component/progress_dialogue.dart';
import 'package:vyaparmandali/app_manager/helper/alert.dart';
import 'package:vyaparmandali/app_manager/helper/navigation/navigator.dart';
import 'package:vyaparmandali/app_manager/service/navigation_service.dart';
import 'package:vyaparmandali/authentication/user_repository.dart';
import 'package:vyaparmandali/model/cash_bill_data.dart';

class CashBillViewModel extends ChangeNotifier {

  static CashBillViewModel of(BuildContext context)=>Provider.of<CashBillViewModel>(context,listen: false);

  final ApiCall _api=ApiCall();

  TextEditingController productNameC = TextEditingController();
  TextEditingController weightC = TextEditingController();
  TextEditingController rateC = TextEditingController();
  TextEditingController apmcCharges = TextEditingController();
  TextEditingController commissionC = TextEditingController();
  TextEditingController finaPriceC = TextEditingController();



  void initiateAddCashBill(){
    _clearFields();
  }



  void _clearFields() {
    productNameC.clear();
    weightC.clear();
    rateC.clear();
    apmcCharges.clear();
    commissionC.clear();
    finaPriceC.clear();
  }


  void initiateUpdateCashBill(CashBill thisCashBill){
    _clearFields();
    productNameC.text=thisCashBill.productName??"";
    weightC.text=thisCashBill.weight??"";
    rateC.text=thisCashBill.rate??"";
    apmcCharges.text=thisCashBill.aPMCCharges??"";
    commissionC.text=thisCashBill.commission??"";
    finaPriceC.text=thisCashBill.finalPrice??"";
  }



  ApiResponse<CashBillData> _cashBillDataResponse=ApiResponse<CashBillData>.initial("Initial");
  ApiResponse<CashBillData> get cashBillDataResponse=>_cashBillDataResponse;
  set cashBillDataResponse(ApiResponse<CashBillData> val){
    _cashBillDataResponse=val;
    notifyListeners();
  }


  Future<void> fetchCashBills() async {
    if((cashBillDataResponse.data?.fetchCashBillData??[]).isEmpty){
      cashBillDataResponse=ApiResponse<CashBillData>.loading('Fetching Cash Bills');
    }

    try{
      var data=await _api.call(
          url: "fetch_all_data_from_cash_bill",
          apiCallType: ApiCallType.post(body: {
            "id": UserRepository.of(NavigationService.context!).getUser.id.toString(),
            "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),
          }),
          token: true
      );

      if(data['code']==200 && data['status']==true){
        cashBillDataResponse=ApiResponse<CashBillData>.completed(
            CashBillData.fromJson(data)
        );
      }
      else {
        cashBillDataResponse=ApiResponse<CashBillData>.empty("Data Not found");
      }
    }
    catch(e){
      cashBillDataResponse=ApiResponse<CashBillData>.error(e.toString());
    }

  }




  Future<void> addCashBill({
    String? id
  }) async{
    ProgressDialogue.show(message: id==null? "Adding CashBill":"Updating CashBill");
    try {

      Map bod={
        "product_name": productNameC.text,
        "weight": weightC.text,
        "rate": rateC.text,
        "APMC_charges": apmcCharges.text,
        "commission": commissionC.text,
        "final_price": finaPriceC.text,
        "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),
      };
      if(id!=null){
        bod['id']=id;
      }
      var data= await _api.call(
          url: id!=null? "update_cash_bill_data":"add_cash_bill",
          apiCallType: ApiCallType.post(body: bod),
          token: true
      );
      ProgressDialogue.hide();
      Alert.show(data['message']);
      if(data['code']==200 && data['status']==true){
        MyNavigator.pop();
        fetchCashBills();
      }
      else {
      }
    }
    catch (e){
      Alert.show(e.toString());
      ProgressDialogue.hide();
    }
  }



  Future<void> deleteCashBill({
    required String id
  }) async{
    ProgressDialogue.show(message: "Deleting CashBill");
    try {
      var data=await _api.call(
          url: "delete_cash_bill_data",
          apiCallType: ApiCallType.post(body: {
            "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),
            "id": id.toString(),
          }),
          token: true
      );
      ProgressDialogue.hide();
      Alert.show(data['message']);
      if(data['code']==200 && data['status']==true){
        fetchCashBills();
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