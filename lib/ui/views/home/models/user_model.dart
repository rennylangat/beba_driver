import 'dart:convert';

UserDetails userDetailsFromJson(String str) =>
    UserDetails.fromJson(json.decode(str));

String userDetailsToJson(UserDetails data) => json.encode(data.toJson());

class UserDetails {
  final User user;
  final Profile profile;

  UserDetails({
    required this.user,
    required this.profile,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        user: User.fromJson(json["user"]),
        profile: Profile.fromJson(json["profile"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "profile": profile.toJson(),
      };
}

class Profile {
  final String id;
  final String user;
  final dynamic profilePicture;
  final dynamic bio;
  final dynamic idNumber;
  final dynamic idCopyFront;
  final dynamic idCopyBack;
  final dynamic dlNumber;
  final dynamic dlCopyFront;
  final dynamic dlCopyBack;
  final bool isVerified;
  final DateTime createdAt;
  final dynamic updatedAt;

  Profile({
    required this.id,
    required this.user,
    required this.profilePicture,
    required this.bio,
    required this.idNumber,
    required this.idCopyFront,
    required this.idCopyBack,
    required this.dlNumber,
    required this.dlCopyFront,
    required this.dlCopyBack,
    required this.isVerified,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        user: json["user"],
        profilePicture: json["profile_picture"],
        bio: json["bio"],
        idNumber: json["id_number"],
        idCopyFront: json["id_copy_front"],
        idCopyBack: json["id_copy_back"],
        dlNumber: json["dl_number"],
        dlCopyFront: json["dl_copy_front"],
        dlCopyBack: json["dl_copy_back"],
        isVerified: json["is_verified"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "profile_picture": profilePicture,
        "bio": bio,
        "id_number": idNumber,
        "id_copy_front": idCopyFront,
        "id_copy_back": idCopyBack,
        "dl_number": dlNumber,
        "dl_copy_front": dlCopyFront,
        "dl_copy_back": dlCopyBack,
        "is_verified": isVerified,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt,
      };
}

class User {
  final String id;
  final String phoneNumber;
  final String firstName;
  final String lastName;
  final int userRole;
  final bool isActive;
  final bool isStaff;
  final DateTime createdAt;
  final String userRoleName;
  final UserRating userRating;

  User({
    required this.id,
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.userRole,
    required this.isActive,
    required this.isStaff,
    required this.createdAt,
    required this.userRoleName,
    required this.userRating,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        phoneNumber: json["phone_number"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        userRole: json["user_role"],
        isActive: json["is_active"],
        isStaff: json["is_staff"],
        createdAt: DateTime.parse(json["created_at"]),
        userRoleName: json["user_role_name"],
        userRating: UserRating.fromJson(json["user_rating"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "phone_number": phoneNumber,
        "first_name": firstName,
        "last_name": lastName,
        "user_role": userRole,
        "is_active": isActive,
        "is_staff": isStaff,
        "created_at": createdAt.toIso8601String(),
        "user_role_name": userRoleName,
        "user_rating": userRating.toJson(),
      };
}

class UserRating {
  final double overallRating;
  final int totalTrips;
  final int completedTrips;
  final int canceledTrips;
  final int completionRate;
  final Map<String, int> ratingDistribution;
  final NewUserStatus newUserStatus;
  final String userType;
  final int rawRating;

  UserRating({
    required this.overallRating,
    required this.totalTrips,
    required this.completedTrips,
    required this.canceledTrips,
    required this.completionRate,
    required this.ratingDistribution,
    required this.newUserStatus,
    required this.userType,
    required this.rawRating,
  });

  factory UserRating.fromJson(Map<String, dynamic> json) => UserRating(
        overallRating: json["overall_rating"],
        totalTrips: json["total_trips"],
        completedTrips: json["completed_trips"],
        canceledTrips: json["canceled_trips"],
        completionRate: json["completion_rate"],
        ratingDistribution: Map.from(json["rating_distribution"])
            .map((k, v) => MapEntry<String, int>(k, v)),
        newUserStatus: NewUserStatus.fromJson(json["new_user_status"]),
        userType: json["user_type"],
        rawRating: json["raw_rating"],
      );

  Map<String, dynamic> toJson() => {
        "overall_rating": overallRating,
        "total_trips": totalTrips,
        "completed_trips": completedTrips,
        "canceled_trips": canceledTrips,
        "completion_rate": completionRate,
        "rating_distribution": Map.from(ratingDistribution)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "new_user_status": newUserStatus.toJson(),
        "user_type": userType,
        "raw_rating": rawRating,
      };
}

class NewUserStatus {
  final bool isNewUser;
  final int remainingBonusTrips;
  final double bonusWeight;

  NewUserStatus({
    required this.isNewUser,
    required this.remainingBonusTrips,
    required this.bonusWeight,
  });

  factory NewUserStatus.fromJson(Map<String, dynamic> json) => NewUserStatus(
        isNewUser: json["is_new_user"],
        remainingBonusTrips: json["remaining_bonus_trips"],
        bonusWeight: json["bonus_weight"],
      );

  Map<String, dynamic> toJson() => {
        "is_new_user": isNewUser,
        "remaining_bonus_trips": remainingBonusTrips,
        "bonus_weight": bonusWeight,
      };
}
