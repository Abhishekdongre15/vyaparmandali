// import 'package:flutter/material.dart';
// import 'package:vyaparmandali/app_manager/api/api_call.dart';
// import 'package:vyaparmandali/app_manager/component/progress_dialogue.dart';
// import 'package:vyaparmandali/app_manager/helper/alert.dart';
//
// class RegistrationViewModel {
//
//
//   final ApiCall _api=ApiCall();
//
//   TextEditingController contactNoC = TextEditingController();
//   TextEditingController passwordC = TextEditingController();
//   TextEditingController descriptionC = TextEditingController();
//
//
//
//
//
//
//   Future<void> register({
//     required String contactNo,
//     required String description,
//     required String password,
//     required String country,
//     required String state,
//     required String city,
//   }) async{
//
//     try  {
//       PD.show(message: "Processing Data");
//       var data= await _api.call(
//           url: "user_register",
//           apiCallType: ApiCallType.post(
//               body: {
//                 "contact_no": contactNo,
//                 "description": description,
//                 "password": password,
//                 "country": country,
//                 "state": state,
//                 "city": city,
//               }
//           ));
//       PD.hide();
//       if(data['code']==200 && data['status']==true){
//         emailC.clear();
//         passwordC.clear();
//       }
//       else {
//         Alert.show(data['message']);
//       }
//     }
//     catch (e) {
//       PD.hide();
//       Alert.show(e.toString());
//     }
//   }
//
//
// }