import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:vyaparmandali/app_manager/api/api_response.dart';
import 'package:vyaparmandali/app_manager/api/manage_response.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/custom_bottom_sheet.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/titled_sheet.dart';
import 'package:vyaparmandali/app_manager/constant/project_constant.dart';
import 'package:vyaparmandali/app_manager/helper/responsive/responsive.dart';
import 'package:vyaparmandali/model/farmer.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/new/farmer/add_farmer_view.dart';
import 'package:vyaparmandali/view_model/farmer_view_model.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/data_sources/farmer_data_source.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/my_sf_data_grid.dart';

class FarmerMasterView extends StatefulWidget {
  const FarmerMasterView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FarmerMasterViewState();
  }
}

class FarmerMasterViewState extends State<FarmerMasterView> {


  @override
  void initState() {
    super.initState();
    get();
  }

  void get() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await FarmerViewModel.of(context).fetchFarmers();
    });
  }



  @override
  Widget build(BuildContext context) {
    FarmerViewModel viewModel=FarmerViewModel.of(context);
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Farmer Master View"),
      ),
      body: Selector<FarmerViewModel,ApiResponse<FarmerData>>(
          shouldRebuild: (prev,nex)=>true,
          selector: (buildContext , vm)=>vm.farmerDataResponse,
          builder: (context, ApiResponse<FarmerData> data,child) {
            List<Farmer> farmers=data.data?.getData??[];
            return Column(
              children: [
                Expanded(
                  child: ManageResponse(
                      response: data,
                      onPressRetry: (){
                        viewModel.fetchFarmers();
                      },
                      child: farmers.isNotEmpty? MySfDataGrid(
                        headers: FarmerDataSource.headers,
                        columnWidthMode: Responsive.isSmallScreen(context)? ColumnWidthMode.auto:ColumnWidthMode.fill,
                        source: FarmerDataSource(listOfDocs: farmers),
                      ): ProjectConstant.noDatFoundWidget),
                ),
              ],
            );

          }
      ),
      floatingActionButton: FloatingActionButton(
          heroTag: "add_farmer",
          onPressed: () {
            CustomBottomSheet.open(
                child: const TitledSheet(title: "Add Farmer", child: AddFarmerView()));
          },
          child: const Icon(Icons.add)),
    );
  }
}