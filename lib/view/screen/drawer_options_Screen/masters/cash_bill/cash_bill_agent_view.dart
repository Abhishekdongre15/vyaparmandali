import 'package:flutter/material.dart';
import 'package:vyaparmandali/app_manager/helper/alert.dart';
import 'package:vyaparmandali/model/cash_bill_data.dart';
import 'package:vyaparmandali/view_model/cash_bill_view_model.dart';

class AddCashBillView extends StatefulWidget {
  final CashBill? cashBillToUpdate;
  const AddCashBillView({Key? key, this.cashBillToUpdate}) : super(key: key);

  @override
  State<AddCashBillView> createState() => _AddCashBillViewState();
}

class _AddCashBillViewState extends State<AddCashBillView> {


  @override
  void initState() {
    super.initState();
    get();
  }

  void get() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if(widget.cashBillToUpdate==null){
        CashBillViewModel.of(context).initiateAddCashBill();
      }
      else {
        CashBillViewModel.of(context).initiateUpdateCashBill(widget.cashBillToUpdate!);
      }

    });
  }


  @override
  Widget build(BuildContext context) {
    CashBillViewModel viewModel=CashBillViewModel.of(context);
    final theme=Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Form(
          child: Builder(
            builder: (ctx) {
              return  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Product Name",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  TextFormField(
                    controller: viewModel.productNameC,
                    decoration: const InputDecoration(
                      hintText: "Enter Product Name",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),

                  Text("Weight",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  TextFormField(
                    controller: viewModel.weightC,
                    decoration: const InputDecoration(
                      hintText: "Enter Weight",
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15,),


                  Text("Rate",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  TextFormField(
                    controller: viewModel.rateC,
                    decoration: const InputDecoration(
                      hintText: "Enter Rate",
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15,),


                  Text("APMC Charges",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  TextFormField(
                    controller: viewModel.apmcCharges,
                    decoration: const InputDecoration(
                      hintText: "Enter APMC Charges",
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15,),


                  Text("Commission",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  TextFormField(
                    controller: viewModel.weightC,
                    decoration: const InputDecoration(
                      hintText: "Enter Commission",
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15,),


                  Text("Final Price",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  TextFormField(
                    controller: viewModel.weightC,
                    decoration: const InputDecoration(
                      hintText: "Enter Final Price",
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),



                  const SizedBox(height: 10,),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        if (Form.of(ctx).validate()) {
                          viewModel.addCashBill(
                              id: widget.cashBillToUpdate?.id
                          );
                        }
                        else {
                          Alert.show("Fill all fields");
                        }
                      },
                      child:  Text(widget.cashBillToUpdate==null? 'Submit':"Update"),
                    ),
                  )

                ],
              );
            },
          ),
        ),
      ],
    );
  }
}