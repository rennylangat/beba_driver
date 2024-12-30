import 'dart:developer';

import 'package:beba_driver/app/app.locator.dart';
import 'package:beba_driver/services/trips_service.dart';
import 'package:beba_driver/ui/views/home/models/delivery_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BidsViewModel extends IndexTrackingViewModel {
  final _tripService = locator<TripsService>();
  late TabController tabController;
  MyDeliveries? _myDeliveries;
  MyDeliveries? get myDeliveries => _myDeliveries;
  List<SingleDelivery> acceptedDeliveries = [];
  List<SingleDelivery> pendingDeliveries = [];
  List<SingleDelivery> completedDeliveries = [];
  List<SingleDelivery> cancelledDeliveries = [];
  bool _isBusy = false;
  @override
  bool get isBusy => _isBusy;

  void init() {
    setMyDeliveries();
  }

  void setMyDeliveries() async {
    log("setMyDeliveries");
    _isBusy = true;
    notifyListeners();
    final res = await _tripService.getAvailableTrips();
    if (res.statusCode == 200) {
      _myDeliveries = MyDeliveries.fromJson(res.data);
      notifyListeners();
      log("setMyDeliveries: ${myDeliveries!.deliveries.length}");
      for (var delivery in _myDeliveries!.deliveries) {
        filterDeliveries(_myDeliveries!.deliveries.indexOf(delivery));
      }
    }

    _isBusy = false;
    notifyListeners();
  }

  filterDeliveries(int index) {
    switch (index) {
      case 0:
        acceptedDeliveries = _myDeliveries!.deliveries
            .where((element) => element.deliveryStatus == "accepted")
            .toList();
      case 1:
        pendingDeliveries = _myDeliveries!.deliveries
            .where((element) => element.deliveryStatus == "pending")
            .toList();
      case 2:
        completedDeliveries = _myDeliveries!.deliveries
            .where((element) => element.deliveryStatus == "completed")
            .toList();
      default:
        cancelledDeliveries = _myDeliveries!.deliveries
            .where((element) => element.deliveryStatus == "cancelled")
            .toList();
    }
    notifyListeners();
  }
}
