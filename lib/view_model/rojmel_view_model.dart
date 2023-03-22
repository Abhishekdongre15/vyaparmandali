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
import 'package:vyaparmandali/model/customer.dart';

import '../model/rojmel.dart';

class RojmelViewModel extends ChangeNotifier {
  static RojmelViewModel of(BuildContext context) =>
      Provider.of<RojmelViewModel>(context, listen: false);

  final ApiCall _api = ApiCall();

  TextEditingController type = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController transactionType = TextEditingController();
  TextEditingController bankId = TextEditingController();
  TextEditingController totalBalance = TextEditingController();
  TextEditingController pattiNumber = TextEditingController();
  TextEditingController accountName = TextEditingController();
  TextEditingController accountCode = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController cheqNo = TextEditingController();
  TextEditingController description = TextEditingController();

  void initiateAddRojmel() {
    _clearFields();
  }

  void _clearFields() {
    type.clear();
    date.clear();
    transactionType.clear();
    bankId.clear();
    totalBalance.clear();
    pattiNumber.clear();
    accountName.clear();
    amount.clear();
    cheqNo.clear();
    description.clear();
    accountCode.clear();
  }

  void initiateUpdateRojmel(Rojmel thisRojmel) {
    _clearFields();
    type.text = thisRojmel.type ?? "";
    date.text= DateFormat("dd/MM/yyyy").parse(thisRojmel.date??"").toString();
    transactionType.text = thisRojmel.transactionType ?? "";
    bankId.text = thisRojmel.bankId ?? "";
    totalBalance.text = thisRojmel.totalBalance ?? "";
    pattiNumber.text = thisRojmel.pattiNumber ?? "";
    accountName.text = thisRojmel.accountName ?? "";
    accountCode.text = thisRojmel.accountCode ?? "";
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
    if ((customerDataResponse.data?.getAllData ?? []).isEmpty) {
      customerDataResponse =
          ApiResponse<RojmelData>.loading('Fetching Rojmel');
    }

    try {
      var data = await _api.call(
          url: "get_rojmel_data",
          apiCallType: ApiCallType.post(body: {
            "id": UserRepository.of(NavigationService.context!)
                .getUser
                .id
                .toString()
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
        message: id == null ? "Adding Haml" : "Updating Rojmel");
    try {
      var data = id != null
          ? await _api.call(
              url: "update_rojmel_data",
              apiCallType: ApiCallType.post(body: {
                "type": type.text,
                "date": date.text,
                "transaction_type": transactionType.text,
                "bank_id": bankId.text,
                "total_balance": totalBalance.text,
                "patti_number": pattiNumber.text,
                "account_name": accountName.text,
                "account_code": accountCode.text,
                "amount": amount.text,
                "cheq_no": cheqNo.text,
                "description": description.text,
                "id": id
              }),
              token: true)
          : await _api.call(
              url: "add_rojmel_data",
              apiCallType: ApiCallType.post(body: {
                "type": type.text,
                "date": date.text,
                "transaction_type": transactionType.text,
                "bank_id": bankId.text,
                "total_balance": totalBalance.text,
                "patti_number": pattiNumber.text,
                "account_name": accountName.text,
                "account_code": accountCode.text,
                "amount": amount.text,
                "cheq_no": cheqNo.text,
                "description": description.text,
              }),
              token: true);
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
          url: "delete_rojmel_data",
          apiCallType: ApiCallType.post(body: {
            "id": id.toString(),
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
