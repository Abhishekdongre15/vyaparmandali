import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uitoolkit/uitoolkit.dart';

class AddPlaceMaster extends StatefulWidget {
  const AddPlaceMaster({Key? key}) : super(key: key);

  @override
  State<AddPlaceMaster> createState() => _AddPlaceMasterState();
}

class _AddPlaceMasterState extends State<AddPlaceMaster> {
  TextEditingController marathiNameController = TextEditingController();
  TextEditingController placeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ToolkitColors.primary,
        title:  Text("Add Place Master",style: ToolkitTypography.h2.copyWith(color: ToolkitColors.black)),
        leading: GestureDetector(child: const Icon(Icons.arrow_back,color:  ToolkitColors.black,),
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
                        hintText: "Place name",
                        label: "Place name",

                        controller: placeController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: UIToolkit.textFormField(
                        hintText: "Product Name",
                        label: "Product Name",
                        controller: marathiNameController,
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