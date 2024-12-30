import 'package:beba_driver/ui/common/app_colors.dart';
import 'package:beba_driver/ui/common/size_config.dart';
import 'package:beba_driver/ui/common/text_styles.dart';
import 'package:beba_driver/ui/views/home/models/delivery_model.dart';
import 'package:beba_driver/ui/views/widgets/order_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

class BidChildView extends StatelessWidget {
  final String bidType;
  final bool isLoading;
  final List<SingleDelivery>? delivery;
  const BidChildView(
      {super.key,
      required this.bidType,
      this.delivery,
      required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            isLoading
                ? Expanded(
                    child: ListView(
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
                    ),
                  )
                : delivery!.isEmpty
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
                                  color: Colors.black.withValues(alpha: 0.05),
                                  offset: const Offset(0, 4),
                                )
                              ],
                            ),
                            width: SizeConfig.screenWidth,
                            height: getProportionateScreenHeight(500),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/no_request.svg",
                                  height: getProportionateScreenHeight(80),
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(
                                  height: getProportionateScreenHeight(25),
                                ),
                                Text(
                                  "No Request Available",
                                  style: robotoSemiBold.copyWith(
                                    color: MyColor.primary40,
                                    fontSize: getProportionateScreenHeight(14),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: delivery!.length,
                          itemBuilder: (context, index) {
                            return OrderContainerWidget(
                              isMatched: false,
                              delivery: delivery![index],
                            );
                          },
                        ),
                      )
          ],
        ),
      ),
    );
  }
}
