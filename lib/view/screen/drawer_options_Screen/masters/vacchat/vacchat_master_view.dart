import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:vyaparmandali/app_manager/api/api_response.dart';
import 'package:vyaparmandali/app_manager/api/manage_response.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/custom_bottom_sheet.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/titled_sheet.dart';
import 'package:vyaparmandali/app_manager/constant/project_constant.dart';
import 'package:vyaparmandali/app_manager/helper/responsive/responsive.dart';
import 'package:vyaparmandali/model/vacchat.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/vacchat/add_vacchat_view.dart';
import 'package:vyaparmandali/view_model/vacchat_view_model.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/data_sources/vacchat/vacchat_data_source.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/my_sf_data_grid.dart';

class VacchatMasterView extends StatefulWidget {
  const VacchatMasterView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return VacchatMasterViewState();
  }
}

class VacchatMasterViewState extends State<VacchatMasterView> {


  @override
  void initState() {
    super.initState();
    get();
  }

  void get() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await VacchatViewModel.of(context).fetchVacchat();
    });
  }



  @override
  Widget build(BuildContext context) {
    VacchatViewModel viewModel=VacchatViewModel.of(context);
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Vacchat Master View"),
      ),
      body: Selector<VacchatViewModel,ApiResponse<VacchatData>>(
          shouldRebuild: (prev,nex)=>true,
          selector: (buildContext , vm)=>vm.vacchatDataResponse,
          builder: (context, ApiResponse<VacchatData> data,child) {
            List<Vacchat> vacchats=data.data?.getData??[];
            return Column(
              children: [
                Expanded(
                  child: ManageResponse(
                      response: data,
                      onPressRetry: (){
                        viewModel.fetchVacchat();
                      },
                      child: vacchats.isNotEmpty? MySfDataGrid(
                        headers: VacchatDataSource.headers,
                        columnWidthMode: Responsive.isSmallScreen(context)? ColumnWidthMode.auto:ColumnWidthMode.fill,
                        source: VacchatDataSource(listOfDocs: vacchats),
                      ): ProjectConstant.noDatFoundWidget),
                ),
              ],
            );

          }
      ),
      floatingActionButton: FloatingActionButton(
          heroTag: "add_vacchat",
          onPressed: () {
            CustomBottomSheet.open(
                child: const TitledSheet(title: "Add Vacchat", child: AddVacchatView()));
          },
          child: const Icon(Icons.add)),
    );
  }
}