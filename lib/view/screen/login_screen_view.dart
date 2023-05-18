
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vyaparmandali/app_manager/component/colored_safe_area.dart';
import 'package:vyaparmandali/app_manager/component/password_field.dart';
import 'package:vyaparmandali/app_manager/helper/alert.dart';
import 'package:vyaparmandali/route_name.dart';
import 'package:vyaparmandali/app_manager/helper/responsive/responsive.dart';
import 'package:vyaparmandali/app_manager/helper/responsive/widget/responsive_screen.dart';
import 'package:vyaparmandali/app_manager/theme/color_constant.dart';
import 'package:vyaparmandali/app_manager/theme/widget_theme_data/custom_text_field_theme.dart';
import 'package:vyaparmandali/util/email_validation.dart';
import 'package:vyaparmandali/view_model/login_view_model.dart';

class LoginScreenView extends StatefulWidget {
  const LoginScreenView({Key? key}) : super(key: key);

  @override
  State<LoginScreenView> createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {


  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    LoginViewModel viewModel=LoginViewModel.of(context);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ColoredSafeArea(
        child:Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/farm_background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child:  Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: SingleChildScrollView(
                  child: MyResponsiveScreen(
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
                            style: theme.textTheme.headlineSmall,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Vyapar Mandali',
                            style: theme.textTheme.headlineLarge!.copyWith(
                                color: Colors.black
                            ),
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
                                TextFormField(
                                  controller: viewModel.emailC,
                                  style: const TextStyle(color: AppColor.grey),
                                  decoration:  InputDecoration(
                                      hintText: 'Please Enter Email ID',
                                      contentPadding: !Responsive.isSmallScreen(context)?  const EdgeInsets.all(20): null
                                  ).applyDefaults(CustomTextFieldTheme.secondary),
                                  validator: (String? val) {
                                    if (val == null || val.trim().isEmpty) {
                                      return "Required field";
                                    } else if (!val.isValidEmail()) {
                                      return "Please enter valid email id";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),

                                PasswordField(
                                  style: const TextStyle(color: AppColor.black),
                                  theme: CustomTextFieldTheme.secondary,
                                  controller: viewModel.passwordC,
                                  hintText: 'Please Enter Password',
                                  validator: (String? val) {
                                    if (val == null || val.trim().isEmpty) {
                                      return "Required field";
                                    } else if (val.length<6) {
                                      return "Please enter at least 6 digits";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                const SizedBox(height: 50,),
                                TextButton(
                                    style: TextButton.styleFrom(
                                        padding: !Responsive.isSmallScreen(context)?  const EdgeInsets.all(20): null
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        viewModel.login(
                                          context,
                                          email: viewModel.emailC.text,
                                          password: viewModel.passwordC.text,
                                        );
                                      }
                                      else {
                                        Alert.show("Fields are not validated");
                                      }
                                    }, child: const Center(child: Text("Login"),))   ,
                                SizedBox(
                                  height: size.height * 0.03,
                                ),          /// Navigate To Login Screen
                                GestureDetector(
                                  onTap: () {
                                    context.go(RoutePath.registrationScreenView);
                                  },
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Need an Account?',
                                      style: theme.textTheme.titleMedium?.copyWith(
                                        color: Colors.white
                                      ),
                                      children: [
                                        TextSpan(
                                          text: " Fill Form",
                                          style: theme.textTheme.titleMedium!.copyWith(
                                              color: AppColor.primaryColor
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context.go(RoutePath.forgetPasswordView);
                                  },
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Forget Your Password?',
                                      style: theme.textTheme.titleMedium?.copyWith(
                                          color: Colors.white
                                      ),
                                      children: [
                                        TextSpan(
                                          text: " Reset Here",
                                          style: theme.textTheme.titleMedium!.copyWith(
                                              color: AppColor.primaryColor
                                          ),),
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
                  ),
                ),
              )),
        ),
      ),
    );
  }



}
