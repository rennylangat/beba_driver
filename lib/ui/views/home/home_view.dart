import 'package:beba_driver/app/app.locator.dart';
import 'package:beba_driver/app/app.router.dart';
import 'package:beba_driver/ui/common/app_colors.dart';
import 'package:beba_driver/ui/common/size_config.dart';
import 'package:beba_driver/ui/common/text_styles.dart';
import 'package:beba_driver/ui/common/ui_helpers.dart';
import 'package:beba_driver/ui/views/widgets/order_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_svg/svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shimmer/shimmer.dart';
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
        title: viewModel.isBusy
            ? Shimmer.fromColors(
                baseColor: MyColor.primary40,
                highlightColor: MyColor.primary90,
                child: Container(
                  width: getProportionateScreenWidth(500),
                  height: getProportionateScreenHeight(50),
                  decoration: const BoxDecoration(
                    color: MyColor.colorWhite,
                  ),
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${viewModel.userDetails!.user.firstName} ${viewModel.userDetails!.user.lastName}",
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
                          "${viewModel.userDetails!.user.userRating.totalTrips} Trips",
                          style: robotoLight.copyWith(
                            color: MyColor.neutral150,
                            fontSize: getProportionateScreenHeight(9),
                          ),
                        ),
                      ),
                      RatingStars(
                        valueLabelVisibility: false,
                        starSize: 12,
                        value: viewModel
                            .userDetails!.user.userRating.overallRating,
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: RefreshIndicator(
            onRefresh: () async {
              await viewModel.initialise();
            },
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
                    child: viewModel.isBusy
                        ? ListView(
                            children: List.generate(
                              10,
                              (index) => Shimmer.fromColors(
                                baseColor: MyColor.shimmerBaseColor,
                                highlightColor: MyColor.shimmerSplashColor,
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 16),
                                  width: SizeConfig.screenWidth,
                                  height: getProportionateScreenHeight(85),
                                  decoration: BoxDecoration(
                                    color: MyColor.colorWhite,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : viewModel.myDeliveries!.deliveries.isEmpty
                            ? Center(
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: MyColor.colorWhite,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 8,
                                          color: Colors.black
                                              .withValues(alpha: 0.05),
                                          offset: const Offset(0, 4),
                                        )
                                      ],
                                    ),
                                    width: SizeConfig.screenWidth,
                                    height: getProportionateScreenHeight(500),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/no_request.svg",
                                          height:
                                              getProportionateScreenHeight(80),
                                          fit: BoxFit.contain,
                                        ),
                                        SizedBox(
                                          height:
                                              getProportionateScreenHeight(25),
                                        ),
                                        Text(
                                          "No Request Available",
                                          style: robotoSemiBold.copyWith(
                                            color: MyColor.primary40,
                                            fontSize:
                                                getProportionateScreenHeight(
                                                    14),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : ListView.builder(
                                itemCount:
                                    viewModel.myDeliveries!.deliveries.length,
                                itemBuilder: (context, index) {
                                  var delivery =
                                      viewModel.myDeliveries!.deliveries[index];
                                  return InkWell(
                                    onTap: () {
                                      locator<NavigationService>().navigateTo(
                                          Routes.orderDetailsView,
                                          arguments: OrderDetailsViewArguments(
                                              delivery: delivery));
                                    },
                                    child: OrderContainerWidget(
                                        delivery: delivery),
                                  );
                                },
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
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    viewModel.initialise();
    super.onViewModelReady(viewModel);
  }
}
