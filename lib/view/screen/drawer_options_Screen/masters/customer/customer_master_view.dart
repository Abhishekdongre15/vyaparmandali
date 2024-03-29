import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:vyaparmandali/app_manager/api/api_response.dart';
import 'package:vyaparmandali/app_manager/api/manage_response.dart';
import 'package:vyaparmandali/app_manager/constant/project_constant.dart';
import 'package:vyaparmandali/model/customer.dart';
import 'package:vyaparmandali/view_model/customer_view_model.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/my_sf_data_grid.dart';

import '../../../../../../app_manager/helper/responsive/responsive.dart';
import '../../../../../../widget/data_grid_wiget/data_grid_widgets/data_sources/customer_data_source.dart';
class CustomerMasterView extends StatefulWidget {
  const CustomerMasterView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CustomerMasterViewState();
  }
}

class CustomerMasterViewState extends State<CustomerMasterView> {


  @override
  void initState() {
    super.initState();
    get();
  }

  void get() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await CustomerViewModel.of(context).fetchCustomer();
    });
  }



  @override
  Widget build(BuildContext context) {
    CustomerViewModel viewModel=CustomerViewModel.of(context);
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Customer Master View"),
      ),
      body: Selector<CustomerViewModel,ApiResponse<CustomerData>>(
          shouldRebuild: (prev,nex)=>true,
          selector: (buildContext , vm)=>vm.customerDataResponse,
          builder: (context, ApiResponse<CustomerData> data,child) {
            List<Customer> customers=data.data?.getData??[];
            return Column(
              children: [
                Expanded(
                  child: ManageResponse(
                      response: data,
                      onPressRetry: (){
                        viewModel.fetchCustomer();
                      },
                      child: customers.isNotEmpty? MySfDataGrid(
                        headers: CustomerDataSource.headers,
                        columnWidthMode: Responsive.isSmallScreen(context)? ColumnWidthMode.auto:ColumnWidthMode.fill,
                        source: CustomerDataSource(listOfDocs: customers),
                      ): ProjectConstant.noDatFoundWidget),
                ),
              ],
            );

          }
      ),
      floatingActionButton: FloatingActionButton(
          heroTag: "add_hamal",
          onPressed: () {
           CustomerViewModel.onPressAddCustomer();
          },
          child: const Icon(Icons.add)),
    );
  }
}