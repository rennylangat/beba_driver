import 'dart:developer';

import 'package:beba_driver/app/app.locator.dart';
import 'package:beba_driver/app/app.router.dart';
import 'package:beba_driver/services/auth_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OtpViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _navigatorService = locator<NavigationService>();

  String phoneNumber = '';
  String userId = '';
  var remTime = 30;
  String otp = '';
  void init({required String phoneNumber, required String userId}) {
    this.phoneNumber = phoneNumber;
    this.userId = userId;
    startCountDown();
  }

  startCountDown() async {
    await Future.delayed(const Duration(seconds: 1)).then((_) async {
      while (remTime <= 30 && remTime != 0) {
        await Future.delayed(const Duration(seconds: 1)).then((_) {
          remTime--;
          notifyListeners();
        });
      }
    });
    return;
  }

  setOtp(String value) {
    otp = value;
    notifyListeners();
  }

  verifyOTP() async {
    if (otp != "" && otp.length == 6) {
      EasyLoading.show(status: "Verifying OTP");
      log("OTP: $otp");
      final res = await _authService.verifyOtp(otp: otp, userId: userId);

      if (res.statusCode == 200) {
        EasyLoading.showSuccess("OTP Verified Successfully");

        _navigatorService.clearTillFirstAndShow(Routes.loginView);
      }
    }
  }

  resendOTP() async {
    final res = await _authService.resendOtp(userId: userId);
    if (res.statusCode == 200) {
      EasyLoading.show(status: "Resending...");
      remTime = 30;
      notifyListeners();
      startCountDown();
      EasyLoading.dismiss();
    } else {
      EasyLoading.showError("Failed to resend OTP");
    }
  }
}
