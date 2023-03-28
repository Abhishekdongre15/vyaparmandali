import 'package:flutter/material.dart';
import 'package:vyaparmandali/app_manager/helper/alert.dart';

import '../../../../../../model/customer.dart';
import '../../../../../../view_model/customer_view_model.dart';

class AddCustomerView extends StatefulWidget {
  final Customer? customerToUpdate;

  const AddCustomerView({Key? key, this.customerToUpdate}) : super(key: key);

  @override
  State<AddCustomerView> createState() => _AddCustomerViewState();
}

class _AddCustomerViewState extends State<AddCustomerView> {
  @override
  void initState() {
    super.initState();
    get();
  }

  void get() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (widget.customerToUpdate == null) {
        CustomerViewModel.of(context).initiateAddCustomer();
      } else {
        CustomerViewModel.of(context)
            .initiateUpdateCustomer(widget.customerToUpdate!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    CustomerViewModel viewModel = CustomerViewModel.of(context);
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
                    "First Name",
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: viewModel.firstName,
                    decoration: const InputDecoration(
                      hintText: "Enter First Name",
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
                  Text(
                    "Middle Name",
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: viewModel.middleName,
                    decoration: const InputDecoration(
                      hintText: "Enter Middle Name",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),
                  Text(
                    "Last Name",
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: viewModel.lastName,
                    decoration: const InputDecoration(
                      hintText: "Enter Last Name",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),

                  Text(
                    "Address",
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: viewModel.address,
                    decoration: const InputDecoration(
                      hintText: "Enter Address Name",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),

                  Text(
                    "City",
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: viewModel.city,
                    decoration: const InputDecoration(
                      hintText: "Enter City Name",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),

                  Text(
                    "District",
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: viewModel.district,
                    decoration: const InputDecoration(
                      hintText: "Enter District Name",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),


                  Text(
                    "State",
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: viewModel.state,
                    decoration: const InputDecoration(
                      hintText: "Enter State Name",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),



                  Text(
                    "Email",
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: viewModel.email,
                    decoration: const InputDecoration(
                      hintText: "Enter Email Name",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),



                  Text(
                    "Contact No",
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: viewModel.contactNo,
                    decoration: const InputDecoration(
                      hintText: "Enter Contact No",
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
                          viewModel.addCustomer(
                              id: widget.customerToUpdate?.id);
                        } else {
                          Alert.show("Fill all fields");
                        }
                      },
                      child: Text(widget.customerToUpdate == null
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
