import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:vyaparmandali/app_manager/constant/project_constant.dart';
import 'package:vyaparmandali/app_manager/helper/responsive/responsive.dart';
import 'package:vyaparmandali/model/vacchat.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/data_sources/vacchat/vacchat_detail_data_source.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/my_sf_data_grid.dart';

class VacchatDetailsView extends StatelessWidget {
  final Vacchat vacchat;
  const VacchatDetailsView({Key? key, required this.vacchat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<VacchatDetails> details=vacchat.vacchatDetails??[];
    return Scaffold(
      appBar: AppBar(
        title:   Text(vacchat.vehicalNo.toString()),
      ),
      body: details.isNotEmpty? SizedBox(
        height: double.infinity,
        child: MySfDataGrid(
          headers: VacchatDetailDataSource.headers,
          columnWidthMode: Responsive.isSmallScreen(context)? ColumnWidthMode.auto:ColumnWidthMode.fill,
          source: VacchatDetailDataSource(listOfDocs: details),
        ),
      ): ProjectConstant.noDatFoundWidget,
    );
  }
}
