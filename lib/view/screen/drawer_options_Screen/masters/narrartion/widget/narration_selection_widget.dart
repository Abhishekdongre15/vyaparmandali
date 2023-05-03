import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchable_text_field/searchable_text_field.dart';
import 'package:vyaparmandali/app_manager/api/api_response.dart';
import 'package:vyaparmandali/app_manager/theme/color_constant.dart';
import 'package:vyaparmandali/model/narration.dart';
import 'package:vyaparmandali/view_model/narration_view_model.dart';

class NarrationSelectionWidget extends StatelessWidget {
  final ValueChanged<Narration?> onNarrationSelected;
  final Narration? selectedNarration;
  final TextEditingController controller;


  const NarrationSelectionWidget({Key? key, required this.onNarrationSelected, this.selectedNarration, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Selector<NarrationViewModel,ApiResponse<List<Narration>>>(
              shouldRebuild: (prev,nex)=>true,
              selector: (buildContext , vm)=>vm.searchedNarrationResponse,
              builder: (context, ApiResponse<List<Narration>> data,child) {
                List<Narration> narrations=data.data??[];

                SearchableTextFieldStatus status=
                controller.text.trim().isEmpty?
                SearchableTextFieldStatus.none :
                selectedNarration!=null?
                SearchableTextFieldStatus.itemSelected :
                data.status==Status.loading?
                SearchableTextFieldStatus.loading :
                narrations.isEmpty?
                SearchableTextFieldStatus.noItemFound :
                narrations.isNotEmpty?
                SearchableTextFieldStatus.itemFound :
                SearchableTextFieldStatus.none;

                return  SearchableTextField<Narration>(
                  controller: controller,
                  status: status,
                  decoration: const InputDecoration(
                    hintText: "Search Narration Here",
                  ),
                  noItemWidget: const Center(child: Text("No Narration Found")),
                  onChanged: (val) {
                    if(val!=null){
                      onNarrationSelected(null);
                      NarrationViewModel.of(context).fetchNarrationByDescription(narrationName: val);
                    }
                  },
                  onSelectedItem: (Narration selectedNarration){
                    onNarrationSelected(selectedNarration);
                    NarrationViewModel.of(context).searchedNarrationResponse=ApiResponse<List<Narration>>.initial("");
                  },
                  validator: (val) {
                    if(val==null || val.toString().isEmpty){
                      return "Required Field !!";
                    }
                    else if(selectedNarration==null){
                      return "Please Select Narration";
                    }
                    else {
                      return null;
                    }
                  },
                  items: narrations.map((e) =>
                      SearchableItem<Narration>(
                          value: e,
                          title: e.description??"",)
                  ).toList(),
                );
              }
          ),
        ),
        
        Tooltip(
          message: "Add Narration",
          child: IconButton(

              onPressed: (){
                NarrationViewModel.onPressAddNarration();
          }, icon: const Icon(Icons.add,color: AppColor.primaryColor,)),
        )
        
      ],
    );
  }
}
