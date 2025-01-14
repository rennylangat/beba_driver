import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;

class ApiConstants {
  ApiConstants._();

  static String baseURL = dotenv.dotenv.env['BASE_URL']!;

  //AUTH
  static String register = "${baseURL}users/register/";
  static String login = "${baseURL}users/login/";
  static String verifyOtp = "${baseURL}users/otp/verify/";
  static String resendOtp = "${baseURL}users/otp/resend/";

  //USER
  static String userDetails = "${baseURL}users/";

  //TRIPS
  static String deliveries = "${baseURL}trips/delivery";
  static String trips = "${baseURL}trips/";
  static String startTrip = "${baseURL}trips/driver/start/";

  //BIDS
  static String placeBid = "${baseURL}trips/bid/deliveries/";
}
