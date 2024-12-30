import 'package:beba_driver/ui/common/app_colors.dart';
import 'package:beba_driver/ui/common/size_config.dart';
import 'package:beba_driver/ui/common/text_styles.dart';
import 'package:beba_driver/ui/views/widgets/custom_button.dart';
import 'package:beba_driver/ui/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: MyColor.colorWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: SizeConfig.screenHeight * .85,
                minHeight: SizeConfig.screenHeight * .85,
                maxWidth: SizeConfig.screenWidth,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "assets/icons/beba_icon.svg",
                    width: getProportionateScreenWidth(48),
                    colorFilter: const ColorFilter.mode(
                      MyColor.primary40,
                      BlendMode.srcIn,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Let's  Sign you in",
                    style: robotoBold.copyWith(
                      fontSize: getProportionateScreenHeight(20),
                      color: MyColor.primary,
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  Container(
                    width: SizeConfig.screenWidth,
                    decoration: BoxDecoration(
                      color: MyColor.neutral199,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              viewModel.changeAuth();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                color: !viewModel.isLogin
                                    ? MyColor.neutral199
                                    : MyColor.colorWhite,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              alignment: Alignment.center,
                              child: const Text("Sign In"),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              viewModel.changeAuth();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                color: !viewModel.isLogin
                                    ? Colors.white
                                    : MyColor.neutral199,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "Sign Up",
                                style: robotoRegular.copyWith(
                                  fontSize: getProportionateScreenHeight(12),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(25),
                  ),
                  viewModel.isLogin
                      ? Form(
                          key: viewModel.loginFormKey,
                          child: AutofillGroup(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Phone"),
                                SizedBox(
                                  height: getProportionateScreenHeight(3),
                                ),
                                PhoneNumberField(
                                  viewModel: viewModel,
                                ),
                                SizedBox(
                                  height: getProportionateScreenHeight(15),
                                ),
                                const Text("Password"),
                                SizedBox(
                                  height: getProportionateScreenHeight(3),
                                ),
                                CustomTextField(
                                  isPassword: true,
                                  isShowSuffixIcon: true,
                                  hintText: "Password",
                                  controller: viewModel.passwordController,
                                  autofillHints: const [AutofillHints.password],
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Password is required";
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        )
                      : Form(
                          key: viewModel.regFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Phone"),
                              SizedBox(
                                height: getProportionateScreenHeight(3),
                              ),
                              PhoneNumberField(viewModel: viewModel),
                              SizedBox(
                                height: getProportionateScreenHeight(15),
                              ),
                              const Text("Full Name"),
                              SizedBox(
                                height: getProportionateScreenHeight(3),
                              ),
                              CustomTextField(
                                hintText: "John Doe",
                                controller: viewModel.nameController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Name is required";
                                  }
                                  if (value.split(" ").length < 2) {
                                    return "Please enter your full name";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(15),
                              ),
                              const Text("Password"),
                              SizedBox(
                                height: getProportionateScreenHeight(3),
                              ),
                              CustomTextField(
                                hintText: "Password",
                                controller: viewModel.passwordController,
                                isPassword: true,
                                isShowSuffixIcon: true,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Password is required";
                                  }
                                  if (value.length < 6) {
                                    return "Password must be at least 6 characters";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(15),
                              ),
                              const Text("Confirm Password"),
                              SizedBox(
                                height: getProportionateScreenHeight(3),
                              ),
                              CustomTextField(
                                hintText: "Password",
                                controller: viewModel.confirmPasswordController,
                                isPassword: true,
                                isShowSuffixIcon: true,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Password is required";
                                  }
                                  if (value !=
                                      viewModel.passwordController.text) {
                                    return "Passwords do not match";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(15),
                              ),
                            ],
                          ),
                        ),
                  SizedBox(
                    height: getProportionateScreenHeight(15),
                  ),
                  CustomButton(
                    title: viewModel.isLogin ? "Sign In" : "Send OTP",
                    onTap: () {
                      if (viewModel.isLogin) {
                        viewModel.loginUser();
                      } else {
                        viewModel.createUser();
                      }
                    },
                  ),
                  const Spacer(),
                  RichText(
                    text: TextSpan(
                      text: "Having a problem signing in?",
                      style: robotoLight.copyWith(color: MyColor.primary),
                      children: [
                        TextSpan(
                          text: " Help",
                          style:
                              robotoSemiBold.copyWith(color: MyColor.primary),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.initialize();
  }
}

class PhoneNumberField extends StatelessWidget {
  final LoginViewModel viewModel;
  const PhoneNumberField({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: viewModel.phoneController,
      maxLines: 1,
      // maxLength: 9,
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return "Phone number is required";
        } else {
          return null;
        }
      },
      autofillHints: const [AutofillHints.telephoneNumber],
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      onChanged: (value) {
        if (value.length > 2) {
          if (value.substring(0, 1) == "0") {
            viewModel.phoneController.text = value.substring(1);
            viewModel.rebuildUi();
          }
        }
        return;
      },
      cursorColor: Theme.of(context).primaryColor,
      maxLength: 9,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: "Phone number",
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 22),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: MyColor.borderColor, width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: MyColor.borderColor, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: MyColor.borderColor, width: 0.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red, width: 0.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: MyColor.primary, width: 0.5),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: MyColor.borderColor, width: 0.5),
        ),
        isDense: true,
        // fillColor: MyColor.bgColor1,

        hintStyle:
            robotoRegular.copyWith(fontSize: 14, color: MyColor.hintText),
        filled: true,
        fillColor: MyColor.textBoxFillColor,
        prefixIcon: GestureDetector(
          onTap: () async {
            await viewModel.pickCountry(context: context);
          },
          child: Container(
            // width: 20,
            // height: 40,

            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 14.0),
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              // color: MyColor.bgColor1,
              borderRadius: BorderRadius.circular(5.0),
            ),

            child: Text(
              "${viewModel.countryCode?.code == null ? "🇰🇪" : viewModel.countryCode?.code.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'), (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397))} ${viewModel.countryCode?.dialCode ?? "+254"}",
            ),
          ),
        ),
      ),
    );
  }
}
