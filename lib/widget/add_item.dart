import 'package:flutter/material.dart';
import 'package:uitoolkit/uitoolkit.dart';

class AddItems extends StatelessWidget {
  AddItems({Key? key}) : super(key: key);
  TextEditingController codeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController rateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ToolkitColors.primary,
      ),
      body: Container(
        height: MediaQuery.of(context).size.width * 1,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ToolkitColors.whiteBackground,
        ),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.5,
              width: MediaQuery.of(context).size.width*0.5,
              child: Form(
                child: Column(
                  children: [
                    UIToolkit.textFormField(
                      hintText: "Code no",
                      label: "Code no",
                      controller: codeController,
                    ),
                    UIToolkit.textFormField(
                      hintText: "Product Name",
                      label: "Product Name",
                      controller: nameController,
                    ),
                    UIToolkit.textFormField(
                      hintText: "Rate",
                      label: "Rate",
                      controller: rateController,
                    ),
                  ],
                ),
              ),
            ),
            submitAddButton(context),
          ],
        ),
      ),
    );

  }

  Widget submitAddButton(context) {
    return Builder(
      builder: (BuildContext context) { return SizedBox(
        width: MediaQuery.of(context).size.width*0.5,
        height: 55,
        child:  UIToolkitButtons.primaryButton(
          onPressed: () {
            // Validate returns true if the form is valid, or false otherwise.
            // if (_formKey.currentState!.validate()) {
            //   // ... Navigate To your Home Page
            // }
          },
          text: 'Submit',
        ),
      ); },

    );
  }
}
