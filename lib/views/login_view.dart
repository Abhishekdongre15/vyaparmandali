import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uitoolkit/uitoolkit.dart';
import 'package:vyaparmandali/app_manager/helper/responsive/widget/responsive_screen.dart';
import 'package:vyaparmandali/util/email_validation.dart';
import 'package:vyaparmandali/views/enquiry_detail_view.dart';

import '../controller/simple_ui_controller.dart';
import '../responsive/desktop_body.dart';
import '../responsive/mobile_body.dart';
import '../responsive/responsive_layout.dart';
import '../responsive/tablet_body.dart';
import '../util/constants.dart';
import 'forget_password_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  SimpleUIController simpleUIController = Get.put(SimpleUIController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/farm_background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: _buildLargeScreen(size, simpleUIController, theme),
              ),
            ),
          )),
    );
  }

  Widget _buildLargeScreen(
      Size size, SimpleUIController simpleUIController, ThemeData theme) {
    return Center(child: _buildMainBody(size, simpleUIController, theme));
  }


  /// Main Body
  Widget _buildMainBody(
      Size size, SimpleUIController simpleUIController, ThemeData theme) {
    return MyResponsiveScreen(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: size.width > 600
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.bottomCenter,
            child: CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(
                  'https://media.istockphoto.com/photos/millennial-male-team-leader-organize-virtual-workshop-with-employees-picture-id1300972574?b=1&k=20&m=1300972574&s=170667a&w=0&h=2nBGC7tr0kWIU8zRQ3dMg-C5JLo9H2sNUuDjQ5mlYfo='),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Welcome to,',
              style: kLoginSubtitleStyle(size),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Vyapar Mandali',
              style: kLoginTitleStyle(size),
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  UIToolkit.textFormField(
                    style: kTextFormFieldStyle()
                        .copyWith(color: ToolkitColors.white),
                    controller: emailController,
                    hintStyle: ToolkitTypography.body1B
                        .copyWith(color: ToolkitColors.white),
                    hintText: 'Please Enter Email ID',
                    // The validator receives the text that the user has entered.
                    validator: (String? input) {
                      return input!.isValidEmail()
                          ? null
                          : "Please enter proper email ID";
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),          /// password
                  Obx(
                    () {
                      return UIToolkit.textFormField(
                        style: kTextFormFieldStyle()
                            .copyWith(color: ToolkitColors.white),
                        controller: passwordController,
                        obscureText: simpleUIController.isObscure.value,
                        hintText: 'Please Enter Password',
                        hintStyle: ToolkitTypography.body1B
                            .copyWith(color: ToolkitColors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          } else if (value.length < 6) {
                            return 'At least enter 6 characters';
                          }
                          return null;
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),          signUpButton(theme),
                  SizedBox(
                    height: size.height * 0.03,
                  ),          /// Navigate To Login Screen
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (ctx) => const EnquiryDetailView()));
                      nameController.clear();
                      emailController.clear();
                      passwordController.clear();
                      _formKey.currentState?.reset();              simpleUIController.isObscure.value = true;
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Need an Account?',
                        style: kHaveAnAccountStyle(size)
                            .copyWith(color: ToolkitColors.white),
                        children: [
                          TextSpan(
                              text: " Fill Form",
                              style: kLoginOrSignUpTextStyle(size)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (ctx) => const ForgetPasswordView()));
                      nameController.clear();
                      emailController.clear();
                      passwordController.clear();
                      _formKey.currentState?.reset();              simpleUIController.isObscure.value = true;
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Forget Your Password?',
                        style: kHaveAnAccountStyle(size)
                            .copyWith(color: ToolkitColors.white),
                        children: [
                          TextSpan(
                              text: " Reset Here",
                              style: kLoginOrSignUpTextStyle(size)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // SignUp Button
  Widget signUpButton(ThemeData theme) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child:  UIToolkitButtons.primaryButton(
        onPressed: () {
          // Validate returns true if the form is valid, or false otherwise.
          if (_formKey.currentState!.validate()) {
            // ... Navigate To your Home Page
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const ResponsiveLayout(
                  mobileBody: MobileScaffold(),
                  tabletBody: TabletScaffold(),
                  desktopBody: DesktopScaffold(),
                );
              },
            ));
          }
        }, text: 'Login',

      ),
    );
  }
}
