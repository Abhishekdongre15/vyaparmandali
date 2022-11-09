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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ToolkitColors.primary,
        title: Text("Add Item"),
        leading: GestureDetector(child: Icon(Icons.arrow_back,),
          onTap: (){
            Navigator.of(context).pop();
          },),
      ),
      body: Container(
        height: MediaQuery.of(context).size.width * 1,
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
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Form(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: UIToolkit.textFormField(
                        hintText: "Name",
                        label: "Name",
                        inputFormatters: <TextInputFormatter>[

                        ], // abc
                        controller: nameController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: UIToolkit.textFormField(
                        hintText: "Email Id",
                        label: "Email Id",
                        controller: emailController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: UIToolkit.textFormField(
                        hintText: "Phone No)",
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),

                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.singleLineFormatter,
                          FilteringTextInputFormatter.digitsOnly,
                        ], // O
                        label: "Phone No",
                        controller: phoneController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: UIToolkit.textFormField(
                        hintText: "Opening Balance)",
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
                  ],
                ),
              ),
            ),
            UIToolkitButtons.primaryButton(
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
    );
  }
}