import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vyaparmandali/app_manager/api/api_call.dart';
import 'package:vyaparmandali/app_manager/component/progress_dialogue.dart';
import 'package:vyaparmandali/app_manager/helper/alert.dart';
import 'package:vyaparmandali/app_manager/helper/navigator.dart';

class RegistrationViewModel extends ChangeNotifier{

  static RegistrationViewModel of(BuildContext context)=>Provider.of<RegistrationViewModel>(context,listen: false);

  final ApiCall _api=ApiCall();

  TextEditingController firstNameC = TextEditingController();
  TextEditingController lastNameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController contactNoC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  TextEditingController descriptionC = TextEditingController();


  void initiate(){
    _clearFields();
  }


  void _clearFields(){
    firstNameC.clear();
    lastNameC.clear();
    emailC.clear();
    contactNoC.clear();
    passwordC.clear();
    descriptionC.clear();
    _country=null;
    _state=null;
    _city=null;
  }



  String? _country;
  String? get country=>_country;
  set country(String? val){
    _country=val;
    state=null;
    city=null;
    notifyListeners();
  }

  String? _state;
  String? get state=>_state;
  set state(String? val){
    _state=val;
    city=null;
    notifyListeners();
  }

  String? _city;
  String? get city=>_city;
  set city(String? val){
    _city=val;
    notifyListeners();
  }



  Future<void> onPressSubmit() async{
    if(country==null){
      Alert.show("Please select country");
    }
    else if(state==null){
      Alert.show("Please select state");
    }
    else if(city==null){
      Alert.show("Please select city");
    }
    else {
      _register();
    }
  }


  Future<void> _register() async{
    try  {
      PD.show(message: "Processing Data");
      var data= await _api.call(
          url: "user_register",
          apiCallType: ApiCallType.post(
              body: {
                "firstname": firstNameC.text,
                "lastname": lastNameC.text,
                "email": emailC.text,
                "contact_no": contactNoC.text,
                "description": descriptionC.text,
                "password": passwordC.text,
                "country": country,
                "state": state,
                "city": city,
              }
          ));
      PD.hide();
      Alert.show(data['message']);
      if(data['code']==200 && data['status']==true){
        _clearFields();
        MyNavigator.pop();
      }
      else {

      }
    }
    catch (e) {
      PD.hide();
      Alert.show(e.toString());
    }
  }




}