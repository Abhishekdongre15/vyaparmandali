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
import 'package:vyaparmandali/model/cash_book_item.dart';

class CashBookItemViewModel extends ChangeNotifier {

  static CashBookItemViewModel of(BuildContext context)=>Provider.of<CashBookItemViewModel>(context,listen: false);

  final ApiCall _api=ApiCall();


  TextEditingController codeC = TextEditingController();
  TextEditingController dateC = TextEditingController();
  TextEditingController srNumberC = TextEditingController();
  TextEditingController bankNameC = TextEditingController();
  TextEditingController totalLineItemC = TextEditingController();
  TextEditingController gallaAmountC = TextEditingController();
  TextEditingController udhariAmountC = TextEditingController();



  void initiateAddCashBookItem(){
    _clearFields();
  }



  void _clearFields() {
    codeC.clear();
    dateC.clear();
    srNumberC.clear();
    bankNameC.clear();
    totalLineItemC.clear();
    gallaAmountC.clear();
    udhariAmountC.clear();
  }


  void initiateUpdateCashBookItem(CashBookItem thisCashBookItem){
    _clearFields();
    codeC.text=thisCashBookItem.code??"";
    dateC.text= DateFormat("dd/MM/yyyy").parse(thisCashBookItem.date??"").toString();
    srNumberC.text=thisCashBookItem.srNo??"";
    bankNameC.text=thisCashBookItem.bankName??"";
    totalLineItemC.text=thisCashBookItem.totalItem??"";
    gallaAmountC.text=thisCashBookItem.gallaAmt??"";
    udhariAmountC.text=thisCashBookItem.udhariAmt??"";
  }



  ApiResponse<CashBookItemData> _cashBookItemDataResponse=ApiResponse<CashBookItemData>.initial("Initial");
  ApiResponse<CashBookItemData> get cashBookItemDataResponse=>_cashBookItemDataResponse;
  set cashBookItemDataResponse(ApiResponse<CashBookItemData> val){
    _cashBookItemDataResponse=val;
    notifyListeners();
  }


  Future<void> fetchCashBookItem() async {
    if((cashBookItemDataResponse.data?.getAllData??[]).isEmpty){
      cashBookItemDataResponse=ApiResponse<CashBookItemData>.loading('Fetching CashBookItem');
    }

    try{
      var data=await _api.call(
          url: "get-cashbook-item",
          apiCallType: ApiCallType.post(body: {
            "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),

            "id": UserRepository.of(NavigationService.context!).getUser.id.toString()
          }),
          token: true
      );

      if(data['code']==200 && data['status']==true){
        cashBookItemDataResponse=ApiResponse<CashBookItemData>.completed(
            CashBookItemData.fromJson(data)
        );
      }
      else {
        cashBookItemDataResponse=ApiResponse<CashBookItemData>.empty("Data Not found");
      }
    }
    catch(e){
      cashBookItemDataResponse=ApiResponse<CashBookItemData>.error(e.toString());
    }

  }




  Future<void> addCashBookItem({
    String? id
  }) async{
    ProgressDialogue.show(message: id==null? "Adding CashBookItem":"Updating CashBookItem");
    try {
      Map bod={
        "code": codeC.text,
        "date": DateFormat("dd/MM/yyyy").format(DateTime.parse(dateC.text)),
        "sr_no": srNumberC.text,
        "bank_name": bankNameC.text,
        "total_line_item": totalLineItemC.text,
        "galla_amt": gallaAmountC.text,
        "udhari_amt": udhariAmountC.text,
        "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),

      };
      if(id!=null){
        bod['id']=id;
      }
      var data= await _api.call(
          url: id!=null? "update_CashBookItem_main_data":"add_CashBookItem_main_data",
          apiCallType: ApiCallType.post(body: bod),
          token: true
      );
      ProgressDialogue.hide();
      Alert.show(data['message']);
      if(data['code']==200 && data['status']==true){
        MyNavigator.pop();
        fetchCashBookItem();
      }
      else {
      }
    }
    catch (e){
      Alert.show(e.toString());
      ProgressDialogue.hide();
    }
  }



  Future<void> deleteCashBookItem({
    required String id
  }) async{
    ProgressDialogue.show(message: "Deleting CashBookItem");
    try {
      var data=await _api.call(
          url: "delete-cashbook-item",
          apiCallType: ApiCallType.post(body: {
            "id": id.toString(),
            "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),

          }),
          token: true
      );
      ProgressDialogue.hide();
      Alert.show(data['message']);
      if(data['code']==200 && data['status']==true){
        fetchCashBookItem();
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