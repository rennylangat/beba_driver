import 'package:beba_driver/ui/common/app_colors.dart';
import 'package:beba_driver/ui/common/size_config.dart';
import 'package:beba_driver/ui/common/text_styles.dart';
import 'package:beba_driver/ui/views/bids/widgets/bid_child.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'bids_viewmodel.dart';

class BidsView extends StackedView<BidsViewModel> {
  const BidsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BidsViewModel viewModel,
    Widget? child,
  ) {
    return const AvailableTrips();
  }

  @override
  BidsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BidsViewModel();
}

class AvailableTrips extends StatefulWidget {
  const AvailableTrips({super.key});

  @override
  State<AvailableTrips> createState() => _AvailableTripsState();
}

class _AvailableTripsState extends State<AvailableTrips>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  int currentIndex = 0;

  changeIndex(int value) {
    setState(() {
      tabController.index = value;
    });
  }

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      setState(() {
        changeIndex(tabController.index);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColor.primary40,
          title: Text(
            'Available Trips',
            style: robotoBold.copyWith(
              fontSize: getProportionateScreenHeight(16),
              color: MyColor.colorWhite,
            ),
          ),
          bottom: TabBar(
              controller: tabController,
              indicatorColor: MyColor.tabIndicatorColor,
              indicatorSize: TabBarIndicatorSize.tab,
              tabAlignment: TabAlignment.start,
              indicatorWeight: 5,
              indicatorPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
              unselectedLabelColor: MyColor.primary90,
              labelColor: MyColor.colorWhite,
              isScrollable: true,
              tabs: [
                Tab(
                  child: TabLabel(
                    isSelected: currentIndex == 0,
                    labelTitle: "Accepted",
                    count: "6",
                    chipColor: MyColor.greenTextColor,
                    textColor: MyColor.colorWhite,
                  ),
                ),
                Tab(
                  child: TabLabel(
                    isSelected: currentIndex == 1,
                    labelTitle: "Pending",
                    count: "3",
                  ),
                ),
                Tab(
                  child: TabLabel(
                    isSelected: currentIndex == 2,
                    labelTitle: "Cancelled",
                    count: "2",
                    chipColor: MyColor.cancelColor,
                    textColor: MyColor.colorWhite,
                  ),
                ),
                Tab(
                  child: TabLabel(
                    isSelected: currentIndex == 3,
                    labelTitle: "All",
                    count: "1",
                    chipColor: MyColor.secondary90,
                    textColor: MyColor.neutral150,
                  ),
                ),
              ]),
        ),
        body: TabBarView(
          controller: tabController,
          children: const [
            BidChildView(
              bidType: "Accepted",
            ),
            BidChildView(
              bidType: "Pedning",
            ),
            BidChildView(
              bidType: "Cancelled",
            ),
            BidChildView(
              bidType: "All",
            ),
          ],
        ),
      ),
    );
  }
}

class TabLabel extends StatelessWidget {
  final bool isSelected;
  final String labelTitle;
  final String? count;
  final Color chipColor;
  final Color textColor;
  const TabLabel({
    super.key,
    required this.isSelected,
    required this.labelTitle,
    this.count,
    this.chipColor = MyColor.primary90,
    this.textColor = MyColor.neutral150,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            labelTitle,
            overflow: TextOverflow.ellipsis,
            style: robotoSemiBold.copyWith(
              color: MyColor.colorWhite,
              fontSize: getProportionateScreenHeight(12),
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(3),
          ),
          Container(
            decoration: BoxDecoration(
              // color: isSelected ? MyColor.secondary90 : MyColor.primary90,
              color: chipColor,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Text(
              count ?? "0",
              style: robotoMedium.copyWith(
                fontSize: getProportionateScreenHeight(9),
                color: textColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
