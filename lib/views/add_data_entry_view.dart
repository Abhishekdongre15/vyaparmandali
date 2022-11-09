import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uitoolkit/uitoolkit.dart';

class AddDataEntryView extends StatefulWidget {
  const AddDataEntryView({Key? key}) : super(key: key);

  @override
  State<AddDataEntryView> createState() => _AddDataEntryViewState();
}

class _AddDataEntryViewState extends State<AddDataEntryView> {
  TextEditingController codeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  DateTime _date = DateTime.now();
  bool setError = false;
  bool dateIsValid = false;
  String resultDate = '';
  void _onDobEntered(DateTime? dob) {
    setState(() {
      resultDate = dob.toString();
    });
  }

  void _validDateCallBack(bool? value) {
    dateIsValid = value!;
    setState(() {
      if(!dateIsValid){
        resultDate ='';
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ToolkitColors.primary,
        title: Text("Add Group Item",
            style: ToolkitTypography.h2.copyWith(color: ToolkitColors.black)),
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back,
            color: ToolkitColors.black,
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
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
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: UIToolkit.textFormField(
                              hintText: "Code",
                              label: "Code",
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.singleLineFormatter,
                                FilteringTextInputFormatter.digitsOnly,
                              ], // O
                              controller: codeController,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: UIToolkit.buildDateWidget(
                                initialDate: _date,
                                validDateCallBack: _validDateCallBack,
                                onDobEntered: _onDobEntered,
                                isEmptyDate: 'Please Enter DOB',
                                inValidDateMsg: 'Invalid date format',
                                youAreUnder18: 'Sorry, you have to be 18 or older to apply',
                                setError: setError,)
                          ),),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: UIToolkit.textFormField(
                              hintText: "sr no",
                              label: "sr no",
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.singleLineFormatter,
                                FilteringTextInputFormatter.digitsOnly,
                              ], // O
                              controller: codeController,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: UIToolkit.textFormField(
                              hintText: "Code",
                              label: "Code",
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.singleLineFormatter,
                                FilteringTextInputFormatter.digitsOnly,
                              ], // O
                              controller: codeController,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: UIToolkit.textFormField(
                        hintText: "Code",
                        label: "Code",
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.singleLineFormatter,
                          FilteringTextInputFormatter.digitsOnly,
                        ], // O
                        controller: codeController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: UIToolkit.textFormField(
                        hintText: "Name",
                        label: "Name",
                        controller: nameController,
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
