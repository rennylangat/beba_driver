// To parse this JSON data, do
//
//     final myTrips = myTripsFromJson(jsonString);

import 'dart:convert';

import 'package:beba_driver/ui/views/home/models/delivery_model.dart';

MyTrips myTripsFromJson(String str) => MyTrips.fromJson(json.decode(str));

String myTripsToJson(MyTrips data) => json.encode(data.toJson());

class MyTrips {
  final List<Trip> trips;
  final int? count;

  MyTrips({
    required this.trips,
    this.count,
  });

  factory MyTrips.fromJson(Map<String, dynamic> json) => MyTrips(
        trips: List<Trip>.from(json["results"].map((x) => Trip.fromJson(x))),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(trips.map((x) => x.toJson())),
        "count": count,
      };
}

class Trip {
  final String id;
  final SingleDelivery delivery;
  final bool cancelled;

  Trip({
    required this.id,
    required this.delivery,
    required this.cancelled,
  });

  factory Trip.fromJson(Map<String, dynamic> json) => Trip(
        id: json["id"],
        delivery: SingleDelivery.fromJson(json["delivery"]),
        cancelled: json["cancelled"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "delivery": delivery.toJson(),
        "cancelled": cancelled,
      };
}
