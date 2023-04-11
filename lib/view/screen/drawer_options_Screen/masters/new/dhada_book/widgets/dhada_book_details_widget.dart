// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vyaparmandali/app_manager/theme/color_constant.dart';
import 'package:vyaparmandali/model/dhada_book.dart';
import 'package:vyaparmandali/view_model/dhada_book_view_model.dart';

class DhadaBookDetailsWidget extends StatelessWidget {
  final Widget? itemCodeWidget;
  const DhadaBookDetailsWidget({Key? key, this.itemCodeWidget}) : super(key: key);

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
                          itemCodeWidget??Container(),


                          const SizedBox(height: 10,),
                          Text("Customer Name",
                            style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w500
                            ),),
                          const SizedBox(height: 5,),
                          TextFormField(
                            initialValue: detail.name,
                            decoration: const InputDecoration(
                              hintText: "Enter Customer Name",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Required field !';
                              }
                              return null;
                            },
                            onChanged: (String val){
                              viewModel.details[index].name=val;
                            },
                          ),



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
                              },
                          ),

                          differenceWidget,

                          const SizedBox(height: 10,),
                          Text("Gross",
                            style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w500
                            ),),
                          const SizedBox(height: 5,),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            initialValue: detail.gross,
                            decoration: const InputDecoration(
                              hintText: "Enter Gross",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Required field !';
                              }
                              return null;
                            },
                            onChanged: (String val){
                              viewModel.details[index].gross=val;
                            },
                          ),


                          const SizedBox(height: 10,),
                          Text("PB",
                            style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w500
                            ),),
                          const SizedBox(height: 5,),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            initialValue: detail.pB,
                            decoration: const InputDecoration(
                              hintText: "Enter PB",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Required field !';
                              }
                              return null;
                            },
                            onChanged: (String val){
                              viewModel.details[index].pB=val;
                            },
                          ),


                          const SizedBox(height: 10,),
                          Text("Average",
                            style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w500
                            ),),
                          const SizedBox(height: 5,),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            initialValue: detail.average,
                            decoration: const InputDecoration(
                              hintText: "Enter Average",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Required field !';
                              }
                              return null;
                            },
                            onChanged: (String val){
                              viewModel.details[index].average=val;
                            },
                          ),


                          const SizedBox(height: 10,),
                          Text("Rate",
                            style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w500
                            ),),
                          const SizedBox(height: 5,),
                          TextFormField(
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
                            },
                          ),


                          const SizedBox(height: 10,),
                          Text("Amount",
                            style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w500
                            ),),
                          const SizedBox(height: 5,),
                          TextFormField(
                            initialValue: detail.amount,
                            decoration: const InputDecoration(
                              hintText: "Enter Amount",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Required field !';
                              }
                              return null;
                            },
                            onChanged: (String val){
                              viewModel.details[index].amount=val;
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
