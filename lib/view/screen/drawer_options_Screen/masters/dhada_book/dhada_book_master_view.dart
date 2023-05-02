import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:vyaparmandali/app_manager/api/api_response.dart';
import 'package:vyaparmandali/app_manager/api/manage_response.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/custom_bottom_sheet.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/titled_sheet.dart';
import 'package:vyaparmandali/app_manager/constant/project_constant.dart';
import 'package:vyaparmandali/app_manager/helper/responsive/responsive.dart';
import 'package:vyaparmandali/model/dhada_book.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/dhada_book/add_dhada_book_view.dart';
import 'package:vyaparmandali/view_model/dhada_book_view_model.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/data_sources/dhada/dhada_book_data_source.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/my_sf_data_grid.dart';

class DhadaBookMasterView extends StatefulWidget {
  const DhadaBookMasterView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DhadaBookMasterViewState();
  }
}

class DhadaBookMasterViewState extends State<DhadaBookMasterView> {


  @override
  void initState() {
    super.initState();
    get();
  }

  void get() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await DhadaBookViewModel.of(context).fetchDhadaBook();
    });
  }



  @override
  Widget build(BuildContext context) {
    DhadaBookViewModel viewModel=DhadaBookViewModel.of(context);
    return Scaffold(
      appBar: AppBar(
        title:  const Text("DhadaBook Master View"),
      ),
      body: Selector<DhadaBookViewModel,ApiResponse<DhadaBookData>>(
          shouldRebuild: (prev,nex)=>true,
          selector: (buildContext , vm)=>vm.dhadaBookDataResponse,
          builder: (context, ApiResponse<DhadaBookData> data,child) {
            List<DhadaBook> dhadaBooks=data.data?.getData??[];
            return Column(
              children: [
                Expanded(
                  child: ManageResponse(
                      response: data,
                      onPressRetry: (){
                        viewModel.fetchDhadaBook();
                      },
                      child: dhadaBooks.isNotEmpty? MySfDataGrid(
                        headers: DhadaBookDataSource.headers,
                        columnWidthMode: Responsive.isSmallScreen(context)? ColumnWidthMode.auto:ColumnWidthMode.fill,
                        source: DhadaBookDataSource(listOfDocs: dhadaBooks),
                      ): ProjectConstant.noDatFoundWidget),
                ),
              ],
            );

          }
      ),
      floatingActionButton: FloatingActionButton(
          heroTag: "add_dhadaBook",
          onPressed: () {
            CustomBottomSheet.open(
                child: const TitledSheet(title: "Add DhadaBook", child: AddDhadaBookView()));
          },
          child: const Icon(Icons.add)),
    );
  }
}