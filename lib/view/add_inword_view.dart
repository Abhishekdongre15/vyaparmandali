import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uitoolkit/uitoolkit.dart';

class AddInWordListView extends StatefulWidget {
  const AddInWordListView({Key? key}) : super(key: key);

  @override
  State<AddInWordListView> createState() => _AddInWordListViewState();
}

class _AddInWordListViewState extends State<AddInWordListView> {
  TextEditingController snoController = TextEditingController();
  TextEditingController ddnameController = TextEditingController();
  TextEditingController vehicleController = TextEditingController();
  TextEditingController freightController = TextEditingController();
  TextEditingController itemTypeController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController hundekariController = TextEditingController();
  TextEditingController hundekariNamedController = TextEditingController();
  final DateTime _date = DateTime.now();
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
      if (!dateIsValid) {
        resultDate = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ToolkitColors.primary,
        title: Text("Add InWord Item",
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
            SizedBox(
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
                              hintText: "sr no",
                              label: "sr no",
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.singleLineFormatter,
                                FilteringTextInputFormatter.digitsOnly,
                              ], // O
                              controller: snoController,
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
                                youAreUnder18:
                                    'Sorry, you have to be 18 or older to apply',
                                setError: setError,
                              )),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: UIToolkit.textFormField(
                              hintText: "Vehicle No",
                              label: "Vehicle No",
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.singleLineFormatter,
                                FilteringTextInputFormatter.digitsOnly,
                              ], // O
                              controller: vehicleController,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: UIToolkit.textFormField(
                              hintText: " Total Quantity",
                              label: "Total Quantity",
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.singleLineFormatter,
                                FilteringTextInputFormatter.digitsOnly,
                              ], // O
                              controller: quantityController,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: UIToolkit.textFormField(
                              hintText: " Vacchut Name",
                              label: "Vacchut Name",
                              // O
                              controller: snoController,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: UIToolkit.textFormField(
                              hintText: " Freight",
                              label: "Freight",
                              controller: freightController,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: UIToolkit.textFormField(
                              hintText: " Hundekari",
                              label: "Hundekari",
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.singleLineFormatter,
                                FilteringTextInputFormatter.digitsOnly,
                              ], // O
                              controller: hundekariController,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: UIToolkit.textFormField(
                              hintText: " Item Type",
                              label: "Item Type",
                              // O
                              controller: itemTypeController,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: UIToolkit.textFormField(
                              hintText: "Hundekari Name",
                              label: "Hundekari Name",
                              controller: hundekariNamedController,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: UIToolkit.textFormField(
                        hintText: "D D Name",
                        label: "D D Name",
                        controller: ddnameController,
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
