import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/custom_bottom_sheet.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/functional_sheet.dart';
import 'package:vyaparmandali/app_manager/service/navigation_service.dart';
import 'package:vyaparmandali/app_manager/theme/color_constant.dart';
import 'package:vyaparmandali/model/bank.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/bank/add_bank_view.dart';
import 'package:vyaparmandali/view_model/bank_view_model.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/my_data_grid_row_adapter.dart';

import '../../../../app_manager/component/bottom_sheet/titled_sheet.dart';

class BankDataSource extends DataGridSource {

  static List<String> headers=[
    "      Bank Name     ",
    "      Branch Code     ",
    "      IFSC     ",
    "      Action     ",
  ];

  BankDataSource({required List<Bank> listOfDocs}) {
    dataGridRows = listOfDocs
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
      DataGridCell<String>(columnName: headers[0], value: dataGridRow.bankName??""),
      DataGridCell<String>(columnName: headers[1], value: dataGridRow.branchCode??""),
      DataGridCell<String>(columnName: headers[2], value: dataGridRow.ifscCode??""),
      DataGridCell<Widget>(columnName: headers[3], value: actionButton(dataGridRow)),
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




  Widget actionButton(Bank docs){
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
                      child:  TitledSheet(title: "Update Bank", child: AddBankView(
                          bankToUpdate: docs
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
                    message: "Confirm to delete bank",
                    buttonName: "DELETE",
                    onPressButton: (){
                      BankViewModel.of(NavigationService.context!).deleteBank(id: (docs.id??"").toString());
                    }
                ));
              }),
        ),
      ],
    );
  }



}