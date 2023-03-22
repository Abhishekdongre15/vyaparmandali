import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:vyaparmandali/app_manager/api/api_response.dart';
import 'package:vyaparmandali/app_manager/api/manage_response.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/custom_bottom_sheet.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/titled_sheet.dart';
import 'package:vyaparmandali/app_manager/constant/project_constant.dart';
import 'package:vyaparmandali/model/Weight.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/new/weight/add_weight_view.dart';
import 'package:vyaparmandali/view_model/weight_view_model.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/data_sources/weight_data_source.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/my_sf_data_grid.dart';

class WeightMasterView extends StatefulWidget {
  const WeightMasterView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WeightMasterViewState();
  }
}

class WeightMasterViewState extends State<WeightMasterView> {


  @override
  void initState() {
    super.initState();
    get();
  }

  void get() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await WeightViewModel.of(context).fetchWeights();
    });
  }



  @override
  Widget build(BuildContext context) {
    WeightViewModel viewModel=WeightViewModel.of(context);
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Weight Master View"),
      ),
      body: Selector<WeightViewModel,ApiResponse<WeightData>>(
          shouldRebuild: (prev,nex)=>true,
          selector: (buildContext , vm)=>vm.weightDataResponse,
          builder: (context, ApiResponse<WeightData> data,child) {
            List<Weight> weights=data.data?.getAllData??[];
            return Column(
              children: [
                Expanded(
                  child: ManageResponse(
                      response: data,
                      onPressRetry: (){
                        viewModel.fetchWeights();
                      },
                      child: weights.isNotEmpty? MySfDataGrid(
                        headers: WeightDataSource.headers,
                        columnWidthMode: ColumnWidthMode.fill,
                        source: WeightDataSource(listOfDocs: weights),
                      ): ProjectConstant.noDatFoundWidget),
                ),
              ],
            );

          }
      ),
      floatingActionButton: FloatingActionButton(
          heroTag: "add_weight",
          onPressed: () {
            CustomBottomSheet.open(
                child: const TitledSheet(title: "Add Weight", child: AddWeightView()));
          },
          child: const Icon(Icons.add)),
    );
  }
}