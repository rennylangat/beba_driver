import 'package:beba_driver/app/app.locator.dart';
import 'package:beba_driver/services/money_converter.dart';
import 'package:beba_driver/ui/common/app_colors.dart';
import 'package:beba_driver/ui/common/size_config.dart';
import 'package:beba_driver/ui/common/text_styles.dart';
import 'package:beba_driver/ui/common/ui_helpers.dart';
import 'package:beba_driver/ui/views/home/models/delivery_model.dart';
import 'package:beba_driver/ui/views/widgets/custom_button.dart';
import 'package:beba_driver/ui/views/widgets/custom_text_field.dart';
import 'package:beba_driver/ui/views/widgets/order_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'order_details_viewmodel.dart';

class OrderDetailsView extends StackedView<OrderDetailsViewModel> {
  final SingleDelivery delivery;
  const OrderDetailsView({
    Key? key,
    required this.delivery,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OrderDetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.primary40,
        iconTheme: const IconThemeData(color: MyColor.colorWhite),
        title: Text(
          "Order Details",
          style: robotoBold.copyWith(
              fontSize: getProportionateScreenHeight(18),
              color: MyColor.colorWhite),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            OrderContainerWidget(
              delivery: delivery,
            ),
            SizedBox(
              height: getProportionateScreenHeight(15),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: MyColor.neutral199,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: SvgPicture.asset(
                    "assets/icons/calendar.svg",
                  ),
                ),
                horizontalSpaceSmall,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dropoff Schedule",
                        style: robotoRegular.copyWith(
                          fontSize: getProportionateScreenHeight(9),
                          color: MyColor.neutral150,
                        ),
                      ),
                      Text(
                        "4th Jan, 2025 ● 10:00 AM",
                        style: robotoRegular.copyWith(
                          fontSize: getProportionateScreenHeight(10),
                          color: MyColor.primary40,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: MyColor.neutral199,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: SvgPicture.asset(
                    "assets/icons/scale.svg",
                  ),
                ),
                horizontalSpaceSmall,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Estimated Weight",
                        style: robotoRegular.copyWith(
                          fontSize: getProportionateScreenHeight(9),
                          color: MyColor.neutral150,
                        ),
                      ),
                      Text(
                        "35Kg",
                        style: robotoRegular.copyWith(
                          fontSize: getProportionateScreenHeight(12),
                          color: MyColor.primary40,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            verticalSpaceMedium,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: MyColor.neutral199,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Icon(
                    MdiIcons.informationOutline,
                    color: MyColor.secondary,
                    size: 20,
                  ),
                ),
                horizontalSpaceSmall,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Additional Information",
                        style: robotoRegular.copyWith(
                          fontSize: getProportionateScreenHeight(9),
                          color: MyColor.neutral150,
                        ),
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                        style: robotoRegular.copyWith(
                          fontSize: getProportionateScreenHeight(12),
                          color: MyColor.primary40,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            verticalSpaceMedium,
            const Divider(
              color: MyColor.utilityOutline,
              thickness: 1,
            ),
            Center(
              child: Text(
                "Your Bid Price",
                style: robotoRegular.copyWith(
                  fontSize: getProportionateScreenHeight(9),
                  color: MyColor.neutral150,
                ),
              ),
            ),
            verticalSpaceMedium,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    viewModel.decreaseBid();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: MyColor.neutral250,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: Icon(
                      MdiIcons.minus,
                      color: MyColor.neutral2,
                      size: 16,
                    ),
                  ),
                ),
                horizontalSpaceMedium,
                Expanded(
                  child: CustomTextField(
                    hintText: "0.00",
                    controller: viewModel.bidAmountController,
                    textAlign: TextAlign.center,
                    onChanged: (p0) {
                      if (p0.isNotEmpty) {
                        viewModel.setAmount(double.parse(p0));
                      }
                    },
                  ),
                ),
                // Text(
                //   "2,900",
                //   style: robotoMedium.copyWith(
                //     fontSize: getProportionateScreenHeight(20),
                //     color: MyColor.secondary,
                //   ),
                // ),
                horizontalSpaceMedium,
                InkWell(
                  onTap: () {
                    viewModel.increaseBid();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: MyColor.neutral250,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: Icon(
                      MdiIcons.plus,
                      color: MyColor.neutral2,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
            verticalSpaceLarge,
            CustomButton(
              title:
                  "Place Bid [ ${MoneyConverter().convertMoney(viewModel.amount)}]",
              onTap: () {
                //show Confirm Dialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog.adaptive(
                      title: Text(
                        "Confirm Bid",
                        style: robotoBold.copyWith(
                          fontSize: getProportionateScreenHeight(18),
                          color: MyColor.primary40,
                        ),
                      ),
                      content: Text(
                        "Are you sure you want to place a bid of Kes 2,900.00?",
                        style: robotoRegular.copyWith(
                          fontSize: getProportionateScreenHeight(14),
                          color: MyColor.neutral150,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            locator<NavigationService>().back();
                          },
                          child: Text(
                            "Cancel",
                            style: robotoRegular.copyWith(
                              fontSize: getProportionateScreenHeight(14),
                              color: MyColor.primary40,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Place bid logic here
                          },
                          child: Text(
                            "Confirm",
                            style: robotoBold.copyWith(
                              fontSize: getProportionateScreenHeight(14),
                              color: MyColor.primary40,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  OrderDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OrderDetailsViewModel();

  @override
  void onViewModelReady(OrderDetailsViewModel viewModel) {
    viewModel.init(delivery);
    super.onViewModelReady(viewModel);
  }
}
