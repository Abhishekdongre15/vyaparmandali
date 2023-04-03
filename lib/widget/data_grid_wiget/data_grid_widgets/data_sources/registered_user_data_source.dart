import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/custom_bottom_sheet.dart';
import 'package:vyaparmandali/app_manager/component/bottom_sheet/functional_sheet.dart';
import 'package:vyaparmandali/app_manager/service/navigation_service.dart';
import 'package:vyaparmandali/app_manager/theme/color_constant.dart';
import 'package:vyaparmandali/model/registered_user.dart';
import 'package:vyaparmandali/view_model/user_registration_master_view_model.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/cell_widgets/grid_image.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/cell_widgets/grid_status.dart';
import 'package:vyaparmandali/widget/data_grid_wiget/data_grid_widgets/my_data_grid_row_adapter.dart';

class RegisteredUserDataResponse extends DataGridSource {

  static List<String> headers=[
    "      Id     ",
    "      User Type Id     ",
    "      First Name     ",
    "      Last Name     ",
    "      Contact Number     ",
    "      Email     ",
    "      Password     ",
    "      Country     ",
    "      State     ",
    "      City     ",
    "      Description     ",
    "      Profile Image     ",
    "      User Status     ",
    "      Action     ",
  ];

  RegisteredUserDataResponse({required List<UserData> listOfDocs}) {
    dataGridRows = listOfDocs
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
      DataGridCell<String>(columnName: headers[0], value: dataGridRow.id??""),
      DataGridCell<String>(columnName: headers[1], value: dataGridRow.fkUserTypeId??""),
      DataGridCell<String>(columnName: headers[2], value: dataGridRow.firstname??""),
      DataGridCell<String>(columnName: headers[3], value: dataGridRow.lastname??""),
      DataGridCell<String>(columnName: headers[4], value: dataGridRow.contactNo??""),
      DataGridCell<String>(columnName: headers[5], value: dataGridRow.email??""),
      DataGridCell<String>(columnName: headers[6], value: dataGridRow.password??""),
      DataGridCell<String>(columnName: headers[7], value: dataGridRow.country??""),
      DataGridCell<String>(columnName: headers[8], value: dataGridRow.state??""),
      DataGridCell<String>(columnName: headers[9], value: dataGridRow.city??""),
      DataGridCell<String>(columnName: headers[10], value: dataGridRow.description??""),
      DataGridCell<Widget>(columnName: headers[11], value: GridImage(imagePath: dataGridRow.profileImg??"",)),
      DataGridCell<Widget>(columnName: headers[12], value: GridStatus(active: (dataGridRow.userStatus??"")=="1", onChanged: (bool value) {
        UserRegistrationMasterViewModel.of(NavigationService.context!).changeUserStatus(
            id: (dataGridRow.id??"").toString(),
            status: !value);
      },)),
      DataGridCell<Widget>(columnName: headers[13], value: actionButton(dataGridRow)),
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




  Widget actionButton(UserData docs){
    return Row(
      children: [
        Expanded(
          child: IconButton(
              icon:  Padding(
                padding: const EdgeInsets.all(1.0),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                  ),
                  child: const Center(
                    child: Icon(Icons.delete,
                      size: 15,
                      color: AppColor.primaryColor,),
                  ),
                ),
              ),
              onPressed: () async{
                CustomBottomSheet.open(child: FunctionalSheet(
                    message: "Confirm to delete user",
                    buttonName: "DELETE",
                    onPressButton: (){
                      UserRegistrationMasterViewModel.of(NavigationService.context!).deleteRegisteredUser(id: (docs.id??"").toString());
                    }
                ));
              }),
        ),
      ],
    );
  }



}