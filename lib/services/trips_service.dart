import 'package:beba_driver/app/app.locator.dart';
import 'package:beba_driver/services/api_client_service.dart';
import 'package:beba_driver/ui/common/api_constants.dart';
import 'package:beba_driver/ui/common/req_methods.dart';
import 'package:dio/dio.dart';

class TripsService {
  final _apiClient = locator<ApiClientService>();

  Future<Response> getAvailableTrips() async {
    return await _apiClient.request(
      method: Methods.get,
      url: ApiConstants.trips,
    );
  }
}
