import 'package:beba_driver/app/app.locator.dart';
import 'package:beba_driver/services/api_client_service.dart';
import 'package:beba_driver/ui/common/api_constants.dart';
import 'package:beba_driver/ui/common/req_methods.dart';
import 'package:dio/dio.dart';

class AuthService {
  final _apiClientService = locator<ApiClientService>();

  Future<Response> loginUser({
    required String phone,
    required String password,
    required String deviceId,
  }) async {
    return await _apiClientService.request(
      method: Methods.post,
      url: ApiConstants.login,
      body: {
        'phone': phone,
        'password': password,
        "device_id": deviceId,
        "device_meta": ""
      },
    );
  }

  Future<Response> createUser(
      {required String phone, required String password}) async {
    return await _apiClientService.request(
      method: Methods.post,
      url: ApiConstants.register,
      body: {
        'phone': phone,
        'password': password,
      },
    );
  }
}
