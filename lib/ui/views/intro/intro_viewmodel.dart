import 'package:beba_driver/app/app.locator.dart';
import 'package:beba_driver/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:get_secure_storage/get_secure_storage.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class IntroViewModel extends BaseViewModel {
  final PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  final curve = Curves.easeInOut;
  final box = GetSecureStorage();
  List<Map<String, dynamic>> pages = [
    {
      "title": "Delivering Happiness",
      "desc":
          "From your doorstep to any destination, trust us to handle your precious cargo with the utmost care and reliability.",
    },
    {
      "title": "Your Delivery Partner",
      "desc":
          "We simplify your delivery needs, offering a seamless experience because we know how valuable your time is.",
    },
    {
      "title": "Fast. Reliable. Convetnient",
      "desc":
          "Experience hassle-free deliveries tailored to your schedule and needs, ensuring your cargo reaches its destination swiftly and safely.",
    },
  ];

  pageChanged(int page) {
    currentIndex = page;
    rebuildUi();
  }

  skip() {
    currentIndex = pages.length - 1;
    pageChanged(currentIndex);
    rebuildUi();
  }

  nextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: curve,
    );
  }

  startApp() async {
    await box.write("firstTime", false);
    locator<NavigationService>().replaceWith(Routes.loginView);
  }

  previousPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 400),
      curve: curve,
    );
  }
}
