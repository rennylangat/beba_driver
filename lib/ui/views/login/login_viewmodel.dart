import 'dart:developer';

import 'package:beba_driver/app/app.locator.dart';
import 'package:beba_driver/app/app.router.dart';
import 'package:beba_driver/services/auth_service.dart';
import 'package:beba_driver/services/device_info_service.dart';
import 'package:beba_driver/ui/common/app_colors.dart';
import 'package:beba_driver/ui/views/widgets/cust_snackbar.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_secure_storage/get_secure_storage.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final _navigatorService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final _deviceInfoService = locator<DeviceInfoService>();
  bool isLogin = true;
  final TextEditingController phoneController = TextEditingController(),
      nameController = TextEditingController(),
      passwordController = TextEditingController(),
      confirmPasswordController = TextEditingController();

  GlobalKey<FormState> regFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  late final FlCountryCodePicker flCountryCodePicker;
  CountryCode? countryCode;
  final box = GetSecureStorage();

  void initialize() {
    countryCode =
        const CountryCode(name: 'Kenya', code: 'KE', dialCode: "+254");
    flCountryCodePicker = const FlCountryCodePicker(
      favoritesIcon: Icon(
        Icons.star,
        color: MyColor.primary,
      ),
    );
  }

  pickCountry({required BuildContext context}) async {
    final code = await flCountryCodePicker.showPicker(context: context);

    if (code != null) {
      countryCode = code;

      rebuildUi();
    }
  }

  changeAuth() {
    isLogin = !isLogin;
    rebuildUi();
  }

  loginUser() async {
    if (loginFormKey.currentState!.validate()) {
      log("Phone number: ${countryCode!.dialCode + phoneController.text}");
      final deviceId = await _deviceInfoService.getSimpleDeviceId();
      final deviceInfo = await _deviceInfoService.getDeviceInfo();
      log("Device Info $deviceId");
      EasyLoading.show(status: "Logging in...");
      final res = await _authService.loginUser(
        phone: countryCode!.dialCode.replaceAll("+", "") + phoneController.text,
        password: passwordController.text,
        deviceId: deviceId,
        deviceMeta: deviceInfo['deviceMetaTag'],
      );
      if (res.statusCode == 200) {
        if (res.data["user"]["user_role"] == 3) {
          box.write("token", res.data["access_token"]);
          box.write("refresh_token", res.data["refresh_token"]);
          box.write("userId", res.data["user"]["id"]);
          _navigatorService.navigateTo(Routes.bottomNavView);
        } else {
          CustSnackbar.showSnackBar(
            "Error",
            "Invalid user role",
            isError: true,
          );
        }
      }
    }
  }

  createUser() async {
    if (regFormKey.currentState!.validate()) {
      EasyLoading.show(status: "Registering user...");
      String firstName = nameController.text.trim().split(" ")[0];
      String lastName = nameController.text.trim().split(" ").length > 1
          ? nameController.text.trim().split(" ")[1]
          : "";
      final res = await _authService.createUser(
        phoneNumber: "254${phoneController.text}",
        firstName: firstName,
        lastName: lastName,
        password: passwordController.text.trim(),
        userRole: 3,
      );
      if (res.statusCode == 201) {
        CustSnackbar.showSnackBar("Success", "Account registered successfully");
        _navigatorService.clearStackAndShow(Routes.otpView,
            arguments: OtpViewArguments(
              phoneNumber: "254${phoneController.text}",
              userId: res.data["user"]["id"],
            ));
      }
    }
  }
}
