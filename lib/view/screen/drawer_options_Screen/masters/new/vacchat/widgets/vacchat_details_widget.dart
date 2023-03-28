import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vyaparmandali/app_manager/theme/color_constant.dart';
import 'package:vyaparmandali/model/vacchat.dart';
import 'package:vyaparmandali/view_model/vacchat_view_model.dart';

class VacchatDetailsWidget extends StatelessWidget {
  const VacchatDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final VacchatViewModel viewModel = VacchatViewModel.of(context);
    final theme=Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Selector<VacchatViewModel,List<VacchatDetails>>(
            shouldRebuild: (prev,nex)=>true,
            selector: (buildContext , vm)=>vm.details,
            builder: (context, List<VacchatDetails> details,child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(details.length, (index) {
                VacchatDetails detail=details[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text("Details ${index+1}",
                                  style: theme.textTheme.titleSmall?.copyWith(
                                      fontWeight: FontWeight.w500,
                                    color: AppColor.primaryColor
                                  ),),
                              ),
                              InkWell(onTap: (){
                                viewModel.clearDetailOnIndex(index);
                              }, child: const Icon(Icons.close,
                                color: AppColor.primaryColor,)),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Text("Vacchat Name",
                            style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w500
                            ),),
                          const SizedBox(height: 5,),
                          TextFormField(
                            initialValue: detail.vacchatName,
                            decoration: const InputDecoration(
                              hintText: "Enter Vacchat Name",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Required field !';
                              }
                              return null;
                            },
                            onChanged: (String val){
                              viewModel.details[index].vacchatName=val;
                            },
                          ),
                          const SizedBox(height: 10,),
                          Text("Item",
                            style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w500
                            ),),
                          const SizedBox(height: 5,),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            initialValue: detail.item,
                            decoration: const InputDecoration(
                              hintText: "Enter Item",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Required field !';
                              }
                              return null;
                            },
                            onChanged: (String val){
                              viewModel.details[index].item=val;
                            },
                          ),


                          const SizedBox(height: 10,),
                          Text("Quantity",
                            style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w500
                            ),),
                          const SizedBox(height: 5,),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            initialValue: detail.qty,
                            decoration: const InputDecoration(
                              hintText: "Enter Quantity",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Required field !';
                              }
                              return null;
                            },
                            onChanged: (String val){
                              viewModel.details[index].qty=val;
                            },
                          ),



                          const SizedBox(height: 10,),
                          Text("Freight",
                            style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w500
                            ),),
                          const SizedBox(height: 5,),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            initialValue: detail.freight,
                            decoration: const InputDecoration(
                              hintText: "Enter Freight",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Required field !';
                              }
                              return null;
                            },
                            onChanged: (String val){
                              viewModel.details[index].freight=val;
                            },
                          ),


                          const SizedBox(height: 10,),
                          Text("Advance",
                            style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w500
                            ),),
                          const SizedBox(height: 5,),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            initialValue: detail.advance,
                            decoration: const InputDecoration(
                              hintText: "Enter Advance",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Required field !';
                              }
                              return null;
                            },
                            onChanged: (String val){
                              viewModel.details[index].advance=val;
                            },
                          ),


                          const SizedBox(height: 10,),
                          Text("Vasuli",
                            style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w500
                            ),),
                          const SizedBox(height: 5,),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            initialValue: detail.vasuli,
                            decoration: const InputDecoration(
                              hintText: "Enter Vasuli",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Required field !';
                              }
                              return null;
                            },
                            onChanged: (String val){
                              viewModel.details[index].vasuli=val;
                            },
                          ),


                          const SizedBox(height: 10,),
                          Text("Hundekari Code",
                            style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w500
                            ),),
                          const SizedBox(height: 5,),
                          TextFormField(
                            initialValue: detail.hundekariCode,
                            decoration: const InputDecoration(
                              hintText: "Enter Hundekari Code",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Required field !';
                              }
                              return null;
                            },
                            onChanged: (String val){
                              viewModel.details[index].hundekariCode=val;
                            },
                          ),

                        ],
                      ),
                    ),
                  ),
                );
              }),
            );
          }
        ),
        const SizedBox(height: 10,),
        Align(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: (){
                  viewModel.addDetails();
                },
                child: const Text("Add Details"))),
      ],
    );
  }
}
