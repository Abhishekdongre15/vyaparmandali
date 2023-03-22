





import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:vyaparmandali/app_manager/helper/responsive/responsive.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/my_data_grid_row_adapter.dart';

class MySfDataGrid extends StatelessWidget {

  final List<String> headers;
  final DataGridSource source;
  final ColumnWidthMode? columnWidthMode;

  const MySfDataGrid({super.key, required this.headers, required this.source,  this.columnWidthMode});

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor=Colors.grey.withOpacity(0.05);
    return SfDataGridTheme(
      data: SfDataGridThemeData(headerColor:  backgroundColor,
      ),
      child: IntrinsicHeight(
        child: SfDataGrid(
          onCellTap: (DataGridCellTapDetails details){
          //  print(details.rowColumnIndex.rowIndex.toString());
          },
          onCellDoubleTap: (DataGridCellDoubleTapDetails details){
            showDialog(
              context: context,
              builder: (BuildContext context) =>   CellDialogueBox(
                title: details.column.columnName,
                dataGridCell: source.rows[details.rowColumnIndex.rowIndex-1].getCells()
              [details.rowColumnIndex.columnIndex],
              ),
            );
          },
          // allowColumnsResizing: true,
          // allowSorting: true,
          // allowMultiColumnSorting: true,
          headerGridLinesVisibility: GridLinesVisibility.both,
          source:  source,
          columnWidthMode: columnWidthMode??
              (Responsive.isSmallScreen(context)? ColumnWidthMode.fitByColumnName:ColumnWidthMode.fill),
          gridLinesVisibility: GridLinesVisibility.both,
          columns: List.generate(headers.length, (index) {
            String value=Responsive.isSmallScreen(context)?headers[index]:headers[index].trim();
            return     GridColumn(
                columnName: '$value  ',
                label: Container(
                    alignment: Alignment.center,
                    child:  Text(
                      value,
                      overflow: TextOverflow.ellipsis,
                    )));
          },),
        ),
      ),
    );
  }
}


