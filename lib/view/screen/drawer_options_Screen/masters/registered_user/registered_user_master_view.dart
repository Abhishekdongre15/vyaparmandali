import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:vyaparmandali/app_manager/api/api_response.dart';
import 'package:vyaparmandali/app_manager/api/manage_response.dart';
import 'package:vyaparmandali/app_manager/constant/project_constant.dart';
import 'package:vyaparmandali/app_manager/helper/responsive/responsive.dart';
import 'package:vyaparmandali/model/registered_user.dart';
import 'package:vyaparmandali/view_model/user_registration_master_view_model.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/data_sources/registered_User_data_source.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/my_sf_data_grid.dart';

class RegisteredUserMasterView extends StatefulWidget {
  const RegisteredUserMasterView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RegisteredUserMasterViewState();
  }
}

class RegisteredUserMasterViewState extends State<RegisteredUserMasterView> {


  @override
  void initState() {
    super.initState();
    get();
  }

  void get() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await UserRegistrationMasterViewModel.of(context).fetchRegisteredUsers();
    });
  }



  @override
  Widget build(BuildContext context) {
    UserRegistrationMasterViewModel viewModel=UserRegistrationMasterViewModel.of(context);
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Registered User Master View"),
      ),
      body: Selector<UserRegistrationMasterViewModel,ApiResponse<RegisteredUserData>>(
          shouldRebuild: (prev,nex)=>true,
          selector: (buildContext , vm)=>vm.registeredUserDataResponse,
          builder: (context, ApiResponse<RegisteredUserData> data,child) {
            List<UserData> registeredUsers=data.data?.getAllData??[];
            return Column(
              children: [
                Expanded(
                  child: ManageResponse(
                      response: data,
                      onPressRetry: (){
                        viewModel.fetchRegisteredUsers();
                      },
                      child: registeredUsers.isNotEmpty? MySfDataGrid(
                        headers: RegisteredUserDataResponse.headers,
                        columnWidthMode: Responsive.isSmallScreen(context)? ColumnWidthMode.auto:ColumnWidthMode.fill,
                        source: RegisteredUserDataResponse(listOfDocs: registeredUsers),
                      ): ProjectConstant.noDatFoundWidget),
                ),
              ],
            );

          }
      ),
    );
  }
}