import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:uitoolkit/uitoolkit.dart';
import 'package:vyaparmandali/app_manager/component/colored_safe_area.dart';
import 'package:vyaparmandali/app_manager/component/password_field.dart';
import 'package:vyaparmandali/app_manager/extension/valid_password.dart';
import 'package:vyaparmandali/app_manager/helper/alert.dart';
import 'package:vyaparmandali/gen/assets.gen.dart';
import 'package:vyaparmandali/model/user.dart';
import 'package:vyaparmandali/util/email_validation.dart';
import 'package:vyaparmandali/view_model/registration_view_model.dart';

import '../../util/constants.dart';


class RegistrationScreenView extends StatefulWidget {
  const RegistrationScreenView({Key? key}) : super(key: key);

  @override
  State<RegistrationScreenView> createState() => _RegistrationScreenViewState();
}

class _RegistrationScreenViewState extends State<RegistrationScreenView> {
  User? updateUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }

  get(){

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      updateUser = ModalRoute.of(context)!.settings.arguments as User?;
      if(updateUser!=null){
        RegistrationViewModel.of(context).initiateUpdate(
            updateUser!
        );
      }else{
        RegistrationViewModel.of(context).initiate();
      }
    });

  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    RegistrationViewModel viewModel=RegistrationViewModel.of(context);
    Widget mainBody=SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: size.width > 600
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: [
          size.width > 600
              ? Container()
              : Lottie.asset(
            Assets.json.progressJson,

            width: size.width,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              updateUser!=null? "Update":'Fill Form',
              style: kLoginTitleStyle(size),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              updateUser!=null? "profile":'Welcome Here',
              style: kLoginSubtitleStyle(size),
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Form(
              child: Builder(
                builder: (ctx) {

                  Widget submitButton=TextButton(
                    onPressed: () {
                      if (Form.of(ctx).validate()) {
                          viewModel.onPressSubmit(updateUser);


                      }
                      else{
                        Alert.show("Fields are Not validated");
                      }
                    },
                    child:  Center(child: Text(updateUser!=null? "Update Profile":'Submit Form'),),
                  );
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: viewModel.firstNameC,
                              decoration: const InputDecoration(
                                hintText: 'First Name ',
                              ),
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter First Name';
                                } else if (value.length < 4) {
                                  return 'at least enter 4 characters';
                                } else if (value.length > 13) {
                                  return 'maximum character is 13';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: "Last Name",
                              ),
                              controller: viewModel.lastNameC,
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Last Name';
                                } else if (value.length < 4) {
                                  return 'at least enter 4 characters';
                                } else if (value.length > 13) {
                                  return 'maximum character is 13';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextFormField(
                              maxLength: 10,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: 'phone number',
                                counterText: "",
                                prefixIcon: Icon(Icons.phone),
                                prefixIconConstraints: BoxConstraints(
                                    maxHeight: 20,
                                    maxWidth: 30,
                                    minWidth: 30
                                ),
                              ),
                              controller: viewModel.contactNoC,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter phone no';
                                } else if (value.length < 10) {
                                  return 'at least enter 10 characters';
                                } else if (value.length > 10) {
                                  return 'maximum character is 10';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),

                      /// email
                      TextFormField(
                        controller: viewModel.emailC,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.alternate_email_rounded),
                          prefixIconConstraints: BoxConstraints(
                              maxHeight: 20,
                              maxWidth: 30,
                              minWidth: 30
                          ),
                          hintText: 'Email',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the email';
                          } else if (!value.isValidEmail()) {
                            return 'Enter valid email';
                          }
                          return null;
                        },
                      ),
                      updateUser!=null? Container():SizedBox(
                        height: size.height * 0.02,
                      ),

                      updateUser!=null? Container():PasswordField(
                        controller: viewModel.passwordC,
                        hintText: "Enter Password",
                        prefixIcon: const Icon(Icons.password),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the password';
                          } else if (!value.isValidPassword()) {
                            return 'Enter valid password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      CSCPicker(
                        currentCountry: viewModel.country,
                        currentState: viewModel.state,
                        currentCity: viewModel.city,
                        layout: Layout.vertical,
                        // defaultCountry: DefaultCountry.India,
                        flagState: CountryFlag.ENABLE,
                        onCountryChanged: (country) {
                          viewModel.country=country;
                        },
                        onStateChanged: (state) {
                          viewModel.state=state;
                        },
                        onCityChanged: (city) {
                          viewModel.city=city;
                        },
                        dropdownDecoration: BoxDecoration(
                          border:
                          Border.all(color: ToolkitColors.primary, width: 1),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        disabledDropdownDecoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 1,
                            )),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),

                      /// Requirement
                      TextFormField(
                        maxLines: 10,
                        minLines: 1,
                        style: kTextFormFieldStyle(),
                        controller: viewModel.descriptionC,
                        decoration: const InputDecoration(
                          hintText: 'Enter Description',
                          label: Text('Description'),
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some query ';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      submitButton,
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      updateUser!=null? Container():GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: RichText(
                          text: TextSpan(
                            text: 'Have an account?',
                            style: kHaveAnAccountStyle(size),
                            children: [
                              TextSpan(
                                text: " Log in",
                                style: kLoginOrSignUpTextStyle(
                                  size,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      updateUser!=null? Container():SizedBox(
                        height: size.height * 0.02,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );



    Widget largeScreen=Row(
      children: [
        Expanded(
          flex: 4,
          child: RotatedBox(
            quarterTurns: 4,
            child: Lottie.asset(
              'assets/grocery.json',
              height: size.height * 0.3,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(width: size.width * 0.06),
        Expanded(
          flex: 5,
          child: mainBody,
        ),
      ],
    );



    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ColoredSafeArea(
        child: Scaffold(
          appBar: AppBar(
            title:  Text( updateUser!=null? "Update Profile":"Register"),
          ),
          backgroundColor: Colors.white,
          body: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                return largeScreen;
              } else {
                return Center(
                  child: mainBody,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

