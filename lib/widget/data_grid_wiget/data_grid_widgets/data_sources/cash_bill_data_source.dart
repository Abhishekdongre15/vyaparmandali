

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/custom_bottom_sheet.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/functional_sheet.dart';
import 'package:vyaparmandali/app_manager/service/navigation_service.dart';
import 'package:vyaparmandali/app_manager/theme/color_constant.dart';
import 'package:vyaparmandali/model/cash_bill_data.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/cash_bill/cash_bill_agent_view.dart';
import 'package:vyaparmandali/view_model/cash_bill_view_model.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/my_data_grid_row_adapter.dart';

import '../../../../app_manager/component/bottom_sheet/titled_sheet.dart';

class CashBillDataSource extends DataGridSource {

  static List<String> headers=[
    "      Product Name     ",
    "      Weight     ",
    "      Rate     ",
    "      APMC Charges     ",
    "      Commission     ",
    "      Final Price     ",
    "      Action     ",
  ];

  CashBillDataSource({required List<CashBill> listOfDocs}) {
    dataGridRows = listOfDocs
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
      DataGridCell<String>(columnName: headers[0], value: dataGridRow.productName ?? ""),
      DataGridCell<String>(columnName: headers[1], value: dataGridRow.weight??""),
      DataGridCell<String>(columnName: headers[2], value: dataGridRow.rate??""),
      DataGridCell<String>(columnName: headers[3], value: dataGridRow.aPMCCharges??""),
      DataGridCell<String>(columnName: headers[4], value: dataGridRow.commission??""),
      DataGridCell<String>(columnName: headers[5], value: dataGridRow.finalPrice??""),
      DataGridCell<Widget>(columnName: headers[6], value: actionButton(dataGridRow)),
    ]))
        .toList();
  }

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return MyDataGridRowAdapter.getRow(row);
  }




  Widget actionButton(CashBill docs){
    return Row(
      children: [
        Expanded(
            child:  IconButton(

                icon:  Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle
                    ),
                    child: const Center(
                      child: Icon(Icons.edit,
                        size: 15,
                        color: AppColor.primaryColor,),
                    ),
                  ),
                ),
                onPressed: () async{
                  CustomBottomSheet.open(
                      child:  TitledSheet(title: "Update CashBill", child: AddCashBillView(
                          cashBillToUpdate: docs
                      )));
                })
        ),
        const SizedBox(width: 5,),
        Expanded(
          child: IconButton(
              icon:  Padding(
                padding: const EdgeInsets.all(1.0),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                  ),
                  child: const Center(
                    child: Icon(Icons.delete,
                      size: 15,
                      color: AppColor.primaryColor,),
                  ),
                ),
              ),
              onPressed: () async{
                CustomBottomSheet.open(child: FunctionalSheet(
                    message: "Confirm to delete CashBill",
                    buttonName: "DELETE",
                    onPressButton: (){
                      CashBillViewModel.of(NavigationService.context!).deleteCashBill(id: (docs.id??"").toString());
                    }
                ));
              }),
        ),
      ],
    );
  }



}