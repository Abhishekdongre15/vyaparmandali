import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:vyaparmandali/app_manager/api/api_response.dart';
import 'package:vyaparmandali/app_manager/api/manage_response.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/custom_bottom_sheet.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/titled_sheet.dart';
import 'package:vyaparmandali/app_manager/constant/project_constant.dart';
import 'package:vyaparmandali/app_manager/helper/responsive/responsive.dart';
import 'package:vyaparmandali/app_manager/service/navigation_service.dart';
import 'package:vyaparmandali/model/bank.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/new/bank/add_bank_view.dart';
import 'package:vyaparmandali/view_model/bank_view_model.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/data_sources/bank_data_source.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/my_sf_data_grid.dart';

class BankMasterView extends StatefulWidget {
  const BankMasterView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BankMasterViewState();
  }
}

class BankMasterViewState extends State<BankMasterView> {


  @override
  void initState() {
    super.initState();
    get();
  }

  void get() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BankViewModel.of(context).fetchBanks();
    });
  }



  @override
  Widget build(BuildContext context) {
    BankViewModel viewModel=BankViewModel.of(context);
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Bank Master View"),
      ),
      body: Selector<BankViewModel,ApiResponse<BankData>>(
          shouldRebuild: (prev,nex)=>true,
          selector: (buildContext , vm)=>vm.bankDataResponse,
          builder: (context, ApiResponse<BankData> data,child) {
            List<Bank> banks=data.data?.getData??[];
            return Column(
              children: [
                Expanded(
                  child: ManageResponse(
                      response: data,
                      onPressRetry: (){
                        viewModel.fetchBanks();
                      },
                      child: banks.isNotEmpty? MySfDataGrid(
                        headers: BankDataSource.headers,
                        columnWidthMode: Responsive.isSmallScreen(context)? ColumnWidthMode.auto:ColumnWidthMode.fill,
                        source: BankDataSource(listOfDocs: banks),
                      ): ProjectConstant.noDatFoundWidget),
                ),
              ],
            );

          }
      ),
      floatingActionButton: FloatingActionButton(
          heroTag: "add_bank",
          onPressed: () {
            BankViewModel().onPressAddBank();
          },
          child: const Icon(Icons.add)),
    );
  }
}