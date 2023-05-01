import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:vyaparmandali/app_manager/api/api_call.dart';
import 'package:vyaparmandali/app_manager/api/api_response.dart';
import 'package:vyaparmandali/app_manager/component/progress_dialogue.dart';
import 'package:vyaparmandali/app_manager/helper/alert.dart';
import 'package:vyaparmandali/app_manager/helper/navigation/navigator.dart';
import 'package:vyaparmandali/app_manager/service/navigation_service.dart';
import 'package:vyaparmandali/authentication/user_repository.dart';
import 'package:vyaparmandali/model/product.dart';

class ProductViewModel extends ChangeNotifier {

  static ProductViewModel of(BuildContext context)=>Provider.of<ProductViewModel>(context,listen: false);

  final ApiCall _api=ApiCall();

  TextEditingController productNameC = TextEditingController();
  TextEditingController weightC = TextEditingController();
  TextEditingController rateC = TextEditingController();



  void initiateAddProduct(){
    _clearFields();
  }



  void _clearFields() {
    productNameC.clear();
    weightC.clear();
    rateC.clear();
  }


  void initiateUpdateProduct(Product thisProduct){
    _clearFields();
    productNameC.text=thisProduct.productName??"";
    weightC.text=thisProduct.weight??"";
    rateC.text=thisProduct.rate??"";
  }



  ApiResponse<ProductData> _productDataResponse=ApiResponse<ProductData>.initial("Initial");
  ApiResponse<ProductData> get productDataResponse=>_productDataResponse;
  set productDataResponse(ApiResponse<ProductData> val){
    _productDataResponse=val;
    notifyListeners();
  }


  Future<void> fetchProducts() async {
    if((_productDataResponse.data?.getData??[]).isEmpty){
      productDataResponse=ApiResponse<ProductData>.loading('Fetching Products');
    }

    try{
      var data=await _api.call(
          url: "get-product-master-data",
          apiCallType: ApiCallType.post(body: {
            "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),
            "id": UserRepository.of(NavigationService.context!).getUser.id.toString()
          }),
          token: true
      );

      if(data['code']==200 && data['status']==true){
        productDataResponse=ApiResponse<ProductData>.completed(
            ProductData.fromJson(data)
        );
      }
      else {
        productDataResponse=ApiResponse<ProductData>.empty("Data Not found");
      }
    }
    catch(e){
      productDataResponse=ApiResponse<ProductData>.error(e.toString());
    }

  }




  Future<void> addProduct({
    String? id
  }) async{
    ProgressDialogue.show(message: id==null? "Adding Product":"Updating Product");
    try {

      Map bod={
        "product_name": productNameC.text,
        "weight": weightC.text,
        "rate": rateC.text,
        "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),

      };
      if(id!=null){
        bod['id']=id;
      }
      var data= await _api.call(
          url: id!=null? "update-product-master-data":"add-product-master-data",
          apiCallType: ApiCallType.post(body: bod),
          token: true
      );
      ProgressDialogue.hide();
      Alert.show(data['message']);
      if(data['code']==200 && data['status']==true){
        MyNavigator.pop();
        fetchProducts();
      }
      else {
      }
    }
    catch (e){
      Alert.show(e.toString());
      ProgressDialogue.hide();
    }
  }



  Future<void> deleteProduct({
    required String id
  }) async{
    ProgressDialogue.show(message: "Deleting Product");
    try {
      var data=await _api.call(
          url: "delete-product-master-data",
          apiCallType: ApiCallType.post(body: {
            "id": id.toString(),
            "user_id": UserRepository.of(NavigationService.context!).getUser.id.toString(),

          }),
          token: true
      );
      ProgressDialogue.hide();
      Alert.show(data['message']);
      if(data['code']==200 && data['status']==true){
        fetchProducts();
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