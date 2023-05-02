import 'package:flutter/material.dart';
import 'package:vyaparmandali/app_manager/helper/alert.dart';
import 'package:vyaparmandali/model/vehicle.dart';
import 'package:vyaparmandali/view_model/vehicle_view_model.dart';

class AddVehicleView extends StatefulWidget {
  final Vehicle? vehicleToUpdate;
  const AddVehicleView({Key? key, this.vehicleToUpdate}) : super(key: key);

  @override
  State<AddVehicleView> createState() => _AddVehicleViewState();
}

class _AddVehicleViewState extends State<AddVehicleView> {


  @override
  void initState() {
    super.initState();
    get();
  }

  void get() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if(widget.vehicleToUpdate==null){
        VehicleViewModel.of(context).initiateAddVehicle();
      }
      else {
        VehicleViewModel.of(context).initiateUpdateVehicle(widget.vehicleToUpdate!);
      }

    });
  }


  @override
  Widget build(BuildContext context) {
    VehicleViewModel viewModel=VehicleViewModel.of(context);
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

                  Text("Owner Name",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  TextFormField(
                    controller: viewModel.ownerNameC,
                    decoration: const InputDecoration(
                      hintText: "Enter Owner Name",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15,),


                  Text("Vehicle Name",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  TextFormField(
                    controller: viewModel.vehicleNameC,
                    decoration: const InputDecoration(
                      hintText: "Enter Vehicle Name",
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


                  const SizedBox(height: 10,),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        if (Form.of(ctx).validate()) {
                          viewModel.addVehicle(
                              id: widget.vehicleToUpdate?.id
                          );
                        }
                        else {
                          Alert.show("Fill all fields");
                        }
                      },
                      child:  Text(widget.vehicleToUpdate==null? 'Submit':"Update"),
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