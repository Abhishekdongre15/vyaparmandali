



import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:vyaparmandali/model/vacchat.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/my_data_grid_row_adapter.dart';


class VacchatDetailDataSource extends DataGridSource {

  static List<String> headers=[
    "      Vacchat Name     ",
    "      Item     ",
    "      Quantity     ",
    "      Freight     ",
    "      Advance     ",
    "      Vasuli     ",
    "      Hundekari Code     ",
    // "      Action     ",
  ];

  VacchatDetailDataSource({required List<VacchatDetails> listOfDocs}) {
    dataGridRows = listOfDocs
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
      DataGridCell<String>(columnName: headers[0], value: (dataGridRow.vacchatName??"").toString()),
      DataGridCell<String>(columnName: headers[1], value: (dataGridRow.item??"").toString()),
      DataGridCell<String>(columnName: headers[2], value: (dataGridRow.qty??"").toString()),
      DataGridCell<String>(columnName: headers[3], value: (dataGridRow.freight??"").toString()),
      DataGridCell<String>(columnName: headers[3], value: (dataGridRow.advance??"").toString()),
      DataGridCell<String>(columnName: headers[3], value: (dataGridRow.vasuli??"").toString()),
      DataGridCell<String>(columnName: headers[3], value: (dataGridRow.hundekariCode??"").toString()),
      // DataGridCell<Widget>(columnName: headers[4], value: actionButton(dataGridRow)),
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




  // Widget actionButton(Vacchat docs){
  //   return Row(
  //     children: [
  //       Expanded(
  //           child:  IconButton(
  //
  //               icon:  Padding(
  //                 padding: const EdgeInsets.all(1.0),
  //                 child: Container(
  //                   decoration: const BoxDecoration(
  //                       color: Colors.white,
  //                       shape: BoxShape.circle
  //                   ),
  //                   child: const Center(
  //                     child: Icon(Icons.edit,
  //                       size: 15,
  //                       color: AppColor.primaryColor,),
  //                   ),
  //                 ),
  //               ),
  //               onPressed: () async{
  //                 CustomBottomSheet.open(
  //                     child:  TitledSheet(title: "Update Vacchat", child: AddVacchatView(
  //                         vacchatToUpdate: docs
  //                     )));
  //               })
  //       ),
  //       const SizedBox(width: 5,),
  //       Expanded(
  //         child: IconButton(
  //             icon:  Padding(
  //               padding: const EdgeInsets.all(1.0),
  //               child: Container(
  //                 decoration: const BoxDecoration(
  //                     color: Colors.white,
  //                     shape: BoxShape.circle
  //                 ),
  //                 child: const Center(
  //                   child: Icon(Icons.delete,
  //                     size: 15,
  //                     color: AppColor.primaryColor,),
  //                 ),
  //               ),
  //             ),
  //             onPressed: () async{
  //               CustomBottomSheet.open(child: FunctionalSheet(
  //                   message: "Confirm to delete vacchat",
  //                   buttonName: "DELETE",
  //                   onPressButton: (){
  //                     VacchatViewModel.of(NavigationService.context!).deleteVacchat(id: (docs.id??"").toString());
  //                   }
  //               ));
  //             }),
  //       ),
  //     ],
  //   );
  // }



}