import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:vyaparmandali/app_manager/api/api_response.dart';
import 'package:vyaparmandali/app_manager/api/manage_response.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/custom_bottom_sheet.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/titled_sheet.dart';
import 'package:vyaparmandali/app_manager/constant/project_constant.dart';
import 'package:vyaparmandali/app_manager/helper/responsive/responsive.dart';
import 'package:vyaparmandali/model/cash_book_item.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/cash_book_item/add_cash_book_item_view.dart';
import 'package:vyaparmandali/view_model/cash_book_item_view_model.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/data_sources/cash_book_item_data_source.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/my_sf_data_grid.dart';

class CashBookItemMasterView extends StatefulWidget {
  const CashBookItemMasterView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CashBookItemMasterViewState();
  }
}

class CashBookItemMasterViewState extends State<CashBookItemMasterView> {


  @override
  void initState() {
    super.initState();
    get();
  }

  void get() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await CashBookItemViewModel.of(context).fetchCashBookItem();
    });
  }



  @override
  Widget build(BuildContext context) {
    CashBookItemViewModel viewModel=CashBookItemViewModel.of(context);
    return Scaffold(
      appBar: AppBar(
        title:  const Text("CashBookItem Master View"),
      ),
      body: Selector<CashBookItemViewModel,ApiResponse<CashBookItemData>>(
          shouldRebuild: (prev,nex)=>true,
          selector: (buildContext , vm)=>vm.cashBookItemDataResponse,
          builder: (context, ApiResponse<CashBookItemData> data,child) {
            List<CashBookItem> cashBookItems=data.data?.getData??[];
            return Column(
              children: [
                Expanded(
                  child: ManageResponse(
                      response: data,
                      onPressRetry: (){
                        viewModel.fetchCashBookItem();
                      },
                      child: cashBookItems.isNotEmpty? MySfDataGrid(
                        headers: CashBookItemDataSource.headers,
                        columnWidthMode: Responsive.isSmallScreen(context)? ColumnWidthMode.auto:ColumnWidthMode.fill,
                        source: CashBookItemDataSource(listOfDocs: cashBookItems),
                      ): ProjectConstant.noDatFoundWidget),
                ),
              ],
            );

          }
      ),
      floatingActionButton: FloatingActionButton(
          heroTag: "add_CashBookItem",
          onPressed: () {
            CustomBottomSheet.open(
                child: const TitledSheet(title: "Add CashBookItem", child: AddCashBookItemView()));
          },
          child: const Icon(Icons.add)),
    );
  }
}