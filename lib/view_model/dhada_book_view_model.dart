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
import 'package:vyaparmandali/model/dhada_book.dart';
import 'package:vyaparmandali/model/farmer.dart';
import 'package:vyaparmandali/model/inward_date.dart';
import 'package:vyaparmandali/model/vehicle_number.dart';
import 'package:vyaparmandali/view_model/vehicle_view_model.dart';

class DhadaBookViewModel extends ChangeNotifier {

  static DhadaBookViewModel of(BuildContext context)=>Provider.of<DhadaBookViewModel>(context,listen: false);

  final ApiCall _api=ApiCall();


  TextEditingController dateC = TextEditingController();
  TextEditingController inWardDateC = TextEditingController();



  TextEditingController vehicleNumberC = TextEditingController();
  VehicleNo? _selectedVehicleNumber;
  VehicleNo? get selectedVehicleNumber=>_selectedVehicleNumber;
  set selectedVehicleNumber(VehicleNo? val){
    _selectedVehicleNumber=val;
    notifyListeners();
    if(selectedVehicleNumber==null){
      inWardDateC.clear();
      selectedInWardDate=null;
      inwardDateDataResponse=ApiResponse<InWardDateData>.initial("Initial");
      notifyListeners();
    }
    else {
      fetchInwardDate((selectedVehicleNumber?.vehicalNo??"").toString());
    }

  }



  InwardDate? _selectedInWardDate;
  InwardDate? get selectedInWardDate=>_selectedInWardDate;
  set selectedInWardDate(InwardDate? val){
    _selectedInWardDate=val;
    notifyListeners();
  }




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
    if(selectedFarmer==null){
      vehicleNumberC.clear();
      selectedVehicleNumber=null;
      vehiclesDataResponse=ApiResponse<VehicleNumberData>.initial("Initial");
      notifyListeners();
    }
    else {
      fetchVehicleNumber((selectedFarmer?.id??"").toString());
    }

  }



  List<DhadabookDetails> details=[];

  void addDetails() {
    details.add(DhadabookDetails());
    notifyListeners();
  }

  void clearDetailOnIndex(int index){
    details.removeAt(index);
    notifyListeners();
  }


  void initiateAddDhadaBook(){
    _clearFields();
    dateC.text=DateTime.now().toString();
    notifyListeners();
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
    details.clear();
    vehiclesDataResponse=ApiResponse<VehicleNumberData>.initial("Initial");
    selectedVehicleNumber=null;
    inwardDateDataResponse=ApiResponse<InWardDateData>.initial("Initial");
    selectedInWardDate=null;
    notifyListeners();
  }


  void initiateUpdateDhadaBook(DhadaBook thisDhadaBook){
    _clearFields();
    dateC.text= DateFormat("dd/MM/yyyy").parse(thisDhadaBook.date??"").toString();
    inWardDateC.text= DateFormat("dd/MM/yyyy").parse(thisDhadaBook.inwardDate??"").toString();
     vehicleNumberC.text=thisDhadaBook.vehicalNo??"";
    // farmerNameC.text=thisDhadaBook.farmerName??"";
    // farmerPlaceC.text=thisDhadaBook.farmerPlace??"";
    selectedFarmer=Farmer();
    selectedFarmer?.firstName= thisDhadaBook.farmerName??"";
    selectedFarmer?.address= thisDhadaBook.farmerPlace??"";
    farmerC.text='${selectedFarmer?.firstName??""} ${selectedFarmer?.middleName??""} ${selectedFarmer?.lastName??""}';
    lotNumberC.text=thisDhadaBook.lotNo??"";
    packageC.text=thisDhadaBook.package??"";

    for(int i=0; i<(thisDhadaBook.dhadabookDetails??[]).length; i++){
      DhadabookDetails thiDetail=(thisDhadaBook.dhadabookDetails??[])[i];
      details.add(
          thiDetail
      );
    }
    notifyListeners();
  }



  ApiResponse<DhadaBookData> _dhadaBookDataResponse=ApiResponse<DhadaBookData>.initial("Initial");
  ApiResponse<DhadaBookData> get dhadaBookDataResponse=>_dhadaBookDataResponse;
  set dhadaBookDataResponse(ApiResponse<DhadaBookData> val){
    _dhadaBookDataResponse=val;
    notifyListeners();
  }


  Future<void> fetchDhadaBook() async {
    if((dhadaBookDataResponse.data?.getData??[]).isEmpty){
      dhadaBookDataResponse=ApiResponse<DhadaBookData>.loading('Fetching DhadaBook');
    }

    try{
      var data=await _api.call(
          url: "get-dhadabook-main-and-details-data",
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
        "farmer_id": selectedFarmer?.id??"",
        "farmer_place": selectedFarmer?.address??"",
        "lot_no": lotNumberC.text,
        "package": packageC.text,
        "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),
        "dhadabook_details": details.map((e) => e.toJson()).toList()
      };
      if(id!=null){
        bod['id']=id;
      }
      var data= await _api.call(
          url: id!=null? "update-dhadabook-main-and-details-data":"add-dhadabook-main-and-details-data",
          apiCallType: ApiCallType.rawPost(body: bod),
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
          url: "delete-dhadabook-main-and-details-data",
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



  Future<void> subDeleteDhadaBookDetails({
    required String id,
    int? index,
  }) async{
    ProgressDialogue.show(message: "Deleting Dhada Book Detail");
    try {
      var data=await _api.call(
          url: "sub-delete-dhadabook-main-and-details-data",
          apiCallType: ApiCallType.post(body: {
            "id": id.toString(),
            "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),
          }),
          token: true
      );
      ProgressDialogue.hide();
      Alert.show(data['message']);
      if(data['code']==200 && data['status']==true){
        if(index!=null){
          clearDetailOnIndex(index);
        }
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







  ApiResponse<VehicleNumberData> _vehiclesDataResponse=ApiResponse<VehicleNumberData>.initial("Initial");
  ApiResponse<VehicleNumberData> get vehiclesDataResponse=>_vehiclesDataResponse;
  set vehiclesDataResponse(ApiResponse<VehicleNumberData> val){
    _vehiclesDataResponse=val;
    notifyListeners();
  }



  void fetchVehicleNumber(String id) async{

      vehiclesDataResponse=ApiResponse<VehicleNumberData>.loading('Fetching Vehicles');


    try{
      var data= ( await VehicleViewModel.of(NavigationService.context!).fetchVehicleNumberForFarmer(id: id))??"";

      if(data['code']==200 && data['status']==true){
        vehiclesDataResponse=ApiResponse<VehicleNumberData>.completed(
            VehicleNumberData.fromJson(data)
        );
      }
      else {
        vehiclesDataResponse=ApiResponse<VehicleNumberData>.empty("Vehicles Not found");
      }
    }
    catch(e){
      vehiclesDataResponse=ApiResponse<VehicleNumberData>.error(e.toString());
    }
  }




  ApiResponse<InWardDateData> _inwardDateDataResponse=ApiResponse<InWardDateData>.initial("Initial");
  ApiResponse<InWardDateData> get inwardDateDataResponse=>_inwardDateDataResponse;
  set inwardDateDataResponse(ApiResponse<InWardDateData> val){
    _inwardDateDataResponse=val;
    notifyListeners();
  }



  void fetchInwardDate(String vehicleNumber) async{

      inwardDateDataResponse=ApiResponse<InWardDateData>.loading('Fetching InWard Date');


    try{
      var data= await VehicleViewModel.of(NavigationService.context!).fetchInwardDateUsingVehicleNumber(vehicleNumber: vehicleNumber);
      if(data['code']==200 && data['status']==true){
        inwardDateDataResponse=ApiResponse<InWardDateData>.completed(
            InWardDateData.fromJson(data)
        );
      }
      else {
        inwardDateDataResponse=ApiResponse<InWardDateData>.empty("InWard Date Not Found");
      }
    }
    catch(e){
      inwardDateDataResponse=ApiResponse<InWardDateData>.error(e.toString());
    }
  }



}