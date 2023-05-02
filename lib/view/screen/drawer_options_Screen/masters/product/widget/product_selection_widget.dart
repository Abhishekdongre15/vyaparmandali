
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vyaparmandali/app_manager/api/api_response.dart';
import 'package:vyaparmandali/app_manager/api/manage_response.dart';
import 'package:vyaparmandali/app_manager/component/drop_down.dart';
import 'package:vyaparmandali/app_manager/service/navigation_service.dart';
import 'package:vyaparmandali/app_manager/theme/color_constant.dart';
import 'package:vyaparmandali/model/product.dart';
import 'package:vyaparmandali/view_model/product_view_model.dart';

class ProductSelectionWidget extends StatefulWidget {
  final ValueChanged<Product?> onProductSelected;
  final Product? selectedProduct;


  const ProductSelectionWidget({Key? key, required this.onProductSelected, this.selectedProduct,}) : super(key: key);

  @override
  State<ProductSelectionWidget> createState() => _ProductSelectionWidgetState();
}

class _ProductSelectionWidgetState extends State<ProductSelectionWidget> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }

  get() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      ProductViewModel.of(NavigationService.context!).fetchProducts();
    });
  }


  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Selector<ProductViewModel,ApiResponse<ProductData>>(
              shouldRebuild: (prev,nex)=>true,
              selector: (buildContext , vm)=>vm.productDataResponse,
              builder: (context,ApiResponse<ProductData> data,child) {

                ApiResponse<ProductData> response=data;
                List<Product> products = (response.data??ProductData()).getData??[];

                return  ManageResponse(
                  response: response,
                  axis: Axis.horizontal,
                  child: MyDropDown<Product>(
                    hint: "Select Item",
                    value: widget.selectedProduct,
                    onChanged: (Product? selectedProduct){
                      widget.onProductSelected(selectedProduct);
                    },
                    items: products.map((e) =>
                        DropdownMenuItem<Product>(
                          value: e,
                          child: Text(e.productName??""),)
                    ).toList(),
                  ),
                );
              }
          ),
        ),

        Tooltip(
          message: "Add Product",
          child: IconButton(

              onPressed: (){
                ProductViewModel.onPressAddProduct();
              }, icon: const Icon(Icons.add,color: AppColor.primaryColor,)),
        )

      ],
    );
  }
}