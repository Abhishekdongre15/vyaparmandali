import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/custom_bottom_sheet.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/functional_sheet.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/titled_sheet.dart';
import 'package:vyaparmandali/app_manager/service/navigation_service.dart';
import 'package:vyaparmandali/app_manager/theme/color_constant.dart';
import 'package:vyaparmandali/model/rojmel.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/rojmel/add_rojmel_view.dart';
import 'package:vyaparmandali/view_model/rojmel_view_model.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/my_data_grid_row_adapter.dart';


class RojmelDataSource extends DataGridSource {
  static List<String> headers = [
    "      Type     ",
    "      Date     ",
    "      Transaction Type     ",
    "      Bank Name     ",
    "      Total Balance     ",
    "      Patti Number     ",
    "      Account Name     ",
    "      Account Code     ",
    "      Amount     ",
    "      Cheque No     ",
    "      Description     ",
    "      Action     ",
  ];

  RojmelDataSource({required List<Rojmel> listOfDocs}) {
    dataGridRows = listOfDocs
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: headers[0],
                  value: (dataGridRow.type ?? "").toString()),
              DataGridCell<String>(
                  columnName: headers[1], value: dataGridRow.date ?? ""),
              DataGridCell<String>(
                  columnName: headers[2],
                  value: dataGridRow.transactionType ?? ""),
              DataGridCell<String>(
                  columnName: headers[3], value: dataGridRow.bankName ?? ""),
              DataGridCell<String>(
                  columnName: headers[4],
                  value: dataGridRow.totalBalance ?? ""),
              DataGridCell<String>(
                  columnName: headers[5], value: dataGridRow.pattiNumber ?? ""),
              DataGridCell<String>(
                  columnName: headers[6], value: dataGridRow.accountName ?? ""),
              DataGridCell<String>(
                  columnName: headers[7], value: dataGridRow.accountCode ?? ""),
              DataGridCell<String>(
                  columnName: headers[8], value: dataGridRow.amount ?? ""),
              DataGridCell<String>(
                  columnName: headers[9], value: dataGridRow.cheqNo ?? ""),
              DataGridCell<String>(
                  columnName: headers[10],
                  value: dataGridRow.description ?? ""),
              DataGridCell<Widget>(
                  columnName: headers[11], value: actionButton(dataGridRow)),
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

  Widget actionButton(Rojmel docs) {
    return Row(
      children: [
        Expanded(
            child: IconButton(
                icon: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: const Center(
                      child: Icon(
                        Icons.edit,
                        size: 15,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ),
                ),
                onPressed: () async {
                  CustomBottomSheet.open(
                      child: TitledSheet(
                          title: "Update Rojmel",
                          child: AddRojmelView(rojmelToUpdate: docs)));
                })),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: IconButton(
              icon: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: const Center(
                    child: Icon(
                      Icons.delete,
                      size: 15,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
              ),
              onPressed: () async {
                CustomBottomSheet.open(
                    child: FunctionalSheet(
                        message: "Confirm to delete rojmel",
                        buttonName: "DELETE",
                        onPressButton: () {
                          RojmelViewModel.of(NavigationService.context!)
                              .deleteRojmel(id: (docs.id ?? "").toString());
                        }));
              }),
        ),
      ],
    );
  }
}
