import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:vyaparmandali/model/dhada_book.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/my_data_grid_row_adapter.dart';

class DhadaBookDetailsDataSource extends DataGridSource {

  static List<String> headers=[
    "      Item Code     ",
    "      Name     ",
    "      Package     ",
    "      Gross     ",
    "      PB     ",
    "      Average     ",
    "      Rate     ",
    "      Amount     ",
  ];

  DhadaBookDetailsDataSource({required List<DhadabookDetails> listOfDocs}) {
    dataGridRows = listOfDocs
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
      DataGridCell<String>(columnName: headers[0], value: (dataGridRow.itemCode??"").toString()),
      DataGridCell<String>(columnName: headers[1], value: (dataGridRow.name??"").toString()),
      DataGridCell<String>(columnName: headers[2], value: (dataGridRow.package??"").toString()),
      DataGridCell<String>(columnName: headers[3], value: (dataGridRow.gross??"").toString()),
      DataGridCell<String>(columnName: headers[4], value: (dataGridRow.pB??"").toString()),
      DataGridCell<String>(columnName: headers[5], value: (dataGridRow.average??"").toString()),
      DataGridCell<String>(columnName: headers[6], value: (dataGridRow.rate??"").toString()),
      DataGridCell<String>(columnName: headers[7], value: (dataGridRow.amount??"").toString()),
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



}