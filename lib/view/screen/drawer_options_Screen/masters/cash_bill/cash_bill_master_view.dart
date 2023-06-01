import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:vyaparmandali/app_manager/api/api_response.dart';
import 'package:vyaparmandali/app_manager/api/manage_response.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/custom_bottom_sheet.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/titled_sheet.dart';
import 'package:vyaparmandali/app_manager/constant/project_constant.dart';
import 'package:vyaparmandali/app_manager/helper/responsive/responsive.dart';
import 'package:vyaparmandali/model/cash_bill_data.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/cash_bill/cash_bill_agent_view.dart';
import 'package:vyaparmandali/view_model/cash_bill_view_model.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/data_sources/cash_bill_data_source.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/my_sf_data_grid.dart';

class CashBillMasterView extends StatefulWidget {
  const CashBillMasterView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CashBillMasterViewState();
  }
}

class CashBillMasterViewState extends State<CashBillMasterView> {


  @override
  void initState() {
    super.initState();
    get();
  }

  void get() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await CashBillViewModel.of(context).fetchCashBills();
    });
  }



  @override
  Widget build(BuildContext context) {
    CashBillViewModel viewModel=CashBillViewModel.of(context);
    return Scaffold(
      appBar: AppBar(
        title:  const Text("CashBill Master View"),
      ),
      body: Selector<CashBillViewModel,ApiResponse<CashBillData>>(
          shouldRebuild: (prev,nex)=>true,
          selector: (buildContext , vm)=>vm.cashBillDataResponse,
          builder: (context, ApiResponse<CashBillData> data,child) {
            List<CashBill> cashBills=data.data?.fetchCashBillData??[];
            return Column(
              children: [
                Expanded(
                  child: ManageResponse(
                      response: data,
                      onPressRetry: (){
                        viewModel.fetchCashBills();
                      },
                      child: cashBills.isNotEmpty? MySfDataGrid(
                        headers: CashBillDataSource.headers,
                        columnWidthMode: Responsive.isSmallScreen(context)? ColumnWidthMode.auto:ColumnWidthMode.fill,
                        source: CashBillDataSource(listOfDocs: cashBills),
                      ): ProjectConstant.noDatFoundWidget),
                ),
              ],
            );

          }
      ),
      floatingActionButton: FloatingActionButton(
          heroTag: "add_CashBill",
          onPressed: () {
            CustomBottomSheet.open(
                child: const TitledSheet(title: "Add CashBill", child: AddCashBillView()));
          },
          child: const Icon(Icons.add)),
    );
  }
}