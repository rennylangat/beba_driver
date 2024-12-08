import 'package:beba_driver/ui/common/app_colors.dart';
import 'package:beba_driver/ui/common/size_config.dart';
import 'package:beba_driver/ui/common/text_styles.dart';
import 'package:beba_driver/ui/common/ui_helpers.dart';
import 'package:beba_driver/ui/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

import 'order_details_viewmodel.dart';

class OrderDetailsView extends StackedView<OrderDetailsViewModel> {
  const OrderDetailsView({Key? key}) : super(key: key);

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
              const OrderContainerWidget(),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              Row(
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
                  horizontalSpaceTiny,
                  const Expanded(
                    child: Column(
                      children: [],
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }

  @override
  OrderDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OrderDetailsViewModel();
}
