import 'package:flutter/material.dart';
import 'package:vyaparmandali/app_manager/helper/alert.dart';
import 'package:vyaparmandali/model/Weight.dart';
import 'package:vyaparmandali/view_model/weight_view_model.dart';

class AddWeightView extends StatefulWidget {
  final Weight? weightToUpdate;
  const AddWeightView({Key? key, this.weightToUpdate}) : super(key: key);

  @override
  State<AddWeightView> createState() => _AddWeightViewState();
}

class _AddWeightViewState extends State<AddWeightView> {


  @override
  void initState() {
    super.initState();
    get();
  }

  void get() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if(widget.weightToUpdate==null){
        WeightViewModel.of(context).initiateAddWeight();
      }
      else {
        WeightViewModel.of(context).initiateUpdateWeight(widget.weightToUpdate!);
      }

    });
  }


  @override
  Widget build(BuildContext context) {
    WeightViewModel viewModel=WeightViewModel.of(context);
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
                  Text("Weight Name",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  TextFormField(
                    controller: viewModel.weightNameC,
                    decoration: const InputDecoration(
                      hintText: "Enter Weight Name",
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
                          viewModel.addWeight(
                              id: widget.weightToUpdate?.id
                          );
                        }
                        else {
                          Alert.show("Fill all fields");
                        }
                      },
                      child:  Text(widget.weightToUpdate==null? 'Submit':"Update"),
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