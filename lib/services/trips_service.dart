import 'package:beba_driver/app/app.locator.dart';
import 'package:beba_driver/services/api_client_service.dart';
import 'package:beba_driver/ui/common/api_constants.dart';
import 'package:beba_driver/ui/common/req_methods.dart';
import 'package:dio/dio.dart';

class TripsService {
  final _apiClient = locator<ApiClientService>();

  Future<Response> getAvailableDeliveries() async {
    return await _apiClient.request(
      method: Methods.get,
      url: ApiConstants.deliveries,
    );
  }

  Future<Response> getMyTrips() async {
    return await _apiClient.request(
      method: Methods.get,
      url: ApiConstants.trips,
    );
  }

  Future<Response> placeBid(
      {required String bidAmount, required String deliveryId}) async {
    return await _apiClient.request(
      method: Methods.post,
      url: "${ApiConstants.placeBid}$deliveryId/bids/",
      body: {
        "bid_amount": bidAmount,
        "delivery": deliveryId,
      },
    );
  }

  Future<Response> startTrip(
      {required String tripId,
      required String status,
      required String deliveryCode}) async {
    return await _apiClient.request(
      method: Methods.patch,
      url: "${ApiConstants.trips}$tripId/",
      seeLogs: true,
      body: {
        "delivery_status": status,
      },
    );
  }
}
