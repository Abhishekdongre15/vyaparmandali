import 'package:flutter/material.dart';
import 'package:vyaparmandali/app_manager/helper/alert.dart';
import 'package:vyaparmandali/model/narration.dart';
import 'package:vyaparmandali/view_model/narration_view_model.dart';

class AddNarrationView extends StatefulWidget {
  final Narration? narrationToUpdate;
  const AddNarrationView({Key? key, this.narrationToUpdate}) : super(key: key);

  @override
  State<AddNarrationView> createState() => _AddNarrationViewState();
}

class _AddNarrationViewState extends State<AddNarrationView> {


  @override
  void initState() {
    super.initState();
    get();
  }

  void get() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if(widget.narrationToUpdate==null){
        NarrationViewModel.of(context).initiateAddNarration();
      }
      else {
        NarrationViewModel.of(context).initiateUpdateNarration(widget.narrationToUpdate!);
      }

    });
  }


  @override
  Widget build(BuildContext context) {
    NarrationViewModel viewModel=NarrationViewModel.of(context);
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
                  Text("Code",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  TextFormField(
                    controller: viewModel.codeC,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Enter Code",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15,),
                  Text("Description",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  TextFormField(
                    controller: viewModel.descriptionC,
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
                  const SizedBox(height: 10,),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        if (Form.of(ctx).validate()) {
                          viewModel.addNarration(
                            id: widget.narrationToUpdate?.id
                          );
                        }
                        else {
                          Alert.show("Fill all fields");
                        }
                      },
                      child:  Text(widget.narrationToUpdate==null? 'Submit':"Update"),
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