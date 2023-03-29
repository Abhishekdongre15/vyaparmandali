import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:vyaparmandali/app_manager/constant/project_constant.dart';
import 'package:vyaparmandali/app_manager/helper/responsive/responsive.dart';
import 'package:vyaparmandali/model/dhada_book.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/data_sources/dhada/dhada_book_detail_data_source.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/my_sf_data_grid.dart';

class DhadaBookDetailsView extends StatelessWidget {
  final DhadaBook dhadabook;
  const DhadaBookDetailsView({Key? key, required this.dhadabook}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DhadabookDetails> details=dhadabook.dhadabookDetails??[];
    return Scaffold(
      appBar: AppBar(
        title:   Text(dhadabook.vehicalNo.toString()),
      ),
      body: details.isNotEmpty? SizedBox(
        height: double.infinity,
        child: MySfDataGrid(
          headers: DhadaBookDetailsDataSource.headers,
          columnWidthMode: Responsive.isSmallScreen(context)? ColumnWidthMode.auto:ColumnWidthMode.fill,
          source: DhadaBookDetailsDataSource(listOfDocs: details),
        ),
      ): ProjectConstant.noDatFoundWidget,
    );
  }
}
