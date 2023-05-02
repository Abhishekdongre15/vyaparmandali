import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vyaparmandali/app_manager/theme/color_constant.dart';
import 'package:vyaparmandali/model/farmer.dart';
import 'package:vyaparmandali/model/product.dart';
import 'package:vyaparmandali/model/vacchat.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/farmer/widget/farmer_selection_widget.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/product/widget/product_selection_widget.dart';
import 'package:vyaparmandali/view_model/vacchat_view_model.dart';
import 'package:vyaparmandali/widget/clear_selection_widget.dart';

class VacchatDetailsWidget extends StatelessWidget {
  const VacchatDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final VacchatViewModel viewModel = VacchatViewModel.of(context);
    final theme=Theme.of(context);

    Widget differenceWidget=Selector<VacchatViewModel,int>(
        shouldRebuild: (prev,nex)=>true,
        selector: (buildContext , vm)=>vm.packageDifference,
        builder: (context,int difference,child) {
          return Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(difference==0? "Package Distribution Complete":"Remaining package $difference",
              style:  TextStyle(
                  color: difference<0? Colors.red:Colors.green
              ),),
          );
        }
    );


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
                                if(detail.id!=null){
                                  viewModel.subDeleteVacchatDetails(
                                    id: detail.id.toString(),
                                    index: index
                                  );
                                }else {
                                  viewModel.clearDetailOnIndex(index);
                                }
                                viewModel.calculatePackageDifference();
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
                          detail.vacchatName!=null?

                          ClearSelectionWidget(label: detail.vacchatName??"",
                            onTapClear: (){
                              viewModel.selectedFarmerOnIndex(index,
                                  selectedFarmer: null);
                            },) :FarmerSelectionWidget(onFarmerSelected: (Farmer? selectedFarmer){
                            if(selectedFarmer!=null){
                              viewModel.selectedFarmerOnIndex(index,
                                  selectedFarmer: selectedFarmer);
                            }
                          }, controller: viewModel.farmerC),
                          const SizedBox(height: 10,),
                          Text("Item",
                            style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w500
                            ),),
                          const SizedBox(height: 5,),
                          detail.item!=null?

                          ClearSelectionWidget(label: detail.item??"",
                            onTapClear: (){
                              viewModel.selectedProductOnIndex(index,
                              val: null);
                            },) :ProductSelectionWidget(
                            selectedProduct: detail.item==null? null:Product(
                              productName: detail.item
                            ),
                            onProductSelected: (Product? value) {
                              viewModel.selectedProductOnIndex(index,
                                  val: value?.productName);
                            },

                          ),


                          const SizedBox(height: 10,),
                          Text("Quantity",
                            style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w500
                            ),),
                          const SizedBox(height: 5,),
                          TextFormField(
                            initialValue: detail.qty,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.singleLineFormatter,
                              FilteringTextInputFormatter.digitsOnly,
                            ],
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
                              viewModel.calculatePackageDifference();
                            },
                          ),
                          differenceWidget,


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
