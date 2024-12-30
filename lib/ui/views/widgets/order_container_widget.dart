import 'package:beba_driver/ui/common/app_colors.dart';
import 'package:beba_driver/ui/common/size_config.dart';
import 'package:beba_driver/ui/common/text_styles.dart';
import 'package:beba_driver/ui/common/ui_helpers.dart';
import 'package:beba_driver/ui/views/home/models/delivery_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class OrderContainerWidget extends StatelessWidget {
  final bool isMatched;

  final SingleDelivery? delivery;
  const OrderContainerWidget({
    super.key,
    this.isMatched = true,
    this.delivery,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: MyColor.colorWhite,
        boxShadow: [
          BoxShadow(
            color: MyColor.colorBlack.withValues(alpha: 0.05),
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(
                  "assets/images/user.png",
                ),
              ),
              horizontalSpaceSmall,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${delivery?.requestingUser.firstName} ${delivery?.requestingUser.lastName}",
                    style: robotoMedium.copyWith(
                      color: MyColor.primary40,
                      fontSize: getProportionateScreenHeight(12),
                    ),
                  ),
                  verticalSpaceTiny,
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
                          delivery?.requiredVehicleType.description ?? "",
                          style: robotoRegular.copyWith(
                            color: MyColor.neutral150,
                            fontSize: getProportionateScreenHeight(9),
                          ),
                        ),
                      ),
                      // const RatingStars(
                      //   valueLabelVisibility: false,
                      //   starSize: 12,
                      //   value: 4.5,
                      //   starSpacing: 2,
                      //   starColor: MyColor.secondary,
                      // ),
                    ],
                  )
                ],
              ),
              const Spacer(),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: delivery?.deliveryWeight,
                      style: robotoMedium.copyWith(
                        color: MyColor.secondary,
                        fontSize: getProportionateScreenHeight(16),
                      ),
                    ),
                    TextSpan(
                      text: " T. ",
                      style: robotoRegular.copyWith(
                        color: MyColor.neutral150,
                        fontSize: getProportionateScreenHeight(9),
                      ),
                    ),
                  ],
                ),
              ),
              horizontalSpaceSmall,
              if (!isMatched)
                Icon(
                  delivery?.deliveryStatus == "Accepted"
                      ? MdiIcons.checkboxOutline
                      : MdiIcons.closeBoxOutline,
                  color: delivery?.deliveryStatus == "Accepted"
                      ? MyColor.greenTextColor
                      : MyColor.cancelColor,
                  size: 20,
                )
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(2),
          ),
          const Divider(
            color: MyColor.utilityOutline,
            thickness: 1,
          ),
          verticalSpaceTiny,
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/pickup.svg",
                height: getProportionateScreenHeight(20),
              ),
              horizontalSpaceSmall,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pickup",
                      style: robotoRegular.copyWith(
                        color: MyColor.neutral150,
                        fontSize: getProportionateScreenHeight(9),
                      ),
                    ),
                    Text(
                      "${delivery?.pickupLocation}",
                      style: robotoMedium.copyWith(
                          color: MyColor.primary40,
                          fontSize: getProportionateScreenHeight(11)),
                    ),
                  ],
                ),
              ),
              horizontalSpaceTiny,
              const Expanded(
                child: Divider(
                  color: MyColor.utilityOutline,
                  thickness: 1,
                ),
              ),
              Column(
                children: [
                  Text(
                    "${(double.parse(delivery!.deliveryDuration) / 60 / 60).toStringAsFixed(1)} hrs",
                    style: robotoBold.copyWith(
                      color: MyColor.neutral150,
                      fontSize: getProportionateScreenHeight(9),
                    ),
                  ),
                  Text(
                    "${delivery?.deliveryDistance} km",
                    style: robotoRegular.copyWith(
                      color: MyColor.neutral150,
                      fontSize: getProportionateScreenHeight(9),
                    ),
                  ),
                ],
              ),
              const Expanded(
                child: Divider(
                  color: MyColor.utilityOutline,
                  thickness: 1,
                ),
              ),
              SvgPicture.asset(
                "assets/icons/destination.svg",
              ),
              horizontalSpaceTiny,
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Destination",
                    style: robotoRegular.copyWith(
                      color: MyColor.neutral150,
                      fontSize: getProportionateScreenHeight(9),
                    ),
                  ),
                  Text(
                    "${delivery?.deliveryLocation}",
                    style: robotoMedium.copyWith(
                        color: MyColor.primary40,
                        fontSize: getProportionateScreenHeight(11)),
                  ),
                ],
              ))
            ],
          )
        ],
      ),
    );
  }
}
