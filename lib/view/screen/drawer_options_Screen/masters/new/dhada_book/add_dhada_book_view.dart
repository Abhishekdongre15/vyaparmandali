import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vyaparmandali/app_manager/helper/alert.dart';
import 'package:vyaparmandali/model/dhada_book.dart';
import 'package:vyaparmandali/model/farmer.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/new/dhada_book/widgets/dhada_book_details_widget.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/new/farmer/widget/farmer_selection_widget.dart';
import 'package:vyaparmandali/view_model/dhada_book_view_model.dart';

class AddDhadaBookView extends StatefulWidget {
  final DhadaBook? dhadaBookToUpdate;
  const AddDhadaBookView({Key? key, this.dhadaBookToUpdate}) : super(key: key);

  @override
  State<AddDhadaBookView> createState() => _AddDhadaBookViewState();
}

class _AddDhadaBookViewState extends State<AddDhadaBookView> {


  @override
  void initState() {
    super.initState();
    get();
  }

  void get() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if(widget.dhadaBookToUpdate==null){
        DhadaBookViewModel.of(context).initiateAddDhadaBook();
      }
      else {
        DhadaBookViewModel.of(context).initiateUpdateDhadaBook(widget.dhadaBookToUpdate!);
      }

    });
  }


  @override
  Widget build(BuildContext context) {
    DhadaBookViewModel viewModel=DhadaBookViewModel.of(context);
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

                  Text("Date",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  DateTimePicker(
                    firstDate: DateTime(DateTime.now().year-10, DateTime.now().month, DateTime.now().day),
                    lastDate: DateTime.now(),
                    controller: viewModel.dateC,
                    decoration: const InputDecoration(
                      hintText: "Enter Date",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15,),


                  Text("Inward Date",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  DateTimePicker(
                    firstDate: DateTime(DateTime.now().year-10, DateTime.now().month, DateTime.now().day),
                    lastDate: DateTime.now(),
                    controller: viewModel.inWardDateC,
                    decoration: const InputDecoration(
                      hintText: "Enter Inward Date",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15,),


                  Text("Vehicle Number",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  TextFormField(
                    controller: viewModel.vehicleNumberC,
                    decoration: const InputDecoration(
                      hintText: "Enter Vehicle Number",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15,),




                  Text("Select Farmer",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  Selector<DhadaBookViewModel,Farmer?>(
                      shouldRebuild: (prev,nex)=>true,
                      selector: (buildContext , vm)=>vm.selectedFarmer,
                      builder: (context, Farmer? data,child) {
                      return FarmerSelectionWidget(
                        controller: viewModel.farmerC,
                        onFarmerSelected: (Farmer? selectedFarmer) {
                          viewModel.selectedFarmer=selectedFarmer;
                      },
                      selectedFarmer: data,

                      );
                    }
                  ),
                  const SizedBox(height: 15,),


                  // Uncomment For Text field for farmer input

                  // Text("Farmer Name",
                  //   style: theme.textTheme.titleSmall?.copyWith(
                  //       fontWeight: FontWeight.w500
                  //   ),),
                  // const SizedBox(height: 5,),
                  // TextFormField(
                  //   controller: viewModel.farmerNameC,
                  //   decoration: const InputDecoration(
                  //     hintText: "Enter Farmer Name",
                  //   ),
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Required field !';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  // const SizedBox(height: 15,),
                  //
                  //
                  //
                  //
                  // Text("Farmer Place",
                  //   style: theme.textTheme.titleSmall?.copyWith(
                  //       fontWeight: FontWeight.w500
                  //   ),),
                  // const SizedBox(height: 5,),
                  // TextFormField(
                  //   controller: viewModel.farmerPlaceC,
                  //   decoration: const InputDecoration(
                  //     hintText: "Enter Farmer Place",
                  //   ),
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Required field !';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  // const SizedBox(height: 15,),


                  Text("Lot Number",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  TextFormField(
                    controller: viewModel.lotNumberC,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Enter Lot Number",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15,),



                  Text("Package",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  TextFormField(
                    controller: viewModel.packageC,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Enter Package",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15,),
                  const DhadaBookDetailsWidget(),

                  const SizedBox(height: 10,),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        if (Form.of(ctx).validate()) {
                          if(viewModel.selectedFarmer?.address==null || viewModel.selectedFarmer?.firstName==null){
                            Alert.show("Select Farmer");
                          }
                          else {
                            viewModel.addDhadaBook(
                                id: widget.dhadaBookToUpdate?.id
                            );
                          }

                        }
                        else {
                          Alert.show("Fill all fields");
                        }
                      },
                      child:  Text(widget.dhadaBookToUpdate==null? 'Submit':"Update"),
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