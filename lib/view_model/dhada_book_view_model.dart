import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vyaparmandali/app_manager/api/api_call.dart';
import 'package:vyaparmandali/app_manager/api/api_response.dart';
import 'package:vyaparmandali/app_manager/component/progress_dialogue.dart';
import 'package:vyaparmandali/app_manager/extension/custom_int_parse.dart';
import 'package:vyaparmandali/app_manager/helper/alert.dart';
import 'package:vyaparmandali/app_manager/helper/navigation/navigator.dart';
import 'package:vyaparmandali/app_manager/service/navigation_service.dart';
import 'package:vyaparmandali/authentication/user_repository.dart';
import 'package:vyaparmandali/model/dhada_book.dart';
import 'package:vyaparmandali/model/farmer.dart';
import 'package:vyaparmandali/model/inward_date.dart';
import 'package:vyaparmandali/model/item.dart';
import 'package:vyaparmandali/model/vehicle_number.dart';
import 'package:vyaparmandali/view_model/cash_book_item_view_model.dart';
import 'package:vyaparmandali/view_model/vehicle_view_model.dart';

class DhadaBookViewModel extends ChangeNotifier {

  static DhadaBookViewModel of(BuildContext context)=>Provider.of<DhadaBookViewModel>(context,listen: false);

  final ApiCall _api=ApiCall();


  TextEditingController dateC = TextEditingController();






  // TextEditingController farmerNameC = TextEditingController();
  // TextEditingController farmerPlaceC = TextEditingController();
  TextEditingController itemNumberC = TextEditingController();
  TextEditingController packageC = TextEditingController();
  int get totalPackageInInt => packageC.text.trim().isEmpty?0:int.parse(packageC.text.trim());

  int _packageDifference=0;
  int get packageDifference=>_packageDifference;
  set packageDifference(int val){
    _packageDifference=val;
    notifyListeners();
  }


  void calculatePackageDifference() {
    List<int> numbers = details.map((e) => int.parse(e.package==null? "0":e.package!.isEmpty? "0":e.package??"0")).toList();
    int sum = numbers.fold(0, (a, b) => a + b);
    packageDifference=totalPackageInInt-sum;
  }


  void calculatePBAndAverageForIndex({
    required int index,
    required int package,
    required int cWeight,
}) {
    details[index].average=(cWeight/package).toString();
    if(details[index].average.toDoubleCustom()<70){
     details[index].pB="P";
    }
    else {
      details[index].pB="B";
    }
    notifyListeners();
  }




  void calculateVAmountForIndex({
    required int index,
    required int rate,
    required int vW,
  }) {
      details[index].vAmount=(rate*vW).toString();
    notifyListeners();
  }

  void calculateCAmountForIndex({
    required int index,
    required int rate,
    required int cW,
  }) {
    details[index].cAmount=(rate*cW).toString();
    notifyListeners();
  }



  void selectedThisCustomer({
    required int index,
    required String customerName,
    required String customerId,
  }) {
    details[index].customerId=customerId;
    details[index].customerName=customerName;
    notifyListeners();
  }


  void clearCustomerFromIndex({
    required int index,
  }) {
    details[index].customerId=null;
    details[index].customerName=null;
    notifyListeners();
  }





  TextEditingController farmerC = TextEditingController();
  Farmer? _selectedFarmer;
  Farmer? get selectedFarmer=>_selectedFarmer;
  set selectedFarmer(Farmer? val){
    _selectedFarmer=val;
    notifyListeners();
    if(selectedFarmer==null){
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
     calculatePackageDifference();
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
    farmerC.clear();
    // farmerNameC.clear();
    // farmerPlaceC.clear();
    itemNumberC.clear();
    packageC.clear();
    selectedFarmer=null;
    details.clear();
    vehiclesDataResponse=ApiResponse<VehicleNumberData>.initial("Initial");
    selectedVehicleNumber=null;
    inwardDateDataResponse=ApiResponse<InWardDateData>.initial("Initial");
    selectedInWardDate=null;
    itemResponse=ApiResponse<ItemData>.initial("Initial");
    selectedItem=null;

    notifyListeners();
  }


  void initiateUpdateDhadaBook(DhadaBook thisDhadaBook){
    _clearFields();
    dateC.text= DateFormat("dd/MM/yyyy").parse(thisDhadaBook.date??"").toString();
    // farmerNameC.text=thisDhadaBook.farmerName??"";
    // farmerPlaceC.text=thisDhadaBook.farmerPlace??"";
    _selectedFarmer=Farmer();
    _selectedFarmer?.firstName= thisDhadaBook.farmerName??"";
    _selectedFarmer?.address= thisDhadaBook.farmerPlace??"";
    farmerC.text='${selectedFarmer?.firstName??""} ${selectedFarmer?.middleName??""} ${selectedFarmer?.lastName??""}';
    itemNumberC.text=thisDhadaBook.itemCode??"";
    packageC.text=thisDhadaBook.package??"";

    _selectedVehicleNumber=VehicleNo();
    _selectedVehicleNumber?.vehicalNo= thisDhadaBook.vehicalNo??"";



    _selectedInWardDate=InwardDate();
    _selectedInWardDate?.date= thisDhadaBook.inwardDate??"";

    _selectedItem=Item();
    _selectedItem?.item= thisDhadaBook.itemCode??"";




    for(int i=0; i<(thisDhadaBook.dhadabookDetails??[]).length; i++){
      DhadabookDetails thiDetail=(thisDhadaBook.dhadabookDetails??[])[i];
      details.add(
          thiDetail
      );
    }
    calculatePackageDifference();
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


      List detailsInMap=[];


      for(int i=0; i<details.length; i++){
        DhadabookDetails data=details[i];
        data.itemCode=selectedItem?.item??"";
        detailsInMap.add(data.toJson());
      }

      Map bod={
        "date": DateFormat("dd/MM/yyyy").format(DateTime.parse(dateC.text)),
        "inward_date": selectedInWardDate?.date??"",
        "vehical_no": selectedVehicleNumber?.vehicalNo??"",
        "farmer_id": selectedFarmer?.id??"",
        "farmer_name": "${selectedFarmer?.firstName??""} ${selectedFarmer?.middleName??""} ${selectedFarmer?.lastName??""}",
        "farmer_place": selectedFarmer?.address??"",
        "item_code": selectedItem?.item??"",
        "lot_no": "",
        "package": packageC.text,
        "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),
        "dhadabook_details": detailsInMap
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






  VehicleNo? _selectedVehicleNumber;
  VehicleNo? get selectedVehicleNumber=>_selectedVehicleNumber;
  set selectedVehicleNumber(VehicleNo? val){
    _selectedVehicleNumber=val;
    notifyListeners();
    if(selectedVehicleNumber==null){
      selectedInWardDate=null;
      inwardDateDataResponse=ApiResponse<InWardDateData>.initial("Initial");
      notifyListeners();
    }
    else {
      fetchInwardDate((selectedVehicleNumber?.vehicalNo??"").toString());
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

  InwardDate? _selectedInWardDate;
  InwardDate? get selectedInWardDate=>_selectedInWardDate;
  set selectedInWardDate(InwardDate? val){
    _selectedInWardDate=val;
    notifyListeners();
    if(selectedInWardDate==null){
      selectedItem=null;
      itemResponse=ApiResponse<ItemData>.initial("Initial");
      notifyListeners();
    }
    else {
      fetchItemData(
        vehicleNumber: (selectedVehicleNumber?.vehicalNo??"").toString(),
        inwardDate: (selectedInWardDate?.date??"").toString(),
      );
    }

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




  Item? _selectedItem;
  Item? get selectedItem=>_selectedItem;
  set selectedItem(Item? val){
    _selectedItem=val;
    notifyListeners();
    if(selectedItem!=null){
      packageC.text=selectedItem?.qty??"";
    }
    else {
      packageC.clear();
    }

  }

  ApiResponse<ItemData> _itemResponse=ApiResponse<ItemData>.initial("Initial");
  ApiResponse<ItemData> get itemResponse=>_itemResponse;
  set itemResponse(ApiResponse<ItemData> val){
    _itemResponse=val;
    notifyListeners();
  }


  void fetchItemData({
    required String vehicleNumber,
    required String inwardDate,
}) async{

    itemResponse=ApiResponse<ItemData>.loading('Fetching Item Date');


    try{
      var data= await CashBookItemViewModel.of(NavigationService.context!).fetItemDataUsing(
          vehicleNumber: vehicleNumber,
          inwardDate: inwardDate);
      if(data['code']==200 && data['status']==true){
        itemResponse=ApiResponse<ItemData>.completed(
            ItemData.fromJson(data)
        );
      }
      else {
        itemResponse=ApiResponse<ItemData>.empty("Item Data Not Found");
      }
    }
    catch(e){
      itemResponse=ApiResponse<ItemData>.error(e.toString());
    }
  }





}