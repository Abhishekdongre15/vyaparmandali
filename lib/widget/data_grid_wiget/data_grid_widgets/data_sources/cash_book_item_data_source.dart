import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/custom_bottom_sheet.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/functional_sheet.dart';
import 'package:vyaparmandali/app_manager/service/navigation_service.dart';
import 'package:vyaparmandali/app_manager/theme/color_constant.dart';
import 'package:vyaparmandali/model/cash_book_item.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/new/cash_book_item/add_cash_book_item_view.dart';
import 'package:vyaparmandali/view_model/cash_book_item_view_model.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/my_data_grid_row_adapter.dart';

import '../../../../app_manager/component/bottom_sheet/titled_sheet.dart';

class CashBookItemDataSource extends DataGridSource {

  static List<String> headers=[
    "      Code     ",
    "      Date     ",
    "      Serial Number     ",
    "      Bank Name     ",
    "      Total Line Item     ",
    "      Galla Amount     ",
    "      Udhari Amount     ",
    "      Action     ",
  ];

  CashBookItemDataSource({required List<CashBookItem> listOfDocs}) {
    dataGridRows = listOfDocs
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
      DataGridCell<String>(columnName: headers[0], value: dataGridRow.code??""),
      DataGridCell<String>(columnName: headers[1], value: dataGridRow.date??""),
      DataGridCell<String>(columnName: headers[2], value: dataGridRow.srNo??""),
      DataGridCell<String>(columnName: headers[3], value: dataGridRow.bankName??""),
      DataGridCell<String>(columnName: headers[4], value: dataGridRow.totalItem??""),
      DataGridCell<String>(columnName: headers[5], value: dataGridRow.gallaAmt??""),
      DataGridCell<String>(columnName: headers[6], value: dataGridRow.udhariAmt??""),
      DataGridCell<Widget>(columnName: headers[7], value: actionButton(dataGridRow)),
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




  Widget actionButton(CashBookItem docs){
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
                      child:  TitledSheet(title: "Update CashBookItem", child: AddCashBookItemView(
                          cashBookItemToUpdate: docs
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
                    message: "Confirm to delete CashBookItem",
                    buttonName: "DELETE",
                    onPressButton: (){
                      CashBookItemViewModel.of(NavigationService.context!).deleteCashBookItem(id: (docs.id??"").toString());
                    }
                ));
              }),
        ),
      ],
    );
  }



}