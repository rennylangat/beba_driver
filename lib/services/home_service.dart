import 'package:beba_driver/app/app.locator.dart';
import 'package:beba_driver/services/api_client_service.dart';
import 'package:beba_driver/ui/common/api_constants.dart';
import 'package:beba_driver/ui/common/req_methods.dart';
import 'package:dio/dio.dart';

class HomeService {
  final _apiClientService = locator<ApiClientService>();

  Future<Response> getUserDetails({required String userId}) async {
    return await _apiClientService.request(
      method: Methods.get,
      url: ApiConstants.userDetails + userId,
    );
  }
}
