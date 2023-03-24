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
import 'package:vyaparmandali/model/dhada_book.dart';
import 'package:vyaparmandali/model/farmer.dart';

class DhadaBookViewModel extends ChangeNotifier {

  static DhadaBookViewModel of(BuildContext context)=>Provider.of<DhadaBookViewModel>(context,listen: false);

  final ApiCall _api=ApiCall();


  TextEditingController dateC = TextEditingController();
  TextEditingController inWardDateC = TextEditingController();
  TextEditingController vehicleNumberC = TextEditingController();
  // TextEditingController farmerNameC = TextEditingController();
  // TextEditingController farmerPlaceC = TextEditingController();
  TextEditingController lotNumberC = TextEditingController();
  TextEditingController packageC = TextEditingController();


  TextEditingController farmerC = TextEditingController();
  Farmer? _selectedFarmer;
  Farmer? get selectedFarmer=>_selectedFarmer;
  set selectedFarmer(Farmer? val){
    _selectedFarmer=val;
    notifyListeners();
  }


  void initiateAddDhadaBook(){
    _clearFields();
  }



  void _clearFields() {
    dateC.clear();
    inWardDateC.clear();
    vehicleNumberC.clear();
    farmerC.clear();
    // farmerNameC.clear();
    // farmerPlaceC.clear();
    lotNumberC.clear();
    packageC.clear();
    selectedFarmer=null;
  }


  void initiateUpdateDhadaBook(DhadaBook thisDhadaBook){
    _clearFields();
    dateC.text= DateFormat("dd/MM/yyyy").parse(thisDhadaBook.date??"").toString();
    inWardDateC.text= DateFormat("dd/MM/yyyy").parse(thisDhadaBook.inwardDate??"").toString();
     vehicleNumberC.text=thisDhadaBook.vehicalNo??"";
    // farmerNameC.text=thisDhadaBook.farmerName??"";
    // farmerPlaceC.text=thisDhadaBook.farmerPlace??"";
    selectedFarmer=Farmer(
      farmerName: thisDhadaBook.farmerName??"",
      address: thisDhadaBook.farmerPlace??"",
    );
    farmerC.text=selectedFarmer?.farmerName??"";
    lotNumberC.text=thisDhadaBook.lotNo??"";
    packageC.text=thisDhadaBook.package??"";
  }



  ApiResponse<DhadaBookData> _dhadaBookDataResponse=ApiResponse<DhadaBookData>.initial("Initial");
  ApiResponse<DhadaBookData> get dhadaBookDataResponse=>_dhadaBookDataResponse;
  set dhadaBookDataResponse(ApiResponse<DhadaBookData> val){
    _dhadaBookDataResponse=val;
    notifyListeners();
  }


  Future<void> fetchDhadaBook() async {
    if((dhadaBookDataResponse.data?.getAllData??[]).isEmpty){
      dhadaBookDataResponse=ApiResponse<DhadaBookData>.loading('Fetching DhadaBook');
    }

    try{
      var data=await _api.call(
          url: "get_dhadabook_main_data",
          apiCallType: ApiCallType.post(body: {
            "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),

            "id": UserRepository.of(NavigationService.context!).getUser.id.toString()
          }),
          token: true
      );

      if(data['code']==200 && data['status']==true){
        dhadaBookDataResponse=ApiResponse<DhadaBookData>.completed(
            DhadaBookData.fromJson(data)
        );
      }
      else {
        dhadaBookDataResponse=ApiResponse<DhadaBookData>.empty("Data Not found");
      }
    }
    catch(e){
      dhadaBookDataResponse=ApiResponse<DhadaBookData>.error(e.toString());
    }

  }




  Future<void> addDhadaBook({
    String? id
  }) async{
    ProgressDialogue.show(message: id==null? "Adding DhadaBook":"Updating DhadaBook");
    try {
      Map bod={
        "date": DateFormat("dd/MM/yyyy").format(DateTime.parse(dateC.text)),
        "inward_date": DateFormat("dd/MM/yyyy").format(DateTime.parse(inWardDateC.text)),
        "vehical_no": vehicleNumberC.text,
        "farmer_name": selectedFarmer?.farmerName??"",
        "farmer_place": selectedFarmer?.address??"",
        "lot_no": lotNumberC.text,
        "package": packageC.text,
        "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),

      };
      if(id!=null){
        bod['id']=id;
      }
      var data= await _api.call(
          url: id!=null? "update_dhadabook_main_data":"add_dhadabook_main_data",
          apiCallType: ApiCallType.post(body: bod),
          token: true
      );
      ProgressDialogue.hide();
      Alert.show(data['message']);
      if(data['code']==200 && data['status']==true){
        MyNavigator.pop();
        fetchDhadaBook();
      }
      else {
      }
    }
    catch (e){
      Alert.show(e.toString());
      ProgressDialogue.hide();
    }
  }



  Future<void> deleteDhadaBook({
    required String id
  }) async{
    ProgressDialogue.show(message: "Deleting DhadaBook");
    try {
      var data=await _api.call(
          url: "delete_dhadabook_main_data",
          apiCallType: ApiCallType.post(body: {
            "id": id.toString(),
            "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),

          }),
          token: true
      );
      ProgressDialogue.hide();
      Alert.show(data['message']);
      if(data['code']==200 && data['status']==true){
        fetchDhadaBook();
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