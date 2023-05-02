






import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/custom_bottom_sheet.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/functional_sheet.dart';
import 'package:vyaparmandali/app_manager/service/navigation_service.dart';
import 'package:vyaparmandali/app_manager/theme/color_constant.dart';
import 'package:vyaparmandali/model/hamal.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/hamal/add_hamal_view.dart';
import 'package:vyaparmandali/view_model/hamal_view_model.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/my_data_grid_row_adapter.dart';

import '../../../../app_manager/component/bottom_sheet/titled_sheet.dart';

class HamalDataSource extends DataGridSource {

  static List<String> headers=[
    "      Name     ",
    "      Joining     ",
    "      Action     ",
  ];

  HamalDataSource({required List<Hamal> listOfDocs}) {
    dataGridRows = listOfDocs
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
      DataGridCell<String>(columnName: headers[0], value: (dataGridRow.hamalName??"").toString()),
      DataGridCell<String>(columnName: headers[1], value: dataGridRow.dateOfJoining??""),
      DataGridCell<Widget>(columnName: headers[2], value: actionButton(dataGridRow)),
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




  Widget actionButton(Hamal docs){
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
                      child:  TitledSheet(title: "Update Hamal", child: AddHamalView(
                          hamalToUpdate: docs
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
                    message: "Confirm to delete hamal",
                    buttonName: "DELETE",
                    onPressButton: (){
                      HamalViewModel.of(NavigationService.context!).deleteHamal(id: (docs.id??"").toString());
                    }
                ));
              }),
        ),
      ],
    );
  }



}