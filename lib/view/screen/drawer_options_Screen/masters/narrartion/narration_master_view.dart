import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:vyaparmandali/app_manager/api/api_response.dart';
import 'package:vyaparmandali/app_manager/api/manage_response.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/custom_bottom_sheet.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/titled_sheet.dart';
import 'package:vyaparmandali/app_manager/constant/project_constant.dart';
import 'package:vyaparmandali/model/narration.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/narrartion/add_narration_view.dart';
import 'package:vyaparmandali/view_model/narration_view_model.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/data_sources/narration_data_source.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/my_sf_data_grid.dart';

class NarrationMasterView extends StatefulWidget {
  const NarrationMasterView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return NarrationMasterViewState();
  }
}

class NarrationMasterViewState extends State<NarrationMasterView> {


  @override
  void initState() {
    super.initState();
    get();
  }

  void get() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await NarrationViewModel.of(context).fetchNarrations();
    });
  }



  @override
  Widget build(BuildContext context) {
    NarrationViewModel viewModel=NarrationViewModel.of(context);
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Narration Master View"),
      ),
      body: Selector<NarrationViewModel,ApiResponse<NarrationData>>(
          shouldRebuild: (prev,nex)=>true,
          selector: (buildContext , vm)=>vm.narrationDataResponse,
          builder: (context, ApiResponse<NarrationData> data,child) {
            List<Narration> narrations=data.data?.getAllData??[];
            return Column(
              children: [
                Expanded(
                  child: ManageResponse(
                      response: data,
                      onPressRetry: (){
                        viewModel.fetchNarrations();
                      },
                      child: narrations.isNotEmpty? MySfDataGrid(
                        headers: NarrationDataSource.headers,
                        columnWidthMode: ColumnWidthMode.fill,
                        source: NarrationDataSource(listOfDocs: narrations),
                      ): ProjectConstant.noDatFoundWidget),
                ),
              ],
            );

          }
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "add_narration",
          onPressed: () {
          CustomBottomSheet.open(
          child: const TitledSheet(title: "Add Narration", child: AddNarrationView()));
          },
          child: const Icon(Icons.add)),
    );
  }
}