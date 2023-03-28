import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:vyaparmandali/app_manager/api/api_response.dart';
import 'package:vyaparmandali/app_manager/api/manage_response.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/custom_bottom_sheet.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/titled_sheet.dart';
import 'package:vyaparmandali/app_manager/constant/project_constant.dart';
import 'package:vyaparmandali/model/rojmel.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/new/rojmel/add_rojmel_view.dart';
import 'package:vyaparmandali/view_model/rojmel_view_model.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/data_sources/rojmel_data_source.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/my_sf_data_grid.dart';

import '../../../../../../app_manager/helper/responsive/responsive.dart';

class RojmelMasterView extends StatefulWidget {
  const RojmelMasterView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RojmelMasterViewState();
  }
}

class RojmelMasterViewState extends State<RojmelMasterView> {


  @override
  void initState() {
    super.initState();
    get();
  }

  void get() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await RojmelViewModel.of(context).fetchRojmel();
    });
  }



  @override
  Widget build(BuildContext context) {
    RojmelViewModel viewModel=RojmelViewModel.of(context);
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Rojmel Master View"),
      ),
      body: Selector<RojmelViewModel,ApiResponse<RojmelData>>(
          shouldRebuild: (prev,nex)=>true,
          selector: (buildContext , vm)=>vm.customerDataResponse,
          builder: (context, ApiResponse<RojmelData> data,child) {
            List<Rojmel> customers=data.data?.getData??[];
            return Column(
              children: [
                Expanded(
                  child: ManageResponse(
                      response: data,
                      onPressRetry: (){
                        viewModel.fetchRojmel();
                      },
                      child: customers.isNotEmpty? MySfDataGrid(
                        headers: RojmelDataSource.headers,
                        columnWidthMode: Responsive.isSmallScreen(context)? ColumnWidthMode.auto:ColumnWidthMode.fill,
                        source: RojmelDataSource(listOfDocs: customers),
                      ): ProjectConstant.noDatFoundWidget),
                ),
              ],
            );

          }
      ),
      floatingActionButton: FloatingActionButton(
          heroTag: "add_rojmel",
          onPressed: () {
            CustomBottomSheet.open(
                child: const TitledSheet(title: "Add Rojmel", child: AddRojmelView()));
          },
          child: const Icon(Icons.add)),
    );
  }
}