import 'package:beba_driver/ui/common/app_colors.dart';
import 'package:beba_driver/ui/common/size_config.dart';
import 'package:beba_driver/ui/common/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stacked/stacked.dart';

import 'profile_viewmodel.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.primary40,
        title: Text(
          "My Profile",
          style: robotoBold.copyWith(
            fontSize: getProportionateScreenHeight(15),
            color: MyColor.colorWhite,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: SizeConfig.screenHeight,
              minHeight: SizeConfig.screenHeight,
              maxWidth: SizeConfig.screenWidth,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      height: getProportionateScreenHeight(100),
                      width: getProportionateScreenWidth(100),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Center(
                            child: Container(
                              width: getProportionateScreenWidth(80),
                              height: getProportionateScreenHeight(80),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: MyColor.primary40,
                                  width: 2,
                                ),
                              ),
                              child: const CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    AssetImage("assets/images/user.png"),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 3,
                            bottom: 15,
                            child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: MyColor.colorWhite,
                                ),
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(
                                  MdiIcons.pencilOutline,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Text(
                    "John Doe",
                    style: robotoRegular.copyWith(
                      fontSize: getProportionateScreenHeight(20),
                      color: MyColor.primary40,
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(5),
                  ),
                  Text(
                    "+254 712 345 678",
                    style: robotoRegular.copyWith(
                      fontSize: getProportionateScreenHeight(15),
                      color: MyColor.primary40,
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  const Divider(
                    color: MyColor.strokeColor,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(12),
                  ),
                  Column(
                    children: [
                      ...viewModel.menuList.map((e) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                if (e == viewModel.menuList.last) {
                                  viewModel.logout(context: context);
                                }
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    left: 32, right: 32, bottom: 16, top: 16),
                                alignment: Alignment.center,
                                child: Row(
                                  children: [
                                    Icon(
                                      e["icon"],
                                      color: MyColor.secondary,
                                    ),
                                    SizedBox(
                                      width: getProportionateScreenWidth(10),
                                    ),
                                    Text(
                                      e["title"],
                                      style: robotoRegular.copyWith(
                                        fontSize:
                                            getProportionateScreenHeight(15),
                                        color: MyColor.primary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // if (viewModel.menuList.indexOf(e) == 1 ||
                            //     e == viewModel.menuList.last)
                            //   SizedBox(
                            //     height: getProportionateScreenHeight(10),
                            //   ),
                            if (viewModel.menuList.indexOf(e) == 1 ||
                                e == viewModel.menuList.last)
                              const Divider(
                                color: MyColor.strokeColor,
                              ),
                          ],
                        );
                      })
                    ],
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
  ProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProfileViewModel();
}
