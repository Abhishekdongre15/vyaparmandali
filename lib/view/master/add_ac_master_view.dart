import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uitoolkit/uitoolkit.dart';

class AddACMasterList extends StatefulWidget {
  const AddACMasterList({Key? key}) : super(key: key);

  @override
  State<AddACMasterList> createState() => _AddACMasterListState();
}

class _AddACMasterListState extends State<AddACMasterList> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController openingController = TextEditingController();
  TextEditingController panNoController = TextEditingController();
  TextEditingController ledgerNoController = TextEditingController();
  TextEditingController placeNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ToolkitColors.primary,
        title: const Text("Add Item"),
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back,
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ToolkitColors.whiteBackground,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.6,
              width: width * 0.5,
              child: Form(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(height * 0.001),
                      child: UIToolkit.textFormField(
                        hintText: "Name",
                        label: "Name",
                        inputFormatters: <TextInputFormatter>[], // abc
                        controller: nameController,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(height * 0.001),
                      child: UIToolkit.textFormField(
                        hintText: "Email Id",
                        label: "Email Id",
                        controller: emailController,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(height * 0.001),
                      child: UIToolkit.textFormField(
                        hintText: "Place",
                        label: "Place",
                        controller: placeNameController,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(height * 0.001),
                      child: UIToolkit.textFormField(
                        hintText: "Phone No)",
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),

                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.singleLineFormatter,
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        // O
                        label: "Phone No",
                        controller: phoneController,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.all(height * 0.001),
                            child: UIToolkit.textFormField(
                              hintText: "Ledger No",
                              keyboardType:
                              const TextInputType.numberWithOptions(
                                  decimal: true),

                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.singleLineFormatter,
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              // O
                              label: "Ledger No",
                              controller: ledgerNoController,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.all(height * 0.001),
                            child: UIToolkit.textFormField(
                              hintText: "Pan No",
                              keyboardType:
                              const TextInputType.numberWithOptions(
                                  decimal: true),

                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.singleLineFormatter,
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              // O
                              label: "Pan No",
                              controller: panNoController,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(height * 0.01),
                      child: UIToolkit.textFormField(
                        hintText: "Opening Balance",
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),

                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.singleLineFormatter,
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        // O
                        label: "Opening Balance",
                        controller: openingController,
                      ),
                    ),
                    UIToolkitButtons.primaryButton(
                      style: const ButtonStyle(

                      ),
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        // if (_formKey.currentState!.validate()) {
                        //   // ... Navigate To your Home Page
                        // }

                      },
                      text: 'Submit',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
