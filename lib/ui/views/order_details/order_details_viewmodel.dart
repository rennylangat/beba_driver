import 'package:beba_driver/ui/views/home/models/delivery_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class OrderDetailsViewModel extends BaseViewModel {
  SingleDelivery? _singleDelivery;
  SingleDelivery? get singleDelivery => _singleDelivery;
  TextEditingController bidAmountController = TextEditingController();
  double _amount = 0.0;
  double get amount => _amount;

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

  placeBid() async {}
}
