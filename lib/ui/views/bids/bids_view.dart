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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  BidsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BidsViewModel();
}
