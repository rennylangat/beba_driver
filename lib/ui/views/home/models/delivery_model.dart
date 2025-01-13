// To parse this JSON data, do
//
//     final myDeliveries = myDeliveriesFromJson(jsonString);

import 'dart:convert';

MyDeliveries myDeliveriesFromJson(String str) =>
    MyDeliveries.fromJson(json.decode(str));

String myDeliveriesToJson(MyDeliveries data) => json.encode(data.toJson());

class MyDeliveries {
  final List<SingleDelivery> deliveries;

  final dynamic next;
  final dynamic previous;

  MyDeliveries({
    required this.deliveries,
    this.next,
    this.previous,
  });

  factory MyDeliveries.fromJson(Map<String, dynamic> json) => MyDeliveries(
        deliveries: List<SingleDelivery>.from(
            json["results"].map((x) => SingleDelivery.fromJson(x))),
        next: json["next"],
        previous: json["previous"],
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(deliveries.map((x) => x.toJson())),
        "next": next,
        "previous": previous,
      };
}

class SingleDelivery {
  final String id;
  final String deliveryCode;
  final String deliveryStatus;
  final dynamic acceptedBid;
  final RequiredVehicleType requiredVehicleType;
  final RequestingUser requestingUser;
  final BidObject? bidObject;
  final dynamic deletionMarker;
  final dynamic deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String pickupLocation;
  final String deliveryLocation;
  final String cargoDescription;
  final bool isActive;
  final String additionalRequirements;
  final dynamic latitude;
  final dynamic longitude;
  final DateTime lastUpdatedAt;
  final String deliveryNotes;
  final String deliveryWeight;
  final String deliveryDuration;
  final String deliveryDistance;
  final List<dynamic> deliveryStatusHistory;

  SingleDelivery(
      {required this.id,
      required this.deliveryCode,
      required this.deliveryStatus,
      required this.acceptedBid,
      required this.requiredVehicleType,
      required this.requestingUser,
      this.bidObject,
      required this.deletionMarker,
      required this.deletedAt,
      required this.createdAt,
      required this.updatedAt,
      required this.pickupLocation,
      required this.deliveryLocation,
      required this.cargoDescription,
      required this.isActive,
      required this.additionalRequirements,
      required this.latitude,
      required this.longitude,
      required this.lastUpdatedAt,
      required this.deliveryNotes,
      required this.deliveryWeight,
      required this.deliveryDuration,
      required this.deliveryDistance,
      required this.deliveryStatusHistory});

  factory SingleDelivery.fromJson(Map<String, dynamic> json) => SingleDelivery(
        id: json["id"],
        deliveryCode: json["delivery_code"],
        deliveryStatus: json["delivery_status"],
        acceptedBid: json["accepted_bid"],
        requiredVehicleType:
            RequiredVehicleType.fromJson(json["required_vehicle_type"]),
        requestingUser: RequestingUser.fromJson(json["requesting_user"]),
        bidObject: json["bid_object"] != null
            ? BidObject.fromJson(json["bid_object"])
            : null,
        deletionMarker: json["deletion_marker"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pickupLocation: json["pickup_location"],
        deliveryLocation: json["delivery_location"],
        cargoDescription: json["cargo_description"],
        isActive: json["is_active"],
        additionalRequirements: json["additional_requirements"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        lastUpdatedAt: DateTime.parse(json["last_updated_at"]),
        deliveryNotes: json["delivery_notes"],
        deliveryWeight: json["approximate_weight_capacity_ton"],
        deliveryDuration: json["approximate_delivery_duration"],
        deliveryDistance: json["approximate_delivery_distance"],
        deliveryStatusHistory:
            List<dynamic>.from(json["delivery_status_history"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "delivery_code": deliveryCode,
        "delivery_status": deliveryStatus,
        "accepted_bid": acceptedBid,
        "required_vehicle_type": requiredVehicleType.toJson(),
        "requesting_user": requestingUser.toJson(),
        "bid_object": bidObject?.toJson(),
        "deletion_marker": deletionMarker,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "pickup_location": pickupLocation,
        "delivery_location": deliveryLocation,
        "cargo_description": cargoDescription,
        "is_active": isActive,
        "additional_requirements": additionalRequirements,
        "latitude": latitude,
        "longitude": longitude,
        "last_updated_at": lastUpdatedAt.toIso8601String(),
        "delivery_notes": deliveryNotes,
        "approximate_weight_capacity_ton": deliveryWeight,
        "delivery_duration": deliveryDuration,
        "delivery_distance": deliveryDistance,
        "delivery_status_history":
            List<dynamic>.from(deliveryStatusHistory.map((x) => x)),
      };
}

class RequestingUser {
  final String id;
  final String phoneNumber;
  final String firstName;
  final String lastName;

  RequestingUser({
    required this.id,
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
  });

  factory RequestingUser.fromJson(Map<String, dynamic> json) => RequestingUser(
        id: json["id"],
        phoneNumber: json["phone_number"],
        firstName: json["first_name"],
        lastName: json["last_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "phone_number": phoneNumber,
        "first_name": firstName,
        "last_name": lastName,
      };
}

class BidObject {
  final int id;
  final double bidAmount;
  final int bidStatus;
  final DateTime acceptedAt;
  final RequestingUser driver;

  BidObject({
    required this.id,
    required this.bidAmount,
    required this.bidStatus,
    required this.acceptedAt,
    required this.driver,
  });

  factory BidObject.fromJson(Map<String, dynamic> json) => BidObject(
        id: json["id"],
        bidAmount: json["bid_amount"],
        bidStatus: json["bid_status"],
        acceptedAt: DateTime.parse(json["accepted_at"]),
        driver: RequestingUser.fromJson(json["driver"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bid_amount": bidAmount,
        "bid_status": bidStatus,
        "accepted_at": acceptedAt.toIso8601String(),
        "driver": driver.toJson(),
      };
}

class RequiredVehicleType {
  final int id;
  final String name;
  final String minWeightCapacityTon;
  final String maxWeightCapacityTon;
  final dynamic platformFees;
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
