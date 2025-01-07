import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'basic_info_viewmodel.dart';

class BasicInfoView extends StackedView<BasicInfoViewModel> {
  const BasicInfoView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BasicInfoViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  BasicInfoViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BasicInfoViewModel();
}
