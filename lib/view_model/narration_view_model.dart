import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:vyaparmandali/app_manager/api/api_call.dart';
import 'package:vyaparmandali/app_manager/api/api_response.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/custom_bottom_sheet.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/titled_sheet.dart';
import 'package:vyaparmandali/app_manager/component/progress_dialogue.dart';
import 'package:vyaparmandali/app_manager/helper/alert.dart';
import 'package:vyaparmandali/app_manager/helper/navigation/navigator.dart';
import 'package:vyaparmandali/app_manager/service/navigation_service.dart';
import 'package:vyaparmandali/authentication/user_repository.dart';
import 'package:vyaparmandali/model/narration.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/narrartion/add_narration_view.dart';

class NarrationViewModel extends ChangeNotifier {

  static NarrationViewModel of(BuildContext context)=>Provider.of<NarrationViewModel>(context,listen: false);

  final ApiCall _api=ApiCall();

  TextEditingController codeC = TextEditingController();
  TextEditingController descriptionC = TextEditingController();



  void initiateAddNarration(){
    _clearFields();
  }



  void _clearFields() {
    codeC.clear();
    descriptionC.clear();
  }


  void initiateUpdateNarration(Narration thisNarration){
    _clearFields();
    codeC.text=thisNarration.code??"";
    descriptionC.text=thisNarration.description??"";
  }



  ApiResponse<NarrationData> _narrationDataResponse=ApiResponse<NarrationData>.initial("Initial");
  ApiResponse<NarrationData> get narrationDataResponse=>_narrationDataResponse;
  set narrationDataResponse(ApiResponse<NarrationData> val){
    _narrationDataResponse=val;
    notifyListeners();
  }


  Future<void> fetchNarrations() async {
    if((narrationDataResponse.data?.getData??[]).isEmpty){
      narrationDataResponse=ApiResponse<NarrationData>.loading('Fetching Narrations');
    }

    try{
      var data=await _api.call(
          url: "get-narration-data",
          apiCallType: ApiCallType.post(body: {
            "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),

            "id": UserRepository.of(NavigationService.context!).getUser.id.toString()
          }),
          token: true
      );

      if(data['code']==200 && data['status']==true){
        narrationDataResponse=ApiResponse<NarrationData>.completed(
            NarrationData.fromJson(data)
        );
      }
      else {
        narrationDataResponse=ApiResponse<NarrationData>.empty("Data Not found");
      }
    }
    catch(e){
      narrationDataResponse=ApiResponse<NarrationData>.error(e.toString());
    }

  }




  Future<void> addNarration({
    String? id
  }) async{
    ProgressDialogue.show(message: id==null? "Adding Narration":"Updating Narration");
    try {


      Map body={
        "code": codeC.text,
        "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),
        "description": descriptionC.text,
      };
      if(id!=null){
        body['id']=id;
      }
      var data= await _api.call(
          url: id!=null? "update-narration-data":"add-narration-data",
          apiCallType: ApiCallType.post(body: body),
          token: true
      );
      ProgressDialogue.hide();
      Alert.show(data['message']);
      if(data['code']==200 && data['status']==true){
        MyNavigator.pop();
        fetchNarrations();
      }
      else {
      }
    }
    catch (e){
      Alert.show(e.toString());
      ProgressDialogue.hide();
    }
  }



  Future<void> deleteNarration({
    required String id
  }) async{
    ProgressDialogue.show(message: "Deleting Narration");
    try {
      var data=await _api.call(
          url: "delete-narration-data",
          apiCallType: ApiCallType.post(body: {
            "id": id.toString(),
            "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),

          }),
          token: true
      );
      ProgressDialogue.hide();
      Alert.show(data['message']);
      if(data['code']==200 && data['status']==true){
        fetchNarrations();
      }
      else {
      }
    }
    catch (e){
      Alert.show(e.toString());
      ProgressDialogue.hide();
    }
  }




  ApiResponse<List<Narration>> _searchedNarrationResponse=ApiResponse<List<Narration>>.initial("Initial");
  ApiResponse<List<Narration>> get searchedNarrationResponse=>_searchedNarrationResponse;
  set searchedNarrationResponse(ApiResponse<List<Narration>> val){
    _searchedNarrationResponse=val;
    notifyListeners();
  }


  Future<void> fetchNarrationByDescription({
    required String narrationName
  }) async {
    searchedNarrationResponse=ApiResponse<List<Narration>>.loading('Fetching Narrations');
    try{
      var data=await _api.call(
          url: "fetch-narration-data-by-description",
          apiCallType: ApiCallType.post(body: {
            "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),
            "description": narrationName
          }),
          token: true
      );

      if(data['code']==200 && data['status']==true){

        searchedNarrationResponse=ApiResponse<List<Narration>>.completed(
            List<Narration>.from(
                (data['fetch_narration_data_by_description'] as List).map((e) => Narration.fromJson(e))
            )
        );
      }
      else {
        searchedNarrationResponse=ApiResponse<List<Narration>>.empty("Data Not found");
      }
    }
    catch(e){
      searchedNarrationResponse=ApiResponse<List<Narration>>.error(e.toString());
    }

  }

  static void onPressAddNarration(){
    CustomBottomSheet.open(
        child: const TitledSheet(title: "Add Narration", child: AddNarrationView()));
  }



}