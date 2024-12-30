import 'dart:convert';

MyTrips myTripsFromJson(String str) => MyTrips.fromJson(json.decode(str));

String myTripsToJson(MyTrips data) => json.encode(data.toJson());

class MyTrips {
  final String? next;
  final String? previous;
  final List<Trip> trips;

  MyTrips({
    this.next,
    this.previous,
    required this.trips,
  });

  factory MyTrips.fromJson(Map<String, dynamic> json) => MyTrips(
        next: json["next"],
        previous: json["previous"],
        trips: List<Trip>.from(json["data"].map((x) => Trip.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "next": next,
        "previous": previous,
        "data": List<dynamic>.from(trips.map((x) => x.toJson())),
      };
}

class Trip {
  final String id;
  final Bid bid;
  final Delivery delivery;
  final Driver driver;
  final bool cancelled;
  final String penaltyFee;

  Trip({
    required this.id,
    required this.bid,
    required this.delivery,
    required this.driver,
    required this.cancelled,
    required this.penaltyFee,
  });

  factory Trip.fromJson(Map<String, dynamic> json) => Trip(
        id: json["id"],
        bid: Bid.fromJson(json["bid"]),
        delivery: Delivery.fromJson(json["delivery"]),
        driver: Driver.fromJson(json["driver"]),
        cancelled: json["cancelled"],
        penaltyFee: json["penalty_fee"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bid": bid.toJson(),
        "delivery": delivery.toJson(),
        "driver": driver.toJson(),
        "cancelled": cancelled,
        "penalty_fee": penaltyFee,
      };
}

class Bid {
  final String id;
  final int? deletionMarker;
  final DateTime? deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String bidAmount;
  final String driver;
  final String delivery;

  Bid({
    required this.id,
    this.deletionMarker,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.bidAmount,
    required this.driver,
    required this.delivery,
  });

  factory Bid.fromJson(Map<String, dynamic> json) => Bid(
        id: json["id"],
        deletionMarker: json["deletion_marker"],
        deletedAt: json["deleted_at"] == null
            ? null
            : DateTime.parse(json["deleted_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        bidAmount: json["bid_amount"],
        driver: json["driver"],
        delivery: json["delivery"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "deletion_marker": deletionMarker,
        "deleted_at": deletedAt?.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "bid_amount": bidAmount,
        "driver": driver,
        "delivery": delivery,
      };
}

class Delivery {
  final String id;
  final RequiredVehicleType requiredVehicleType;
  final String deliveryStatus;
  final String paymentStatus;
  final int? deletionMarker;
  final DateTime? deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String pickupLocation;
  final String deliveryLocation;
  final DateTime pickupDatetime;
  final DateTime deliveryDatetime;
  final String cargoDescription;
  final String paymentAmount;
  final DateTime bidDeadline;
  final bool isActive;
  final String additionalRequirements;
  final String? latitude;
  final String? longitude;
  final DateTime lastUpdatedAt;
  final String deliveryNotes;
  final String deliveryDuration;
  final String deliveryDistance;
  final String requestingUser;
  final String acceptedBid;

  Delivery({
    required this.id,
    required this.requiredVehicleType,
    required this.deliveryStatus,
    required this.paymentStatus,
    this.deletionMarker,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.pickupLocation,
    required this.deliveryLocation,
    required this.pickupDatetime,
    required this.deliveryDatetime,
    required this.cargoDescription,
    required this.paymentAmount,
    required this.bidDeadline,
    required this.isActive,
    required this.additionalRequirements,
    this.latitude,
    this.longitude,
    required this.lastUpdatedAt,
    required this.deliveryNotes,
    required this.deliveryDuration,
    required this.deliveryDistance,
    required this.requestingUser,
    required this.acceptedBid,
  });

  factory Delivery.fromJson(Map<String, dynamic> json) => Delivery(
        id: json["id"],
        requiredVehicleType:
            RequiredVehicleType.fromJson(json["required_vehicle_type"]),
        deliveryStatus: json["delivery_status"],
        paymentStatus: json["payment_status"],
        deletionMarker: json["deletion_marker"],
        deletedAt: json["deleted_at"] == null
            ? null
            : DateTime.parse(json["deleted_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pickupLocation: json["pickup_location"],
        deliveryLocation: json["delivery_location"],
        pickupDatetime: DateTime.parse(json["pickup_datetime"]),
        deliveryDatetime: DateTime.parse(json["delivery_datetime"]),
        cargoDescription: json["cargo_description"],
        paymentAmount: json["payment_amount"],
        bidDeadline: DateTime.parse(json["bid_deadline"]),
        isActive: json["is_active"],
        additionalRequirements: json["additional_requirements"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        lastUpdatedAt: DateTime.parse(json["last_updated_at"]),
        deliveryNotes: json["delivery_notes"],
        deliveryDuration: json["delivery_duration"],
        deliveryDistance: json["delivery_distance"],
        requestingUser: json["requesting_user"],
        acceptedBid: json["accepted_bid"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "required_vehicle_type": requiredVehicleType.toJson(),
        "delivery_status": deliveryStatus,
        "payment_status": paymentStatus,
        "deletion_marker": deletionMarker,
        "deleted_at": deletedAt?.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "pickup_location": pickupLocation,
        "delivery_location": deliveryLocation,
        "pickup_datetime": pickupDatetime.toIso8601String(),
        "delivery_datetime": deliveryDatetime.toIso8601String(),
        "cargo_description": cargoDescription,
        "payment_amount": paymentAmount,
        "bid_deadline": bidDeadline.toIso8601String(),
        "is_active": isActive,
        "additional_requirements": additionalRequirements,
        "latitude": latitude,
        "longitude": longitude,
        "last_updated_at": lastUpdatedAt.toIso8601String(),
        "delivery_notes": deliveryNotes,
        "delivery_duration": deliveryDuration,
        "delivery_distance": deliveryDistance,
        "requesting_user": requestingUser,
        "accepted_bid": acceptedBid,
      };
}

class RequiredVehicleType {
  final int id;
  final String name;
  final String minWeightCapacityTon;
  final String maxWeightCapacityTon;
  final String? platformFees;
  final String description;
  final String imageUrl;
  final bool isActive;

  RequiredVehicleType({
    required this.id,
    required this.name,
    required this.minWeightCapacityTon,
    required this.maxWeightCapacityTon,
    this.platformFees,
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

class Driver {
  final String id;
  final String phoneNumber;
  final String firstName;
  final String lastName;

  Driver({
    required this.id,
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
  });

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
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
