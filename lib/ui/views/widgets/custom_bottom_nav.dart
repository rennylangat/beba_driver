import 'dart:io';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:beba_driver/app/app.locator.dart';
import 'package:beba_driver/app/app.router.dart';
import 'package:beba_driver/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked_services/stacked_services.dart';

class CustomBottomNav extends StatefulWidget {
  final int currentIndex;

  const CustomBottomNav({super.key, required this.currentIndex});

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  var activeIndex = 0;
  final List<Map<String, dynamic>> menuList = [
    {
      "icon": "home",
      "activeIcon": "home_active",
    },
    {
      "icon": "services",
      "activeIcon": "services_active",
    },
    {
      "icon": "settings",
      "activeIcon": "settings_active",
    },
  ];

  @override
  void initState() {
    super.initState();

    activeIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
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
                "assets/icons/${isActive ? menuList[index]["activeIcon"] : menuList[index]["icon"]}.svg",
              ),
            ],
          ),
        );
      },
      activeIndex: activeIndex,
      onTap: _onNavTapped,
    );
  }

  void _onNavTapped(int index) {
    setState(() {
      activeIndex = index;
    });

    switch (index) {
      case 0:
        if (!(widget.currentIndex == 0)) {
          locator<NavigationService>().replaceWith(
            Routes.homeView,
          );
        }
        break;
      case 1:
        if (!(widget.currentIndex == 1)) {
          locator<NavigationService>().replaceWith(
            Routes.bidsView,
          );
        }
        break;
      case 2:
        if (!(widget.currentIndex == 2)) {
          locator<NavigationService>().replaceWith(
            Routes.profileView,
          );
        }
        break;
    }
  }
}
