import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:vyaparmandali/app_manager/api/api_response.dart';
import 'package:vyaparmandali/app_manager/api/manage_response.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/custom_bottom_sheet.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/titled_sheet.dart';
import 'package:vyaparmandali/app_manager/constant/project_constant.dart';
import 'package:vyaparmandali/app_manager/helper/responsive/responsive.dart';
import 'package:vyaparmandali/model/agent.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/agent/add_agent_view.dart';
import 'package:vyaparmandali/view_model/agent_view_model.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/data_sources/agent_data_source.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/my_sf_data_grid.dart';

class AgentMasterView extends StatefulWidget {
  const AgentMasterView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AgentMasterViewState();
  }
}

class AgentMasterViewState extends State<AgentMasterView> {


  @override
  void initState() {
    super.initState();
    get();
  }

  void get() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await AgentViewModel.of(context).fetchAgents();
    });
  }



  @override
  Widget build(BuildContext context) {
    AgentViewModel viewModel=AgentViewModel.of(context);
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Agent Master View"),
      ),
      body: Selector<AgentViewModel,ApiResponse<AgentData>>(
          shouldRebuild: (prev,nex)=>true,
          selector: (buildContext , vm)=>vm.agentDataResponse,
          builder: (context, ApiResponse<AgentData> data,child) {
            List<Agent> agents=data.data?.getData??[];
            return Column(
              children: [
                Expanded(
                  child: ManageResponse(
                      response: data,
                      onPressRetry: (){
                        viewModel.fetchAgents();
                      },
                      child: agents.isNotEmpty? MySfDataGrid(
                        headers: AgentDataSource.headers,
                        columnWidthMode: Responsive.isSmallScreen(context)? ColumnWidthMode.auto:ColumnWidthMode.fill,
                        source: AgentDataSource(listOfDocs: agents),
                      ): ProjectConstant.noDatFoundWidget),
                ),
              ],
            );

          }
      ),
      floatingActionButton: FloatingActionButton(
          heroTag: "add_agent",
          onPressed: () {
            CustomBottomSheet.open(
                child: const TitledSheet(title: "Add Agent", child: AddAgentView()));
          },
          child: const Icon(Icons.add)),
    );
  }
}