import 'package:flutter/material.dart';
import 'package:vyaparmandali/app_manager/helper/alert.dart';
import 'package:vyaparmandali/model/agent.dart';
import 'package:vyaparmandali/view_model/agent_view_model.dart';

class AddAgentView extends StatefulWidget {
  final Agent? agentToUpdate;
  const AddAgentView({Key? key, this.agentToUpdate}) : super(key: key);

  @override
  State<AddAgentView> createState() => _AddAgentViewState();
}

class _AddAgentViewState extends State<AddAgentView> {


  @override
  void initState() {
    super.initState();
    get();
  }

  void get() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if(widget.agentToUpdate==null){
        AgentViewModel.of(context).initiateAddAgent();
      }
      else {
        AgentViewModel.of(context).initiateUpdateAgent(widget.agentToUpdate!);
      }

    });
  }


  @override
  Widget build(BuildContext context) {
    AgentViewModel viewModel=AgentViewModel.of(context);
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
                  Text("Agent Code",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  TextFormField(
                    controller: viewModel.agentCodeC,
                    decoration: const InputDecoration(
                      hintText: "Enter Agent Code",
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15,),
                  Text("Agent Name",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  TextFormField(
                    controller: viewModel.agentNameC,
                    decoration: const InputDecoration(
                      hintText: "Enter Agent Name",
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


                  const SizedBox(height: 15,),
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
                  Text("Branch Name",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  TextFormField(
                    controller: viewModel.branchNameC,
                    decoration: const InputDecoration(
                      hintText: "Enter Branch Name",
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

                  const SizedBox(height: 15,),
                  Text("Account Number",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500
                    ),),
                  const SizedBox(height: 5,),
                  TextFormField(
                    controller: viewModel.accountNumberC,
                    decoration: const InputDecoration(
                      hintText: "Enter Account Number",
                      counterText: "",
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 17,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field !';
                      }
                      else if (value.length<8) {
                        return 'Enter Valid Account Number';
                      }
                      return null;
                    },
                  ),


                  const SizedBox(height: 10,),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        if (Form.of(ctx).validate()) {
                          viewModel.addAgent(
                              id: widget.agentToUpdate?.id
                          );
                        }
                        else {
                          Alert.show("Fill all fields");
                        }
                      },
                      child:  Text(widget.agentToUpdate==null? 'Submit':"Update"),
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