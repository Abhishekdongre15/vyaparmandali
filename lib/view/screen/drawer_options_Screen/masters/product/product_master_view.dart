import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:vyaparmandali/app_manager/api/api_response.dart';
import 'package:vyaparmandali/app_manager/api/manage_response.dart';
import 'package:vyaparmandali/app_manager/constant/project_constant.dart';
import 'package:vyaparmandali/app_manager/helper/responsive/responsive.dart';
import 'package:vyaparmandali/model/product.dart';
import 'package:vyaparmandali/view_model/product_view_model.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/data_sources/product_data_source.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/my_sf_data_grid.dart';

class ProductMasterView extends StatefulWidget {
  const ProductMasterView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ProductMasterViewState();
  }
}

class ProductMasterViewState extends State<ProductMasterView> {


  @override
  void initState() {
    super.initState();
    get();
  }

  void get() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await ProductViewModel.of(context).fetchProducts();
    });
  }



  @override
  Widget build(BuildContext context) {
    ProductViewModel viewModel=ProductViewModel.of(context);
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Product Master View"),
      ),
      body: Selector<ProductViewModel,ApiResponse<ProductData>>(
          shouldRebuild: (prev,nex)=>true,
          selector: (buildContext , vm)=>vm.productDataResponse,
          builder: (context, ApiResponse<ProductData> data,child) {
            List<Product> products=data.data?.getData??[];
            return Column(
              children: [
                Expanded(
                  child: ManageResponse(
                      response: data,
                      onPressRetry: (){
                        viewModel.fetchProducts();
                      },
                      child: products.isNotEmpty? MySfDataGrid(
                        headers: ProductDataSource.headers,
                        columnWidthMode: Responsive.isSmallScreen(context)? ColumnWidthMode.auto:ColumnWidthMode.fill,
                        source: ProductDataSource(listOfDocs: products),
                      ): ProjectConstant.noDatFoundWidget),
                ),
              ],
            );

          }
      ),
      floatingActionButton: FloatingActionButton(
          heroTag: "add_product",
          onPressed: () {
            ProductViewModel.onPressAddProduct();
          },
          child: const Icon(Icons.add)),
    );
  }
}