import 'package:flutter/material.dart';
import 'package:vyaparmandali/app_manager/helper/alert.dart';
import 'package:vyaparmandali/model/farmer.dart';
import 'package:vyaparmandali/view_model/farmer_view_model.dart';

class AddFarmerView extends StatefulWidget {
  final Farmer? farmerToUpdate;
  const AddFarmerView({Key? key, this.farmerToUpdate}) : super(key: key);

  @override
  State<AddFarmerView> createState() => _AddFarmerViewState();
}

class _AddFarmerViewState extends State<AddFarmerView> {


  @override
  void initState() {
    super.initState();
    get();
  }

  void get() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if(widget.farmerToUpdate==null){
        FarmerViewModel.of(context).initiateAddFarmer();
      }
      else {
        FarmerViewModel.of(context).initiateUpdateFarmer(widget.farmerToUpdate!);
      }

    });
  }


  @override
  Widget build(BuildContext context) {
    FarmerViewModel viewModel=FarmerViewModel.of(context);
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

                  Text("First Name",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  TextFormField(
                    controller: viewModel.firstNameC,
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
                  const SizedBox(height: 15,),


                  Text("Middle Name",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  TextFormField(
                    controller: viewModel.middleNameC,
                    decoration: const InputDecoration(
                      hintText: "Enter Middle Name",
                    ),

                    // Uncomment to validate middle name field

                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Required field !';
                    //   }
                    //   return null;
                    // },
                  ),
                  const SizedBox(height: 15,),


                  Text("Last Name",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  TextFormField(
                    controller: viewModel.lastNameC,
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
                  const SizedBox(height: 15,),



                  Text("Address",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  TextFormField(
                    controller: viewModel.addressC,
                    decoration: const InputDecoration(
                      hintText: "Enter Address",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15,),


                  Text("City",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  TextFormField(
                    controller: viewModel.cityC,
                    decoration: const InputDecoration(
                      hintText: "Enter City",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15,),


                  Text("Phone Number",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  TextFormField(
                    controller: viewModel.phoneC,
                    decoration: const InputDecoration(
                      hintText: "Enter Phone Number",
                      counterText: "",
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      else if (value.length<10) {
                        return 'Enter Valid Number';
                      }
                      return null;
                    },
                  ),


                  const SizedBox(height: 10,),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        if (Form.of(ctx).validate()) {
                          viewModel.addFarmer(
                              id: widget.farmerToUpdate?.id
                          );
                        }
                        else {
                          Alert.show("Fill all fields");
                        }
                      },
                      child:  Text(widget.farmerToUpdate==null? 'Submit':"Update"),
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