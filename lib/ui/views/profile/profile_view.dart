import 'package:beba_driver/ui/views/widgets/custom_bottom_nav.dart';
import 'package:beba_driver/ui/views/widgets/custom_fab.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'profile_viewmodel.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNav(
        currentIndex: 2,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: const CustomFAB(),
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  ProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProfileViewModel();
}
