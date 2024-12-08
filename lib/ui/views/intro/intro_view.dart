import 'package:beba_driver/ui/common/app_colors.dart';
import 'package:beba_driver/ui/common/size_config.dart';
import 'package:beba_driver/ui/common/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

import 'intro_viewmodel.dart';

class IntroView extends StackedView<IntroViewModel> {
  const IntroView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    IntroViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: MyColor.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              Expanded(
                child: PageView(
                    controller: viewModel.pageController,
                    onPageChanged: (value) {
                      viewModel.pageChanged(value);
                    },
                    children: viewModel.pages.map((e) {
                      return OnboardingWidget(
                        title: e["title"],
                        desc: e["desc"],
                        pages: viewModel.pages,
                        index: viewModel.currentIndex,
                      );
                    }).toList()),
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        viewModel.skip();
                      },
                      child: Text(
                        "Skip",
                        style: robotoBold.copyWith(
                          color: MyColor.primary90,
                          fontSize: getProportionateScreenHeight(17),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    child: Row(
                      children: List.generate(
                        viewModel.pages.length,
                        (index) => Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 400),
                              curve: viewModel.curve,
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                color: index == viewModel.currentIndex
                                    ? MyColor.secondary
                                    : MyColor.neutral,
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        if (viewModel.currentIndex ==
                            viewModel.pages.length - 1) {
                          viewModel.startApp();
                        } else {
                          viewModel.nextPage();
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: MyColor.secondary,
                            borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8),
                        alignment: Alignment.center,
                        child: Text(
                          viewModel.currentIndex == viewModel.pages.length - 1
                              ? "Start"
                              : "Next",
                          style: robotoRegular.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  IntroViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      IntroViewModel();
}

class OnboardingWidget extends StatelessWidget {
  final String title;
  final String desc;
  final List<Map<String, dynamic>> pages;
  final int index;
  const OnboardingWidget({
    super.key,
    required this.title,
    required this.desc,
    required this.index,
    required this.pages,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Image.asset(
            "assets/images/beba_logo.png",
            width: getProportionateScreenWidth(47),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(40),
        ),
        SizedBox(
          child: SvgPicture.asset(
            "assets/images/intro_${index + 1}.svg",
            width: getProportionateScreenWidth(260),
            height: getProportionateScreenHeight(280),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(60),
        ),
        Text(
          pages[index]["title"],
          textAlign: TextAlign.center,
          style: robotoBold.copyWith(
            color: MyColor.secondary,
            fontSize: getProportionateScreenHeight(28),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        Text(
          pages[index]["desc"],
          textAlign: TextAlign.center,
          style: robotoSemiBold.copyWith(
            color: MyColor.neutral199,
            fontSize: getProportionateScreenHeight(15),
          ),
        )
      ],
    );
  }
}
