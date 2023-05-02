

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/custom_bottom_sheet.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/functional_sheet.dart';
import 'package:vyaparmandali/app_manager/service/navigation_service.dart';
import 'package:vyaparmandali/app_manager/theme/color_constant.dart';
import 'package:vyaparmandali/model/farmer.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/farmer/add_farmer_view.dart';
import 'package:vyaparmandali/view_model/farmer_view_model.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/my_data_grid_row_adapter.dart';

import '../../../../app_manager/component/bottom_sheet/titled_sheet.dart';

class FarmerDataSource extends DataGridSource {

  static List<String> headers=[
    "      Farmer Name     ",
    "      Address     ",
    "      City     ",
    "      Phone     ",
    "      Action     ",
  ];

  FarmerDataSource({required List<Farmer> listOfDocs}) {
    dataGridRows = listOfDocs
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
      DataGridCell<String>(columnName: headers[0], value: ("${dataGridRow.firstName??""} ${dataGridRow.middleName??""} ${dataGridRow.lastName??""}").toString()),
      DataGridCell<String>(columnName: headers[1], value: dataGridRow.address??""),
      DataGridCell<String>(columnName: headers[2], value: dataGridRow.city??""),
      DataGridCell<String>(columnName: headers[3], value: dataGridRow.phoneNumber??""),
      DataGridCell<Widget>(columnName: headers[4], value: actionButton(dataGridRow)),
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




  Widget actionButton(Farmer docs){
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
                      child:  TitledSheet(title: "Update Farmer", child: AddFarmerView(
                          farmerToUpdate: docs
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
                    message: "Confirm to delete farmer",
                    buttonName: "DELETE",
                    onPressButton: (){
                      FarmerViewModel.of(NavigationService.context!).deleteFarmer(id: (docs.id??"").toString());
                    }
                ));
              }),
        ),
      ],
    );
  }



}