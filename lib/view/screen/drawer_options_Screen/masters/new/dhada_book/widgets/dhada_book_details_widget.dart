import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vyaparmandali/app_manager/theme/color_constant.dart';
import 'package:vyaparmandali/model/dhada_book.dart';
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

                              }, child: const Icon(Icons.close,
                                color: AppColor.primaryColor,)),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Text("Item Code",
                            style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w500
                            ),),
                          const SizedBox(height: 5,),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            initialValue: detail.itemCode,
                            decoration: const InputDecoration(
                              hintText: "Enter Item Code",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Required field !';
                              }
                              return null;
                            },
                            onChanged: (String val){
                              viewModel.details[index].itemCode=val;
                            },
                          ),


                          const SizedBox(height: 10,),
                          Text("Name",
                            style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w500
                            ),),
                          const SizedBox(height: 5,),
                          TextFormField(
                            initialValue: detail.name,
                            decoration: const InputDecoration(
                              hintText: "Enter Name",
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
                            },
                          ),



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
