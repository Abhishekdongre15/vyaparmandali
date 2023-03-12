import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:vyaparmandali/app_manager/api/api_response.dart';
import 'package:vyaparmandali/app_manager/api/manage_response.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/custom_bottom_sheet.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/titled_sheet.dart';
import 'package:vyaparmandali/app_manager/constant/project_constant.dart';
import 'package:vyaparmandali/model/hamal.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/codes/hamal/add_hamal_view.dart';
import 'package:vyaparmandali/view_model/hamal_view_model.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/data_sources/hamal_data_source.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/my_sf_data_grid.dart';

class HamalMasterView extends StatefulWidget {
  const HamalMasterView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HamalMasterViewState();
  }
}

class HamalMasterViewState extends State<HamalMasterView> {


  @override
  void initState() {
    super.initState();
    get();
  }

  void get() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await HamalViewModel.of(context).fetchHamal();
    });
  }



  @override
  Widget build(BuildContext context) {
    HamalViewModel viewModel=HamalViewModel.of(context);
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Hamal Master View"),
      ),
      body: Selector<HamalViewModel,ApiResponse<HamalData>>(
          shouldRebuild: (prev,nex)=>true,
          selector: (buildContext , vm)=>vm.hamalDataResponse,
          builder: (context, ApiResponse<HamalData> data,child) {
            List<Hamal> hamals=data.data?.getAllData??[];
            return Column(
              children: [
                Expanded(
                  child: ManageResponse(
                      response: data,
                      onPressRetry: (){
                        viewModel.fetchHamal();
                      },
                      child: hamals.isNotEmpty? MySfDataGrid(
                        headers: HamalDataSource.headers,
                        columnWidthMode: ColumnWidthMode.fill,
                        source: HamalDataSource(listOfDocs: hamals),
                      ): ProjectConstant.noDatFoundWidget),
                ),
              ],
            );

          }
      ),
      floatingActionButton: FloatingActionButton(
          heroTag: "add_hamal",
          onPressed: () {
            CustomBottomSheet.open(
                child: const TitledSheet(title: "Add Hamal", child: AddHamalView()));
          },
          child: const Icon(Icons.add)),
    );
  }
}