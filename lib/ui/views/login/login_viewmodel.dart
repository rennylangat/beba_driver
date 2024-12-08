import 'package:beba_driver/app/app.locator.dart';
import 'package:beba_driver/app/app.router.dart';
import 'package:beba_driver/ui/common/app_colors.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final _navigatorService = locator<NavigationService>();
  bool isLogin = true;
  final TextEditingController phoneController = TextEditingController(),
      nameController = TextEditingController(),
      passwordController = TextEditingController(),
      confirmPasswordController = TextEditingController();

  GlobalKey<FormState> regFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  late final FlCountryCodePicker flCountryCodePicker;
  CountryCode? countryCode;

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

  loginUser() {
    // if (loginFormKey.currentState!.validate()) {
    // login user
    _navigatorService.replaceWithHomeView();
    // }
  }
}
