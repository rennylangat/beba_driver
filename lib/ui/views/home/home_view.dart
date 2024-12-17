import 'package:beba_driver/app/app.locator.dart';
import 'package:beba_driver/app/app.router.dart';
import 'package:beba_driver/ui/common/app_colors.dart';
import 'package:beba_driver/ui/common/size_config.dart';
import 'package:beba_driver/ui/common/text_styles.dart';
import 'package:beba_driver/ui/common/ui_helpers.dart';
import 'package:beba_driver/ui/views/widgets/custom_bottom_nav.dart';
import 'package:beba_driver/ui/views/widgets/custom_fab.dart';
import 'package:beba_driver/ui/views/widgets/order_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_svg/svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.primary40,
        toolbarHeight: getProportionateScreenHeight(100),
        leadingWidth: getProportionateScreenWidth(70),
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(
              "assets/images/user.png",
            ),
          ),
        ),
        centerTitle: false,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Gregory Amanyuka",
              style: robotoBold.copyWith(
                color: MyColor.colorWhite,
                fontSize: getProportionateScreenHeight(18),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
            Wrap(
              spacing: 10,
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: MyColor.neutral199,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Text(
                    "25 Trips",
                    style: robotoLight.copyWith(
                      color: MyColor.neutral150,
                      fontSize: getProportionateScreenHeight(9),
                    ),
                  ),
                ),
                const RatingStars(
                  valueLabelVisibility: false,
                  starSize: 12,
                  value: 4.5,
                  starSpacing: 2,
                  starColor: MyColor.secondary,
                ),
              ],
            )
          ],
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: SvgPicture.asset(
              "assets/icons/nav.svg",
              height: getProportionateScreenHeight(16),
              colorFilter:
                  const ColorFilter.mode(MyColor.colorWhite, BlendMode.srcIn),
            ),
          ),
          horizontalSpaceSmall,
          InkWell(
            onTap: () {},
            child: Icon(
              MdiIcons.bell,
              color: MyColor.colorWhite,
              size: 20,
            ),
          ),
          horizontalSpaceSmall,
        ],
      ),
      bottomNavigationBar: const CustomBottomNav(
        currentIndex: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: const CustomFAB(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Requests",
                  style: robotoMedium.copyWith(
                    fontSize: getProportionateScreenHeight(18),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          locator<NavigationService>()
                              .navigateTo(Routes.orderDetailsView);
                        },
                        child: const OrderContainerWidget(),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
