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
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
        child: Form(
          key: viewModel.formKey,
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: MyColor.neutral199,
                  //     borderRadius: BorderRadius.circular(4),
                  //   ),
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  //   child: SvgPicture.asset(
                  //     "assets/icons/calendar.svg",
                  //   ),
                  // ),
                  // horizontalSpaceSmall,
                  // Expanded(
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text(
                  //         "Dropoff Schedule",
                  //         style: robotoRegular.copyWith(
                  //           fontSize: getProportionateScreenHeight(9),
                  //           color: MyColor.neutral150,
                  //         ),
                  //       ),
                  //       Text(
                  //         "4th Jan, 2025 ● 10:00 AM",
                  //         style: robotoRegular.copyWith(
                  //           fontSize: getProportionateScreenHeight(10),
                  //           color: MyColor.primary40,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // const Spacer(),
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
                          "${delivery.deliveryWeight} T",
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
                          "Cargo Information",
                          style: robotoRegular.copyWith(
                            fontSize: getProportionateScreenHeight(9),
                            color: MyColor.neutral150,
                          ),
                        ),
                        Text(
                          delivery.cargoDescription,
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
                          delivery.additionalRequirements,
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
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return "Please enter a bid amount";
                        }
                        return null;
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
                  if (viewModel.amount == 0.0) {
                    EasyLoading.showError("Please enter a bid amount");
                    return;
                  }
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
                          "Are you sure you want to place a bid of ${MoneyConverter().convertMoney(viewModel.amount)}?",
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
                            onPressed: () async {
                              await viewModel.placeBid();
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
