import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uitoolkit/uitoolkit.dart';

class AddItemExp extends StatefulWidget {
  const AddItemExp({Key? key}) : super(key: key);

  @override
  State<AddItemExp> createState() => _AddItemExpState();
}

class _AddItemExpState extends State<AddItemExp> {
  TextEditingController codeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController srController = TextEditingController();
  TextEditingController pHamaliController = TextEditingController();
  TextEditingController bHamaliController = TextEditingController();
  TextEditingController mitmController = TextEditingController();
  TextEditingController totalController = TextEditingController();
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
        title: Text("Add Item Exp",
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
              width: MediaQuery.of(context).size.width * 0.8,
              child: Form(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: UIToolkit.textFormField(
                              hintText: "Comme",
                              label: "Comme",
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
                              controller: srController,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: UIToolkit.textFormField(
                              hintText: "Mitm_cd",
                              label: "Mitm_cd",
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.singleLineFormatter,
                                FilteringTextInputFormatter.digitsOnly,
                              ], // O
                              controller: mitmController,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: UIToolkit.textFormField(
                        hintText: " P.Hamali",
                        label: "P.Hamali",
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.singleLineFormatter,
                          FilteringTextInputFormatter.digitsOnly,
                        ], // O
                        controller: pHamaliController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: UIToolkit.textFormField(
                        hintText: "B.Hamali",
                        label: "B.Hamali",
                        controller: bHamaliController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: UIToolkit.textFormField(
                        hintText: "Total",
                        label: "Total",
                        controller: totalController,
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
