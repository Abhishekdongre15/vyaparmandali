import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:vyaparmandali/app_manager/api/api_response.dart';
import 'package:vyaparmandali/app_manager/api/manage_response.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/custom_bottom_sheet.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/titled_sheet.dart';
import 'package:vyaparmandali/app_manager/constant/project_constant.dart';
import 'package:vyaparmandali/model/group.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/group/add_group_view.dart';
import 'package:vyaparmandali/view_model/group_view_model.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/data_sources/group_data_source.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/my_sf_data_grid.dart';

class GroupMasterView extends StatefulWidget {
  const GroupMasterView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GroupMasterViewState();
  }
}

class GroupMasterViewState extends State<GroupMasterView> {


  @override
  void initState() {
    super.initState();
    get();
  }

  void get() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await GroupViewModel.of(context).fetchGroups();
    });
  }



  @override
  Widget build(BuildContext context) {
    GroupViewModel viewModel=GroupViewModel.of(context);
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Group Master View"),
      ),
      body: Selector<GroupViewModel,ApiResponse<GroupData>>(
          shouldRebuild: (prev,nex)=>true,
          selector: (buildContext , vm)=>vm.groupDataResponse,
          builder: (context, ApiResponse<GroupData> data,child) {
            List<Group> groups=data.data?.getAllData??[];
            return Column(
              children: [
                Expanded(
                  child: ManageResponse(
                      response: data,
                      onPressRetry: (){
                        viewModel.fetchGroups();
                      },
                      child: groups.isNotEmpty? MySfDataGrid(
                        headers: GroupDataSource.headers,
                        columnWidthMode: ColumnWidthMode.fill,
                        source: GroupDataSource(listOfDocs: groups),
                      ): ProjectConstant.noDatFoundWidget),
                ),
              ],
            );

          }
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "add_group",
          onPressed: () {
          CustomBottomSheet.open(
          child: const TitledSheet(title: "Add Group", child: AddGroupView()));
          },
          child: const Icon(Icons.add)),
    );
  }
}