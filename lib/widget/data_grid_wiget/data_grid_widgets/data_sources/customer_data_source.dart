import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/custom_bottom_sheet.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/functional_sheet.dart';
import 'package:vyaparmandali/app_manager/service/navigation_service.dart';
import 'package:vyaparmandali/app_manager/theme/color_constant.dart';
import 'package:vyaparmandali/model/customer.dart';
import 'package:vyaparmandali/view_model/customer_view_model.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/my_data_grid_row_adapter.dart';

import '../../../../app_manager/component/bottom_sheet/titled_sheet.dart';
import '../../../../view/screen/drawer_options_Screen/masters/new/customer/add_customer_view.dart';

class CustomerDataSource extends DataGridSource {
  static List<String> headers = [
    "      First Name     ",
    "      Middle Name     ",
    "      Last Name     ",
    "      Address     ",
    "      City     ",
    "      District     ",
    "      State     ",
    "      Email     ",
    "      Contact No     ",
    "      Action     ",
  ];

  CustomerDataSource({required List<Customer> listOfDocs}) {
    dataGridRows = listOfDocs
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: headers[0],
                  value: (dataGridRow.firstName ?? "").toString()),
              DataGridCell<String>(
                  columnName: headers[1], value: dataGridRow.middleName ?? ""),
              DataGridCell<String>(
                  columnName: headers[2], value: dataGridRow.lastName ?? ""),
              DataGridCell<String>(
                  columnName: headers[3], value: dataGridRow.address ?? ""),
              DataGridCell<String>(
                  columnName: headers[4], value: dataGridRow.city ?? ""),
              DataGridCell<String>(
                  columnName: headers[5], value: dataGridRow.district ?? ""),
              DataGridCell<String>(
                  columnName: headers[6], value: dataGridRow.state ?? ""),
              DataGridCell<String>(
                  columnName: headers[7], value: dataGridRow.email ?? ""),
              DataGridCell<String>(
                  columnName: headers[8], value: dataGridRow.contactNo ?? ""),
              DataGridCell<Widget>(
                  columnName: headers[9], value: actionButton(dataGridRow)),
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

  Widget actionButton(Customer docs) {
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
                          title: "Update Customer",
                          child: AddCustomerView(customerToUpdate: docs)));
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
                        message: "Confirm to delete hamal",
                        buttonName: "DELETE",
                        onPressButton: () {
                          CustomerViewModel.of(NavigationService.context!)
                              .deleteCustomer(id: (docs.id ?? "").toString());
                        }));
              }),
        ),
      ],
    );
  }
}
