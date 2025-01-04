// To parse this JSON data, do
//
//     final myTrips = myTripsFromJson(jsonString);

import 'dart:convert';

MyTrips myTripsFromJson(String str) => MyTrips.fromJson(json.decode(str));

String myTripsToJson(MyTrips data) => json.encode(data.toJson());

class MyTrips {
  final List<Datum> data;

  MyTrips({
    required this.data,
  });

  factory MyTrips.fromJson(Map<String, dynamic> json) => MyTrips(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  final String id;
  final Delivery delivery;
  final bool cancelled;

  Datum({
    required this.id,
    required this.delivery,
    required this.cancelled,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        delivery: Delivery.fromJson(json["delivery"]),
        cancelled: json["cancelled"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "delivery": delivery.toJson(),
        "cancelled": cancelled,
      };
}

class Delivery {
  final String id;
  final RequiredVehicleType requiredVehicleType;
  final String deliveryStatus;
  final String paymentStatus;
  final dynamic bidObject;
  final dynamic deletionMarker;
  final dynamic deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String deliveryCode;
  final dynamic finalDeliveryFee;
  final String platformFees;
  final String pickupLocation;
  final String deliveryLocation;
  final String cargoDescription;
  final bool isActive;
  final String additionalRequirements;
  final int deliveryPaymentStatus;
  final bool driverPaidPlatformFees;
  final String pickupLocationLatitude;
  final String pickupLocationLongitude;
  final String deliveryLocationLatitude;
  final String deliveryLocationLongitude;
  final DateTime lastUpdatedAt;
  final String deliveryNotes;
  final String approximateWeightCapacityTon;
  final String approximateDeliveryDuration;
  final String approximateDeliveryDistance;
  final String requestingUser;
  final dynamic acceptedBid;
  final List<dynamic> deliveryStatusHistory;

  Delivery({
    required this.id,
    required this.requiredVehicleType,
    required this.deliveryStatus,
    required this.paymentStatus,
    required this.bidObject,
    required this.deletionMarker,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.deliveryCode,
    required this.finalDeliveryFee,
    required this.platformFees,
    required this.pickupLocation,
    required this.deliveryLocation,
    required this.cargoDescription,
    required this.isActive,
    required this.additionalRequirements,
    required this.deliveryPaymentStatus,
    required this.driverPaidPlatformFees,
    required this.pickupLocationLatitude,
    required this.pickupLocationLongitude,
    required this.deliveryLocationLatitude,
    required this.deliveryLocationLongitude,
    required this.lastUpdatedAt,
    required this.deliveryNotes,
    required this.approximateWeightCapacityTon,
    required this.approximateDeliveryDuration,
    required this.approximateDeliveryDistance,
    required this.requestingUser,
    required this.acceptedBid,
    required this.deliveryStatusHistory,
  });

  factory Delivery.fromJson(Map<String, dynamic> json) => Delivery(
        id: json["id"],
        requiredVehicleType:
            RequiredVehicleType.fromJson(json["required_vehicle_type"]),
        deliveryStatus: json["delivery_status"],
        paymentStatus: json["payment_status"],
        bidObject: json["bid_object"],
        deletionMarker: json["deletion_marker"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deliveryCode: json["delivery_code"],
        finalDeliveryFee: json["final_delivery_fee"],
        platformFees: json["platform_fees"],
        pickupLocation: json["pickup_location"],
        deliveryLocation: json["delivery_location"],
        cargoDescription: json["cargo_description"],
        isActive: json["is_active"],
        additionalRequirements: json["additional_requirements"],
        deliveryPaymentStatus: json["delivery_payment_status"],
        driverPaidPlatformFees: json["driver_paid_platform_fees"],
        pickupLocationLatitude: json["pickup_location_latitude"],
        pickupLocationLongitude: json["pickup_location_longitude"],
        deliveryLocationLatitude: json["delivery_location_latitude"],
        deliveryLocationLongitude: json["delivery_location_longitude"],
        lastUpdatedAt: DateTime.parse(json["last_updated_at"]),
        deliveryNotes: json["delivery_notes"],
        approximateWeightCapacityTon: json["approximate_weight_capacity_ton"],
        approximateDeliveryDuration: json["approximate_delivery_duration"],
        approximateDeliveryDistance: json["approximate_delivery_distance"],
        requestingUser: json["requesting_user"],
        acceptedBid: json["accepted_bid"],
        deliveryStatusHistory:
            List<dynamic>.from(json["delivery_status_history"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "required_vehicle_type": requiredVehicleType.toJson(),
        "delivery_status": deliveryStatus,
        "payment_status": paymentStatus,
        "bid_object": bidObject,
        "deletion_marker": deletionMarker,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "delivery_code": deliveryCode,
        "final_delivery_fee": finalDeliveryFee,
        "platform_fees": platformFees,
        "pickup_location": pickupLocation,
        "delivery_location": deliveryLocation,
        "cargo_description": cargoDescription,
        "is_active": isActive,
        "additional_requirements": additionalRequirements,
        "delivery_payment_status": deliveryPaymentStatus,
        "driver_paid_platform_fees": driverPaidPlatformFees,
        "pickup_location_latitude": pickupLocationLatitude,
        "pickup_location_longitude": pickupLocationLongitude,
        "delivery_location_latitude": deliveryLocationLatitude,
        "delivery_location_longitude": deliveryLocationLongitude,
        "last_updated_at": lastUpdatedAt.toIso8601String(),
        "delivery_notes": deliveryNotes,
        "approximate_weight_capacity_ton": approximateWeightCapacityTon,
        "approximate_delivery_duration": approximateDeliveryDuration,
        "approximate_delivery_distance": approximateDeliveryDistance,
        "requesting_user": requestingUser,
        "accepted_bid": acceptedBid,
        "delivery_status_history":
            List<dynamic>.from(deliveryStatusHistory.map((x) => x)),
      };
}

class RequiredVehicleType {
  final int id;
  final String name;
  final String minWeightCapacityTon;
  final String maxWeightCapacityTon;
  final String platformFees;
  final String description;
  final String imageUrl;
  final bool isActive;

  RequiredVehicleType({
    required this.id,
    required this.name,
    required this.minWeightCapacityTon,
    required this.maxWeightCapacityTon,
    required this.platformFees,
    required this.description,
    required this.imageUrl,
    required this.isActive,
  });

  factory RequiredVehicleType.fromJson(Map<String, dynamic> json) =>
      RequiredVehicleType(
        id: json["id"],
        name: json["name"],
        minWeightCapacityTon: json["min_weight_capacity_ton"],
        maxWeightCapacityTon: json["max_weight_capacity_ton"],
        platformFees: json["platform_fees"],
        description: json["description"],
        imageUrl: json["imageUrl"],
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "min_weight_capacity_ton": minWeightCapacityTon,
        "max_weight_capacity_ton": maxWeightCapacityTon,
        "platform_fees": platformFees,
        "description": description,
        "imageUrl": imageUrl,
        "is_active": isActive,
      };
}
