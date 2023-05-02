import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchable_text_field/searchable_text_field.dart';
import 'package:vyaparmandali/app_manager/api/api_response.dart';
import 'package:vyaparmandali/app_manager/theme/color_constant.dart';
import 'package:vyaparmandali/model/farmer.dart';
import 'package:vyaparmandali/view_model/farmer_view_model.dart';

class FarmerSelectionWidget extends StatelessWidget {
  final ValueChanged<Farmer?> onFarmerSelected;
  final Farmer? selectedFarmer;
  final TextEditingController controller;


  const FarmerSelectionWidget({Key? key, required this.onFarmerSelected, this.selectedFarmer, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Selector<FarmerViewModel,ApiResponse<List<Farmer>>>(
              shouldRebuild: (prev,nex)=>true,
              selector: (buildContext , vm)=>vm.searchedFarmerResponse,
              builder: (context, ApiResponse<List<Farmer>> data,child) {
                List<Farmer> farmers=data.data??[];

                SearchableTextFieldStatus status=
                controller.text.trim().isEmpty?
                SearchableTextFieldStatus.none :
                selectedFarmer!=null?
                SearchableTextFieldStatus.itemSelected :
                data.status==Status.loading?
                SearchableTextFieldStatus.loading :
                farmers.isEmpty?
                SearchableTextFieldStatus.noItemFound :
                farmers.isNotEmpty?
                SearchableTextFieldStatus.itemFound :
                SearchableTextFieldStatus.none;

                return  SearchableTextField<Farmer>(
                  controller: controller,
                  status: status,
                  decoration: const InputDecoration(
                    hintText: "Search Farmer Here",
                  ),
                  noItemWidget: const Center(child: Text("No Farmer Found")),
                  onChanged: (val) {
                    if(val!=null){
                      onFarmerSelected(null);
                      FarmerViewModel.of(context).fetchFarmerByName(farmerName: val);
                    }
                  },
                  onSelectedItem: (Farmer selectedFarmer){
                    onFarmerSelected(selectedFarmer);
                    FarmerViewModel.of(context).searchedFarmerResponse=ApiResponse<List<Farmer>>.initial("");
                  },
                  validator: (val) {
                    if(val==null || val.toString().isEmpty){
                      return "Required Field !!";
                    }
                    else if(selectedFarmer==null){
                      return "Please Select Farmer";
                    }
                    else {
                      return null;
                    }
                  },
                  items: farmers.map((e) =>
                      SearchableItem<Farmer>(
                          value: e,
                          title: "${e.firstName??""} ${e.middleName??""} ${e.lastName??""}",)
                  ).toList(),
                );
              }
          ),
        ),
        
        Tooltip(
          message: "Add Farmer",
          child: IconButton(

              onPressed: (){
                FarmerViewModel.onPressAddFarmer();
          }, icon: const Icon(Icons.add,color: AppColor.primaryColor,)),
        )
        
      ],
    );
  }
}
