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
import 'package:vyaparmandali/model/bank.dart';

import '../model/rojmel.dart';

class RojmelViewModel extends ChangeNotifier {
  static RojmelViewModel of(BuildContext context) =>
      Provider.of<RojmelViewModel>(context, listen: false);

  final ApiCall _api = ApiCall();


  TextEditingController date = TextEditingController();
  TextEditingController totalBalance = TextEditingController();
  TextEditingController pattiNumber = TextEditingController();
  TextEditingController accountName = TextEditingController();
  TextEditingController accountCode = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController cheqNo = TextEditingController();
  TextEditingController description = TextEditingController();


  static List<String> paymentTypes=[
    "Received",
    "Payment",
  ];


  String? _selectedPaymentType;
  String? get selectedPaymentType => _selectedPaymentType;
  set selectedPaymentType (String? val) {
    _selectedPaymentType=val;
    notifyListeners();
  }


  Bank? _selectedBank;
  Bank? get selectedBank => _selectedBank;
  set selectedBank(Bank? val) {
    _selectedBank=val;
    notifyListeners();
  }



  static List<String> transactionsTypes=[
    "Bank",
    "Cash",
  ];


  String? _selectedTransactionType;
  String? get selectedTransactionType => _selectedTransactionType;
  set selectedTransactionType (String? val) {
    _selectedTransactionType=val;
    notifyListeners();
    if(val!=transactionsTypes[0]){
      selectedBank=null;
    }
  }


  bool get showBankId => selectedTransactionType=="Bank";

  void initiateAddRojmel() {
    _clearFields();
  }

  void _clearFields() {
    date.clear();
    date.text= DateTime.now().toString();
    selectedBank=null;
    totalBalance.clear();
    pattiNumber.clear();
    accountName.clear();
    amount.clear();
    cheqNo.clear();
    description.clear();
    accountCode.clear();
    selectedPaymentType=null;
    selectedTransactionType=null;
  }

  void initiateUpdateRojmel(Rojmel thisRojmel) {
    _clearFields();
    selectedPaymentType = thisRojmel.type ?? "";
    selectedTransactionType = thisRojmel.transactionType ?? "";
    date.text= DateFormat("yyyy-MM-dd").parse(thisRojmel.date??"").toString();
    _selectedBank = Bank();
    _selectedBank!.id=thisRojmel.bankId ?? "";
    _selectedBank!.bankName=thisRojmel.bankName ?? "";
    notifyListeners();
    totalBalance.text = thisRojmel.totalBalance ?? "";
    pattiNumber.text = thisRojmel.pattiNumber ?? "";
    accountName.text = thisRojmel.accountName ?? "";
    amount.text = thisRojmel.amount ?? "";
    cheqNo.text = thisRojmel.cheqNo ?? "";
    description.text = thisRojmel.description ?? "";
    accountCode.text = thisRojmel.accountCode ?? "";
  }

  ApiResponse<RojmelData> _customerDataResponse =
      ApiResponse<RojmelData>.initial("Initial");

  ApiResponse<RojmelData> get customerDataResponse => _customerDataResponse;

  set customerDataResponse(ApiResponse<RojmelData> val) {
    _customerDataResponse = val;
    notifyListeners();
  }

  Future<void> fetchRojmel() async {
    if ((customerDataResponse.data?.getData ?? []).isEmpty) {
      customerDataResponse =
          ApiResponse<RojmelData>.loading('Fetching Rojmel');
    }

    try {
      var data = await _api.call(
          url: "get-rojmel-data",
          apiCallType: ApiCallType.post(body: {
            "id": UserRepository.of(NavigationService.context!)
                .getUser
                .id
                .toString(),
            "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),

          }),
          token: true);

      if (data['code'] == 200 && data['status'] == true) {
        customerDataResponse =
            ApiResponse<RojmelData>.completed(RojmelData.fromJson(data));
      } else {
        customerDataResponse =
            ApiResponse<RojmelData>.empty("Data Not found");
      }
    } catch (e) {
      customerDataResponse = ApiResponse<RojmelData>.error(e.toString());
    }
  }

  Future<void> addRojmel({String? id}) async {
    ProgressDialogue.show(
        message: id == null ? "Adding Rojmel" : "Updating Rojmel");
    try {


      Map body= {
        "type": selectedPaymentType,
        "date": date.text,
        "transaction_type": selectedTransactionType,
        "bank_id": selectedBank!.id,
        "bank_name": selectedBank!.bankName,
        "total_balance": totalBalance.text,
        "patti_number": pattiNumber.text,
        "account_name": accountName.text,
        "account_code": accountCode.text,
        "amount": amount.text,
        "cheq_no": cheqNo.text,
        "description": description.text,
        "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),
      };
      if(id!=null){
        body['id']=id;
      }
      var data= await _api.call(
          url: id!=null? "update-rojmel-data":"add-rojmel-data",
          apiCallType: ApiCallType.post(body: body),
          token: true
      );

      ProgressDialogue.hide();
      Alert.show(data['message']);
      if (data['code'] == 200 && data['status'] == true) {
        MyNavigator.pop();
        fetchRojmel();
      } else {}
    } catch (e) {
      Alert.show(e.toString());
      ProgressDialogue.hide();
    }
  }

  Future<void> deleteRojmel({required String id}) async {
    ProgressDialogue.show(message: "Deleting Rojmel");
    try {
      var data = await _api.call(
          url: "delete-rojmel-data",
          apiCallType: ApiCallType.post(body: {
            "id": id.toString(),
            "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),

          }),
          token: true);
      ProgressDialogue.hide();
      Alert.show(data['message']);
      if (data['code'] == 200 && data['status'] == true) {
        fetchRojmel();
      } else {}
    } catch (e) {
      Alert.show(e.toString());
      ProgressDialogue.hide();
    }
  }
}
