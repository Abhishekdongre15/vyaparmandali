import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:vyaparmandali/app_manager/api/api_response.dart';
import 'package:vyaparmandali/app_manager/api/manage_response.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/custom_bottom_sheet.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/titled_sheet.dart';
import 'package:vyaparmandali/app_manager/constant/project_constant.dart';
import 'package:vyaparmandali/app_manager/helper/responsive/responsive.dart';
import 'package:vyaparmandali/model/vehicle.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/new/vehicle/add_vehicle_view.dart';
import 'package:vyaparmandali/view_model/vehicle_view_model.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/data_sources/vehicle_data_source.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/my_sf_data_grid.dart';

class VehicleMasterView extends StatefulWidget {
  const VehicleMasterView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return VehicleMasterViewState();
  }
}

class VehicleMasterViewState extends State<VehicleMasterView> {


  @override
  void initState() {
    super.initState();
    get();
  }

  void get() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await VehicleViewModel.of(context).fetchVehicles();
    });
  }



  @override
  Widget build(BuildContext context) {
    VehicleViewModel viewModel=VehicleViewModel.of(context);
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Vehicle Master View"),
      ),
      body: Selector<VehicleViewModel,ApiResponse<VehicleData>>(
          shouldRebuild: (prev,nex)=>true,
          selector: (buildContext , vm)=>vm.vehicleDataResponse,
          builder: (context, ApiResponse<VehicleData> data,child) {
            List<Vehicle> vehicles=data.data?.getData??[];
            return Column(
              children: [
                Expanded(
                  child: ManageResponse(
                      response: data,
                      onPressRetry: (){
                        viewModel.fetchVehicles();
                      },
                      child: vehicles.isNotEmpty? MySfDataGrid(
                        headers: VehicleDataSource.headers,
                        columnWidthMode: Responsive.isSmallScreen(context)? ColumnWidthMode.auto:ColumnWidthMode.fill,
                        source: VehicleDataSource(listOfDocs: vehicles),
                      ): ProjectConstant.noDatFoundWidget),
                ),
              ],
            );

          }
      ),
      floatingActionButton: FloatingActionButton(
          heroTag: "add_vehicle",
          onPressed: () {
            CustomBottomSheet.open(
                child: const TitledSheet(title: "Add Vehicle", child: AddVehicleView()));
          },
          child: const Icon(Icons.add)),
    );
  }
}