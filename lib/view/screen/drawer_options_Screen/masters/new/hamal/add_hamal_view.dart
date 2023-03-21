import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:vyaparmandali/app_manager/helper/alert.dart';
import 'package:vyaparmandali/model/hamal.dart';
import 'package:vyaparmandali/view_model/hamal_view_model.dart';

class AddHamalView extends StatefulWidget {
  final Hamal? hamalToUpdate;
  const AddHamalView({Key? key, this.hamalToUpdate}) : super(key: key);

  @override
  State<AddHamalView> createState() => _AddHamalViewState();
}

class _AddHamalViewState extends State<AddHamalView> {


  @override
  void initState() {
    super.initState();
    get();
  }

  void get() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if(widget.hamalToUpdate==null){
        HamalViewModel.of(context).initiateAddHamal();
      }
      else {
        HamalViewModel.of(context).initiateUpdateHamal(widget.hamalToUpdate!);
      }

    });
  }


  @override
  Widget build(BuildContext context) {
    HamalViewModel viewModel=HamalViewModel.of(context);
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
                  Text("Hamal Name",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  TextFormField(
                    controller: viewModel.hamalNameC,
                    decoration: const InputDecoration(
                      hintText: "Enter Hamal Name",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15,),
                  Text("Joining Date",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  DateTimePicker(
                    firstDate: DateTime(DateTime.now().year-10, DateTime.now().month, DateTime.now().day),
                    lastDate: DateTime.now(),
                    controller: viewModel.dateOfJoiningC,
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
                  const SizedBox(height: 10,),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        if (Form.of(ctx).validate()) {
                          viewModel.addHamal(
                              id: widget.hamalToUpdate?.id
                          );
                        }
                        else {
                          Alert.show("Fill all fields");
                        }
                      },
                      child:  Text(widget.hamalToUpdate==null? 'Submit':"Update"),
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