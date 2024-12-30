import 'package:beba_driver/ui/common/app_colors.dart';
import 'package:beba_driver/ui/common/size_config.dart';
import 'package:beba_driver/ui/common/text_styles.dart';
import 'package:beba_driver/ui/views/widgets/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked.dart';

import 'otp_viewmodel.dart';

class OtpView extends StackedView<OtpViewModel> {
  final String phoneNumber;
  final String userId;
  const OtpView(this.phoneNumber, this.userId, {Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OtpViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: MyColor.colorWhite,
      body: SafeArea(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: SizeConfig.screenHeight * 0.85,
            minHeight: SizeConfig.screenHeight * 0.85,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:
                            "We've sent an SMS with an OTP Code to your phone ",
                        style: robotoRegular.copyWith(
                          fontSize: getProportionateScreenHeight(16),
                        ),
                      ),
                      TextSpan(
                        text: viewModel.phoneNumber,
                        style: robotoBold.copyWith(
                          fontSize: getProportionateScreenHeight(16),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(28),
                ),
                Text(
                  "Enter OTP",
                  style: robotoRegular.copyWith(
                      fontSize: getProportionateScreenHeight(10)),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(5),
                ),
                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  pastedTextStyle: const TextStyle(
                    color: MyColor.primary,
                    fontWeight: FontWeight.bold,
                  ),
                  enablePinAutofill: true,
                  useHapticFeedback: true,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: 45,
                    fieldWidth: 50,
                    borderWidth: 0.05,
                    selectedColor: MyColor.chipBgColor,
                    activeFillColor: MyColor.textBoxFillColor,
                    inactiveFillColor: MyColor.neutral199,
                    selectedFillColor: Colors.white,
                    activeColor: MyColor.successColor,
                    inactiveColor: MyColor.utilityOutline,
                  ),
                  keyboardType: TextInputType.number,
                  cursorColor: MyColor.primary,
                  animationType: AnimationType.fade,
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  autoDismissKeyboard: true,
                  onCompleted: (v) {
                    viewModel.setOtp(v);
                  },
                  onChanged: (value) {},
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                CustomButton(
                  title: "Verify Code",
                  onTap: () {
                    viewModel.verifyOTP();
                  },
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Send Code again in ",
                        style: robotoRegular.copyWith(
                          fontSize: getProportionateScreenHeight(14),
                          color: MyColor.neutral150,
                        ),
                      ),
                      TextSpan(
                        text: viewModel.remTime == 0
                            ? "Resend"
                            : "00:${viewModel.remTime}",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            viewModel.resendOTP();
                          },
                        style: robotoSemiBold.copyWith(
                            fontSize: getProportionateScreenHeight(14)),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                RichText(
                  text: TextSpan(
                    text: "Having a problem signing in?",
                    style: robotoLight.copyWith(color: MyColor.primary),
                    children: [
                      TextSpan(
                        text: " Help",
                        style: robotoSemiBold.copyWith(color: MyColor.primary),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  OtpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OtpViewModel();

  @override
  void onViewModelReady(OtpViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.init(
      phoneNumber: phoneNumber,
      userId: userId,
    );
  }
}
