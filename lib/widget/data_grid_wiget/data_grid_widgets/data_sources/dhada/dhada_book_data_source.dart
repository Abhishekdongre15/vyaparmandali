import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/custom_bottom_sheet.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/functional_sheet.dart';
import 'package:vyaparmandali/route_name.dart';
import 'package:vyaparmandali/app_manager/service/navigation_service.dart';
import 'package:vyaparmandali/app_manager/theme/color_constant.dart';
import 'package:vyaparmandali/model/dhada_book.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/new/dhada_book/add_dhada_book_view.dart';
import 'package:vyaparmandali/view_model/dhada_book_view_model.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/my_data_grid_row_adapter.dart';

import '../../../../../app_manager/component/bottom_sheet/titled_sheet.dart';

class DhadaBookDataSource extends DataGridSource {

  static List<String> headers=[
    "      Date     ",
    "      Inward Date     ",
    "      Vehical Number     ",
    "      Farmer Name     ",
    "      Farmer Place     ",
    "      Lot Number     ",
    "      Package     ",
    "            Action           ",
  ];

  DhadaBookDataSource({required List<DhadaBook> listOfDocs}) {
    dataGridRows = listOfDocs
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
      DataGridCell<String>(columnName: headers[0], value: dataGridRow.date??""),
      DataGridCell<String>(columnName: headers[1], value: dataGridRow.inwardDate??""),
      DataGridCell<String>(columnName: headers[2], value: dataGridRow.vehicalNo??""),
      DataGridCell<String>(columnName: headers[3], value: dataGridRow.farmerName??""),
      DataGridCell<String>(columnName: headers[4], value: dataGridRow.farmerPlace??""),
      DataGridCell<String>(columnName: headers[5], value: dataGridRow.lotNo??""),
      DataGridCell<String>(columnName: headers[6], value: dataGridRow.package??""),
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




  Widget actionButton(DhadaBook docs){
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

                  NavigationService.context!.push<DhadaBook>(RoutePath.vacchatDetailsView,
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
                      child:  TitledSheet(title: "Update DhadaBook", child: AddDhadaBookView(
                          dhadaBookToUpdate: docs
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
                    message: "Confirm to delete DhadaBook",
                    buttonName: "DELETE",
                    onPressButton: (){
                      DhadaBookViewModel.of(NavigationService.context!).deleteDhadaBook(id: (docs.id??"").toString());
                    }
                ));
              }),
        ),
      ],
    );
  }



}