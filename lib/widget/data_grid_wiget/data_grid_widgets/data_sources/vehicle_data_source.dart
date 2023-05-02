import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/custom_bottom_sheet.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/functional_sheet.dart';
import 'package:vyaparmandali/app_manager/service/navigation_service.dart';
import 'package:vyaparmandali/app_manager/theme/color_constant.dart';
import 'package:vyaparmandali/model/vehicle.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/vehicle/add_vehicle_view.dart';
import 'package:vyaparmandali/view_model/vehicle_view_model.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/my_data_grid_row_adapter.dart';

import '../../../../app_manager/component/bottom_sheet/titled_sheet.dart';

class VehicleDataSource extends DataGridSource {

  static List<String> headers=[
    "      Owner Name     ",
    "      Vehicle Name     ",
    "      Vehicle Number     ",
    "      Action     ",
  ];

  VehicleDataSource({required List<Vehicle> listOfDocs}) {
    dataGridRows = listOfDocs
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
      DataGridCell<String>(columnName: headers[0], value: (dataGridRow.ownerName??"").toString()),
      DataGridCell<String>(columnName: headers[1], value: (dataGridRow.vehicalName??"").toString()),
      DataGridCell<String>(columnName: headers[2], value: (dataGridRow.vehicalNumber??"").toString()),
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




  Widget actionButton(Vehicle docs){
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
                      child:  TitledSheet(title: "Update Vehicle", child: AddVehicleView(
                          vehicleToUpdate: docs
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
                    message: "Confirm to delete vehicle",
                    buttonName: "DELETE",
                    onPressButton: (){
                      VehicleViewModel.of(NavigationService.context!).deleteVehicle(id: (docs.id??"").toString());
                    }
                ));
              }),
        ),
      ],
    );
  }



}