import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BidsViewModel extends BaseViewModel {
  late TabController tabController;

  void init(TickerProvider vsync) {
    tabController = TabController(length: 2, vsync: vsync);
  }
}
