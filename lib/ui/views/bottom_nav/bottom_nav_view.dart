import 'dart:io';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:beba_driver/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

import 'bottom_nav_viewmodel.dart';

class BottomNavView extends StatelessWidget {
  final int currentIndex;
  const BottomNavView({Key? key, required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, model, child) => AnimatedBottomNavigationBar.builder(
        gapLocation: GapLocation.end,
        leftCornerRadius: 20,
        // rightCornerRadius: 20,
        height: Platform.isAndroid ? 50 : 45,
        notchSmoothness: NotchSmoothness.defaultEdge,
        backgroundColor: MyColor.primary40,
        itemCount: 3,
        tabBuilder: (index, isActive) {
          return Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  "assets/icons/${isActive ? model.menuList[index]["activeIcon"] : model.menuList[index]["icon"]}.svg",
                ),
              ],
            ),
          );
        },
        activeIndex: model.currentIndex,
        onTap: _onNavTapped,
      ),
      viewModelBuilder: () => BottomNavViewModel(),
    );
  }

  _onNavTapped(int index) {}
}
