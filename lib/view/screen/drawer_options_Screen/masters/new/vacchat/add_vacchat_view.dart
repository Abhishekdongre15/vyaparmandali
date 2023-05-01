import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vyaparmandali/app_manager/helper/alert.dart';
import 'package:vyaparmandali/model/vacchat.dart';
import 'package:vyaparmandali/view/screen/drawer_options_Screen/masters/new/vacchat/widgets/vacchat_details_widget.dart';
import 'package:vyaparmandali/view_model/vacchat_view_model.dart';

class AddVacchatView extends StatefulWidget {
  final Vacchat? vacchatToUpdate;
  const AddVacchatView({Key? key, this.vacchatToUpdate}) : super(key: key);

  @override
  State<AddVacchatView> createState() => _AddVacchatViewState();
}

class _AddVacchatViewState extends State<AddVacchatView> {


  @override
  void initState() {
    super.initState();
    get();
  }

  void get() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if(widget.vacchatToUpdate==null){
        VacchatViewModel.of(context).initiateAddVacchat();
      }
      else {
        VacchatViewModel.of(context).initiateUpdateVacchat(widget.vacchatToUpdate!);

      }
      setState(() {

      });
    });
  }


  @override
  Widget build(BuildContext context) {
    VacchatViewModel viewModel=VacchatViewModel.of(context);
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
                  Text("Joining Date",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  DateTimePicker(
                    firstDate: DateTime(DateTime.now().year-10, DateTime.now().month, DateTime.now().day),
                    lastDate: DateTime.now(),
                    controller: viewModel.dateC,
                    decoration: const InputDecoration(
                      hintText: "Enter Joining Date",
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
                  Text("Total Package",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  TextFormField(
                    controller: viewModel.totalPackageC,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.singleLineFormatter,
                      FilteringTextInputFormatter.digitsOnly,
                    ], // O
                    decoration: const InputDecoration(
                      hintText: "Enter Total Package",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                    onChanged: (val){
                      viewModel.calculatePackageDifference();
                    },
                  ),


                  const SizedBox(height: 15,),
                  Text("Vasuli Dar",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  TextFormField(
                    controller: viewModel.vasuliDarC,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Enter Vasuli Dar",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),
                  const VacchatDetailsWidget(),
                  const SizedBox(height: 10,),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        if (Form.of(ctx).validate()) {
                          if(viewModel.packageDifference<0){
                            Alert.show("Distribute packages properly");
                          }
                          else{
                            viewModel.addVacchat(
                                id: widget.vacchatToUpdate?.id
                            );
                          }

                        }
                        else {
                          Alert.show("Fill all fields");
                        }
                      },
                      child:  Text(widget.vacchatToUpdate==null? 'Submit':"Update"),
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