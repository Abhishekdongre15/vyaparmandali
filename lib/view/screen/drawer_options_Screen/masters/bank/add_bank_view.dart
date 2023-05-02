import 'package:flutter/material.dart';
import 'package:vyaparmandali/app_manager/helper/alert.dart';
import 'package:vyaparmandali/model/bank.dart';
import 'package:vyaparmandali/view_model/bank_view_model.dart';

class AddBankView extends StatefulWidget {
  final Bank? bankToUpdate;
  const AddBankView({Key? key, this.bankToUpdate}) : super(key: key);

  @override
  State<AddBankView> createState() => _AddBankViewState();
}

class _AddBankViewState extends State<AddBankView> {


  @override
  void initState() {
    super.initState();
    get();
  }

  void get() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if(widget.bankToUpdate==null){
        BankViewModel.of(context).initiateAddBank();
      }
      else {
        BankViewModel.of(context).initiateUpdateBank(widget.bankToUpdate!);
      }

    });
  }


  @override
  Widget build(BuildContext context) {
    BankViewModel viewModel=BankViewModel.of(context);
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

                  Text("Bank Name",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  TextFormField(
                    controller: viewModel.bankNameC,
                    decoration: const InputDecoration(
                      hintText: "Enter Bank Name",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),


                  const SizedBox(height: 15,),
                  Text("Branch Code",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  TextFormField(
                    controller: viewModel.branchCode,
                    decoration: const InputDecoration(
                      hintText: "Enter Branch Code",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),


                  const SizedBox(height: 15,),
                  Text("IFSC Code",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  TextFormField(
                    controller: viewModel.ifscC,
                    decoration: const InputDecoration(
                      hintText: "Enter IFSC Code",
                      counterText: "",
                    ),
                    maxLength: 11,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      else if (value.length<11) {
                        return 'Enter Valid IFSC';
                      }
                      return null;
                    },
                  ),



                  const SizedBox(height: 10,),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        if (Form.of(ctx).validate()) {
                          viewModel.addBank(
                              id: widget.bankToUpdate?.id
                          );
                        }
                        else {
                          Alert.show("Fill all fields");
                        }
                      },
                      child:  Text(widget.bankToUpdate==null? 'Submit':"Update"),
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