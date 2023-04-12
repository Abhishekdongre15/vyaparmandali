// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vyaparmandali/app_manager/extension/custom_int_parse.dart';
import 'package:vyaparmandali/app_manager/theme/color_constant.dart';
import 'package:vyaparmandali/model/customer.dart';
import 'package:vyaparmandali/model/dhada_book.dart';
import 'package:vyaparmandali/model/item.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/new/customer/widget/customer_selection_widget.dart';
import 'package:vyaparmandali/view_model/dhada_book_view_model.dart';

class DhadaBookDetailsWidget extends StatelessWidget {
  const DhadaBookDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DhadaBookViewModel viewModel = DhadaBookViewModel.of(context);
    final theme=Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Selector<DhadaBookViewModel,List<DhadabookDetails>>(
            shouldRebuild: (prev,nex)=>true,
            selector: (buildContext , vm)=>vm.details,
            builder: (context, List<DhadabookDetails> details,child) {



            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(details.length, (index) {
                DhadabookDetails detail=details[index];


                TextEditingController customerC=TextEditingController();

                Widget differenceWidget=Selector<DhadaBookViewModel,int>(
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
                                  viewModel.subDeleteDhadaBookDetails(
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
                          Text("Item",
                            style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w500
                            ),),
                          const SizedBox(height: 5,),
                          Selector<DhadaBookViewModel, Item?>(
                              shouldRebuild: (prev, nex) => true,
                              selector: (buildContext, vm) => vm.selectedItem,
                              builder: (context, Item? data, child) {
                                return data==null? const Text("Select Item"):Text(data.item??"");
                              }),


                          const SizedBox(height: 10,),
                          Text("Customer Name",
                            style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w500
                            ),),
                          const SizedBox(height: 5,),
                          detail.customerId!=null?

                              Row(
                                children: [
                                  Expanded(
                                    child: Text(detail.customerName.toString(),
                                    style: const TextStyle(
                                    ),),
                                  ),
                                  InkWell(onTap: (){
                                      viewModel.clearCustomerFromIndex(
                                          index: index
                                      );

                                  }, child: const Icon(Icons.close,
                                    color: AppColor.primaryColor,))
                                ],
                              )
                              :CustomerSelectionWidget(
                              onCustomerSelected: (Customer? val){
                                if(val!=null){
                                  viewModel.selectedThisCustomer(index: index,
                                      customerName: "${val.firstName??""} ${val.middleName??""} ${val.lastName??""}",
                                      customerId: (val.id??"").toString()
                                  );
                                }
                          }, controller: customerC),



                          const SizedBox(height: 10,),
                          Text("Package",
                            style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w500
                            ),),
                          const SizedBox(height: 5,),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ], // Only numbers can be entered
                            initialValue: detail.package,
                            decoration: const InputDecoration(
                              hintText: "Enter Package",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Required field !';
                              }
                              return null;
                            },
                            onChanged: (String val){
                              viewModel.details[index].package=val;
                              viewModel.calculatePackageDifference();
                              viewModel.calculatePBAndAverageForIndex(
                                index: index,
                                package: val.toIntCustom(),
                                cWeight: detail.cWeight.toIntCustom()
                              );
                              },
                          ),

                          differenceWidget,

                          const SizedBox(height: 10,),
                          Text("V Weight",
                            style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w500
                            ),),
                          const SizedBox(height: 5,),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ], //
                            initialValue: detail.vWeight,
                            decoration: const InputDecoration(
                              hintText: "Enter V Weight",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Required field !';
                              }
                              return null;
                            },
                            onChanged: (String val){
                              viewModel.details[index].vWeight=val;
                              viewModel.calculateVAmountForIndex(index: index, rate: detail.rate.toIntCustom(), vW: val.toIntCustom());
                            },
                          ),


                          const SizedBox(height: 10,),
                          Text("C Weight",
                            style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w500
                            ),),
                          const SizedBox(height: 5,),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ], //
                            initialValue: detail.cWeight,
                            decoration: const InputDecoration(
                              hintText: "Enter C Weight",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Required field !';
                              }
                              return null;
                            },
                            onChanged: (String val){
                              viewModel.details[index].cWeight=val;
                              viewModel.calculateCAmountForIndex(index: index, rate: detail.rate.toIntCustom(), cW: val.toIntCustom());
                              viewModel.calculatePBAndAverageForIndex(
                                  index: index,
                                  package: detail.package.toIntCustom(),
                                  cWeight: val.toIntCustom()
                              );
                            },
                          ),



                          const SizedBox(height: 10,),
                          Text("PB",
                            style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w500
                            ),),
                          const SizedBox(height: 5,),
                          Center(child: Text((detail?.pB==null? "Write down package":(detail.pB??"")))),


                          const SizedBox(height: 10,),
                          Text("Average",
                            style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w500
                            ),),
                          const SizedBox(height: 5,),
                          Center(child: Text((detail?.average=="0.0"? "Add Package and C Weight":(detail.average??"")))),


                          const SizedBox(height: 10,),
                          Text("Rate",
                            style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w500
                            ),),
                          const SizedBox(height: 5,),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ], //
                            initialValue: detail.rate,
                            decoration: const InputDecoration(
                              hintText: "Enter Rate",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Required field !';
                              }
                              return null;
                            },
                            onChanged: (String val){
                              viewModel.details[index].rate=val;
                              viewModel.calculateCAmountForIndex(index: index, rate: val.toIntCustom(), cW: detail.cWeight.toIntCustom());
                              viewModel.calculateVAmountForIndex(index: index, rate: val.toIntCustom(), vW: detail.vWeight.toIntCustom());
                            },
                          ),


                          const SizedBox(height: 10,),
                          Text("V Amount",
                            style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w500
                            ),),
                          const SizedBox(height: 5,),
                          Center(child: Text((detail?.vAmount==null? "Add Rate and V Weight":(detail.vAmount??"")))),

                          const SizedBox(height: 10,),
                          Text("C Amount",
                            style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w500
                            ),),
                          const SizedBox(height: 5,),
                          Center(child: Text((detail?.cAmount==null? "Add Rate and C Weight":(detail.cAmount??"")))),

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
