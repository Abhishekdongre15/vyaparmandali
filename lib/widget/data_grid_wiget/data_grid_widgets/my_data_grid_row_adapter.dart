








import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:vyaparmandali/app_manager/helper/responsive/responsive.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/cell_widgets/grid_text.dart';
class MyDataGridRowAdapter{


  static DataGridRowAdapter getRow(DataGridRow row) {

    return DataGridRowAdapter(
    //  color: backgroundColor,
        cells: row.getCells().map<Widget>((dataGridCell) {
          return GetCellAsWidget(dataGridCell: dataGridCell,);
        }).toList());
  }

}



class GetCellAsWidget extends StatelessWidget {

  final DataGridCell dataGridCell;
  final bool manageOverFlow;
  final bool manageAlignment;

  const GetCellAsWidget({super.key,
    required this.dataGridCell,
    this.manageOverFlow=true,
    this.manageAlignment=true,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor=Colors.grey.withOpacity(0.005);
    return Container(
        color: backgroundColor,
        alignment: manageAlignment?Alignment.center:null,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ((dataGridCell.value is String) || (dataGridCell.value is double) || (dataGridCell.value is DateTime))?
        GridText(text: dataGridCell.value.toString(),
        manageOverFlow: manageOverFlow,)
            :(dataGridCell.value is Widget)?dataGridCell.value: Container());
  }
}




class CellDialogueBox extends StatelessWidget {
  final String title;
  final DataGridCell dataGridCell;

  const CellDialogueBox({super.key,
    required this.title,
    required this.dataGridCell,
  });
  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
        alignment: Alignment.center,
      title: Text(title),
      content: Container(
        constraints:  BoxConstraints(
          maxWidth: Responsive.smallScreenWidth
        ),
        child: GetCellAsWidget(
          dataGridCell: dataGridCell,
          manageOverFlow: false,
          manageAlignment: false,
        ),
      ),

    );
  }
}


