






import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/custom_bottom_sheet.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/functional_sheet.dart';
import 'package:vyaparmandali/route_name.dart';
import 'package:vyaparmandali/app_manager/service/navigation_service.dart';
import 'package:vyaparmandali/app_manager/theme/color_constant.dart';
import 'package:vyaparmandali/model/vacchat.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/vacchat/add_vacchat_view.dart';
import 'package:vyaparmandali/view_model/vacchat_view_model.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/my_data_grid_row_adapter.dart';

import '../../../../../app_manager/component/bottom_sheet/titled_sheet.dart';

class VacchatDataSource extends DataGridSource {

  static List<String> headers=[
    "      Date     ",
    "      Vehical No     ",
    "      Total Package     ",
    "      Vasuli Dar     ",
    "            Action           ",
  ];

  VacchatDataSource({required List<Vacchat> listOfDocs}) {
    dataGridRows = listOfDocs
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
      DataGridCell<String>(columnName: headers[0], value: (dataGridRow.date??"").toString()),
      DataGridCell<String>(columnName: headers[1], value: dataGridRow.vehicalNo??""),
      DataGridCell<String>(columnName: headers[2], value: dataGridRow.totalPackage??""),
      DataGridCell<String>(columnName: headers[3], value: dataGridRow.vasuliDar??""),
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




  Widget actionButton(Vacchat docs){
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
                      child: Icon(Icons.remove_red_eye_rounded,
                        size: 15,
                        color: AppColor.primaryColor,),
                    ),
                  ),
                ),
                onPressed: () async{
                  NavigationService.context!.push<Vacchat>(RoutePath.vacchatDetailsView,
                  extra: docs);
                })
        ),
        const SizedBox(width: 5,),
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
                      child:  TitledSheet(title: "Update Vacchat", child: AddVacchatView(
                          vacchatToUpdate: docs
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
                    message: "Confirm to delete vacchat",
                    buttonName: "DELETE",
                    onPressButton: (){
                      VacchatViewModel.of(NavigationService.context!).deleteVacchat(id: (docs.id??"").toString());
                    }
                ));
              }),
        ),
      ],
    );
  }



}