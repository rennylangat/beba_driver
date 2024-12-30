import 'dart:ui';

import 'package:beba_driver/app/app.locator.dart';
import 'package:beba_driver/ui/common/app_colors.dart';
import 'package:beba_driver/ui/common/size_config.dart';
import 'package:beba_driver/ui/common/text_styles.dart';
import 'package:beba_driver/ui/views/home/models/user_model.dart';
import 'package:beba_driver/ui/views/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get_secure_storage/get_secure_storage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends BaseViewModel {
  final box = GetSecureStorage();
  UserDetails? userDetails;
  List<Map<String, dynamic>> menuList = [
    {
      "title": "Basic Information",
      "icon": MdiIcons.accountCircleOutline,
      "route": ""
    },
    {"title": "Security", "icon": MdiIcons.security, "route": ""},
    {
      "title": "Verify Identity",
      "icon": MdiIcons.accountCheckOutline,
      "route": ""
    },
    {
      "title": "Privacy Policy",
      "icon": MdiIcons.shieldAccount,
      "route": "",
    },
    {"title": "Support", "icon": MdiIcons.helpCircleOutline, "route": ""},
    {
      "title": "Logout",
      "icon": MdiIcons.logout,
      "route": "",
    },
  ];

  void init() {
    userDetails = UserDetails.fromJson(box.read("userDetails"));
    notifyListeners();
  }

  logout({required BuildContext context}) async {
    showDialog(
      context: context,
      useSafeArea: true,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: AlertDialog(
            title: Center(
              child: Text(
                "Logout",
                style: robotoSemiBold.copyWith(
                  color: MyColor.primary,
                  fontSize: getProportionateScreenHeight(20),
                ),
              ),
            ),
            content: Text(
              "You are about to be logged out of your account. Are you sure you want to proceed?",
              textAlign: TextAlign.center,
              style: robotoRegular.copyWith(
                fontSize: getProportionateScreenHeight(12),
                color: MyColor.neutral2,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Cancel",
                  style: robotoSemiBold.copyWith(
                    color: MyColor.neutral2,
                    fontSize: getProportionateScreenHeight(14),
                  ),
                ),
              ),
              TextButton(
                onPressed: () async {
                  // await box.remove("userId");
                  // await box.remove("token");
                  // await box.remove("userDetails");
                  // await box.erase();
                  // await box.write("firstTime", false);

                  locator<NavigationService>()
                      .clearStackAndShowView(const LoginView());
                },
                child: Text(
                  "Logout",
                  style: robotoSemiBold.copyWith(
                    color: MyColor.primary,
                    fontSize: getProportionateScreenHeight(14),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
