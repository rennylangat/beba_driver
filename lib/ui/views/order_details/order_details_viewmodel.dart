import 'package:beba_driver/app/app.locator.dart';
import 'package:beba_driver/services/trips_service.dart';
import 'package:beba_driver/ui/views/bottom_nav/bottom_nav_view.dart';
import 'package:beba_driver/ui/views/home/models/delivery_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OrderDetailsViewModel extends BaseViewModel {
  SingleDelivery? _singleDelivery;
  SingleDelivery? get singleDelivery => _singleDelivery;
  TextEditingController bidAmountController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double _amount = 0.0;
  double get amount => _amount;
  final _tripService = locator<TripsService>();
  final _navigator = locator<NavigationService>();

  void init(SingleDelivery singleDelivery) {
    _singleDelivery = singleDelivery;
    notifyListeners();
  }

  void setAmount(double amount) {
    _amount = amount;
    notifyListeners();
  }

  increaseBid() {
    int currentBid = int.parse(bidAmountController.text);
    currentBid += 1;
    bidAmountController.text = currentBid.toString();
    notifyListeners();
  }

  decreaseBid() {
    int currentBid = int.parse(bidAmountController.text);
    if (currentBid == 0) return;
    currentBid -= 1;
    bidAmountController.text = currentBid.toString();
    notifyListeners();
  }

  placeBid() async {
    if (formKey.currentState!.validate()) {
      EasyLoading.show(status: 'Placing Bid...');
      final res = await _tripService.placeBid(
        bidAmount: bidAmountController.text.trim(),
        deliveryId: singleDelivery!.id,
      );
      if (res.statusCode == 201) {
        EasyLoading.showSuccess('Bid Placed Successfully');
        _navigator.clearStackAndShowView(
          const BottomNavView(),
        );
      }
      EasyLoading.dismiss();
    }
  }
}
