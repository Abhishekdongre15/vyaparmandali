import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:vyaparmandali/app_manager/api/api_call.dart';
import 'package:vyaparmandali/app_manager/api/api_response.dart';
import 'package:vyaparmandali/app_manager/component/progress_dialogue.dart';
import 'package:vyaparmandali/app_manager/helper/alert.dart';
import 'package:vyaparmandali/app_manager/helper/navigation/navigator.dart';
import 'package:vyaparmandali/app_manager/service/navigation_service.dart';
import 'package:vyaparmandali/authentication/user_repository.dart';
import 'package:vyaparmandali/model/customer.dart';

class CustomerViewModel extends ChangeNotifier {
  static CustomerViewModel of(BuildContext context) =>
      Provider.of<CustomerViewModel>(context, listen: false);

  final ApiCall _api = ApiCall();

  TextEditingController firstName = TextEditingController();
  TextEditingController middleName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController contact_no = TextEditingController();

  void initiateAddCustomer() {
    _clearFields();
  }

  void _clearFields() {
    firstName.clear();
    middleName.clear();
    lastName.clear();
    district.clear();
    city.clear();
    state.clear();
    address.clear();
    contact_no.clear();
    email.clear();
  }

  void initiateUpdateCustomer(Customer thisCustomer) {
    _clearFields();
    firstName.text = thisCustomer.firstName ?? "";
    middleName.text = thisCustomer.middleName ?? "";
    lastName.text = thisCustomer.lastName ?? "";
    district.text = thisCustomer.district ?? "";
    city.text = thisCustomer.city ?? "";
    address.text = thisCustomer.address ?? "";
    state.text = thisCustomer.state ?? "";
    email.text = thisCustomer.email ?? "";
    contact_no.text = thisCustomer.contactNo ?? "";
  }

  ApiResponse<CustomerData> _customerDataResponse =
      ApiResponse<CustomerData>.initial("Initial");

  ApiResponse<CustomerData> get customerDataResponse => _customerDataResponse;

  set customerDataResponse(ApiResponse<CustomerData> val) {
    _customerDataResponse = val;
    notifyListeners();
  }

  Future<void> fetchCustomer() async {
    if ((customerDataResponse.data?.getAllData ?? []).isEmpty) {
      customerDataResponse =
          ApiResponse<CustomerData>.loading('Fetching Customer');
    }

    try {
      var data = await _api.call(
          url: "get_customer_data",
          apiCallType: ApiCallType.post(body: {
            "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),

            "id": UserRepository.of(NavigationService.context!)
                .getUser
                .id
                .toString()

          }),
          token: true);

      if (data['code'] == 200 && data['status'] == true) {
        customerDataResponse =
            ApiResponse<CustomerData>.completed(CustomerData.fromJson(data));
      } else {
        customerDataResponse =
            ApiResponse<CustomerData>.empty("Data Not found");
      }
    } catch (e) {
      customerDataResponse = ApiResponse<CustomerData>.error(e.toString());
    }
  }

  Future<void> addCustomer({String? id}) async {
    ProgressDialogue.show(
        message: id == null ? "Adding Haml" : "Updating Customer");
    try {
      var data = id != null
          ? await _api.call(
              url: "update_customer_data",
              apiCallType: ApiCallType.post(body: {
                "first_name": firstName.text,
                "middle_name": middleName.text,
                "last_name": lastName.text,
                "city": city.text,
                "district": district.text,
                "state": state.text,
                "address": address.text,
                "email": email.text,
                "contact_no": contact_no.text,
                "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),

                "id": id

              }),
              token: true)
          : await _api.call(
              url: "add_customer_data",
              apiCallType: ApiCallType.post(body: {
                "first_name": firstName.text,
                "middle_name": middleName.text,
                "last_name": lastName.text,
                "city": city.text,
                "district": district.text,
                "state": state.text,
                "address": address.text,
                "email": email.text,
                "contact_no": contact_no.text,
                "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),

              }),
              token: true);
      ProgressDialogue.hide();
      Alert.show(data['message']);
      if (data['code'] == 200 && data['status'] == true) {
        MyNavigator.pop();
        fetchCustomer();
      } else {}
    } catch (e) {
      Alert.show(e.toString());
      ProgressDialogue.hide();
    }
  }

  Future<void> deleteCustomer({required String id}) async {
    ProgressDialogue.show(message: "Deleting Customer");
    try {
      var data = await _api.call(
          url: "delete_customer_data",
          apiCallType: ApiCallType.post(body: {
            "id": id.toString(),
            "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),

          }),
          token: true);
      ProgressDialogue.hide();
      Alert.show(data['message']);
      if (data['code'] == 200 && data['status'] == true) {
        fetchCustomer();
      } else {}
    } catch (e) {
      Alert.show(e.toString());
      ProgressDialogue.hide();
    }
  }
}
