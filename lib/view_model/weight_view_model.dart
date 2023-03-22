import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:vyaparmandali/app_manager/api/api_call.dart';
import 'package:vyaparmandali/app_manager/api/api_response.dart';
import 'package:vyaparmandali/app_manager/component/progress_dialogue.dart';
import 'package:vyaparmandali/app_manager/helper/alert.dart';
import 'package:vyaparmandali/app_manager/helper/navigator.dart';
import 'package:vyaparmandali/app_manager/service/navigation_service.dart';
import 'package:vyaparmandali/authentication/user_repository.dart';
import 'package:vyaparmandali/model/weight.dart';

class WeightViewModel extends ChangeNotifier {

  static WeightViewModel of(BuildContext context)=>Provider.of<WeightViewModel>(context,listen: false);

  final ApiCall _api=ApiCall();

  TextEditingController weightNameC = TextEditingController();



  void initiateAddWeightType(){
    _clearFields();
  }



  void _clearFields() {
    weightNameC.clear();
  }


  void initiateUpdateWeight(Weight thisWeight){
    _clearFields();
    weightNameC.text=thisWeight.weightName??"";
  }



  ApiResponse<WeightData> _weightDataResponse=ApiResponse<WeightData>.initial("Initial");
  ApiResponse<WeightData> get weightDataResponse=>_weightDataResponse;
  set weightDataResponse(ApiResponse<WeightData> val){
    _weightDataResponse=val;
    notifyListeners();
  }


  Future<void> fetchWeights() async {
    if((weightDataResponse.data?.getAllData??[]).isEmpty){
      weightDataResponse=ApiResponse<WeightData>.loading('Fetching Weights');
    }

    try{
      var data=await _api.call(
          url: "get-weight-type-master-data",
          apiCallType: ApiCallType.post(body: {
            "id": UserRepository.of(NavigationService.context!).getUser.id.toString()
          }),
          token: true
      );

      if(data['code']==200 && data['status']==true){
        weightDataResponse=ApiResponse<WeightData>.completed(
            WeightData.fromJson(data)
        );
      }
      else {
        weightDataResponse=ApiResponse<WeightData>.empty("Data Not found");
      }
    }
    catch(e){
      weightDataResponse=ApiResponse<WeightData>.error(e.toString());
    }

  }




  Future<void> addWeight({
    String? id
  }) async{
    ProgressDialogue.show(message: id==null? "Adding Weight":"Updating Weight");
    try {

      Map bod={
        "weight_name": weightNameC.text,
      };
      if(id!=null){
        bod['id']=id;
      }
      var data= await _api.call(
          url: id!=null? "update-weight-type-master-data":"add-weight-type-master-data",
          apiCallType: ApiCallType.post(body: bod),
          token: true
      );
      ProgressDialogue.hide();
      Alert.show(data['message']);
      if(data['code']==200 && data['status']==true){
        MyNavigator.pop();
        fetchWeights();
      }
      else {
      }
    }
    catch (e){
      Alert.show(e.toString());
      ProgressDialogue.hide();
    }
  }



  Future<void> deleteWeight({
    required String id
  }) async{
    ProgressDialogue.show(message: "Deleting Weight");
    try {
      var data=await _api.call(
          url: "delete-weight-type-master-data",
          apiCallType: ApiCallType.post(body: {
            "id": id.toString(),
          }),
          token: true
      );
      ProgressDialogue.hide();
      Alert.show(data['message']);
      if(data['code']==200 && data['status']==true){
        fetchWeights();
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