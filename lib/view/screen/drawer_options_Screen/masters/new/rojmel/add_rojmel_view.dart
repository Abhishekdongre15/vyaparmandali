import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:vyaparmandali/app_manager/helper/alert.dart';

import '../../../../../../model/rojmel.dart';
import '../../../../../../view_model/rojmel_view_model.dart';


class AddRojmelView extends StatefulWidget {
  final Rojmel? rojmelToUpdate;

  const AddRojmelView({Key? key, this.rojmelToUpdate}) : super(key: key);

  @override
  State<AddRojmelView> createState() => _AddRojmelViewState();
}

class _AddRojmelViewState extends State<AddRojmelView> {
  @override
  void initState() {
    super.initState();
    get();
  }

  void get() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (widget.rojmelToUpdate == null) {
        RojmelViewModel.of(context).initiateAddRojmel();
      } else {
        RojmelViewModel.of(context)
            .initiateUpdateRojmel(widget.rojmelToUpdate!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    RojmelViewModel viewModel = RojmelViewModel.of(context);
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Form(
          child: Builder(
            builder: (ctx) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payment Type",
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: viewModel.type,
                    decoration: const InputDecoration(
                      hintText: "Enter Payment Type",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),



                  Text("Payment Date",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  DateTimePicker(
                    firstDate: DateTime(DateTime.now().year-10, DateTime.now().month, DateTime.now().day),
                    lastDate: DateTime.now(),
                    controller: viewModel.date,
                    decoration: const InputDecoration(
                      hintText: "Enter Payment Date",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15,),



                  Text(
                    "Transaction Type",
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: viewModel.transactionType,
                    decoration: const InputDecoration(
                      hintText: "Enter Transaction Type",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),
                  Text(
                    "Bank ID",
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: viewModel.bankId,
                    decoration: const InputDecoration(
                      hintText: "Enter Bank ID",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),

                  Text(
                    "Total Balance",
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: viewModel.totalBalance,
                    decoration: const InputDecoration(
                      hintText: "Enter Total Balance",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),

                  Text(
                    "Patti Number",
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: viewModel.pattiNumber,
                    decoration: const InputDecoration(
                      hintText: "Enter Patti Number",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),

                  Text(
                    "Account Name",
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: viewModel.accountName,
                    decoration: const InputDecoration(
                      hintText: "Enter Account Name",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),


                  Text(
                    "Account Code",
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: viewModel.accountCode,
                    decoration: const InputDecoration(
                      hintText: "Enter Account Code",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),



                  Text(
                    "Amount",
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: viewModel.amount,
                    decoration: const InputDecoration(
                      hintText: "Enter Amount",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),



                  Text(
                    "Cheque No",
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: viewModel.cheqNo,
                    decoration: const InputDecoration(
                      hintText: "Enter Cheque No",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),

                  Text(
                    "Description",
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: viewModel.description,
                    decoration: const InputDecoration(
                      hintText: "Enter Description",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),


                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        if (Form.of(ctx).validate()) {
                          viewModel.addRojmel(
                              id: widget.rojmelToUpdate?.id);
                        } else {
                          Alert.show("Fill all fields");
                        }
                      },
                      child: Text(widget.rojmelToUpdate == null
                          ? 'Submit'
                          : "Update"),
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
