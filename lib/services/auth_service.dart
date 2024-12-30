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
    required String deviceMeta,
  }) async {
    return await _apiClientService.request(
      method: Methods.post,
      url: ApiConstants.login,
      body: {
        'phone_number': phone,
        'password': password,
        "device_id": deviceId,
        "device_meta": deviceMeta,
      },
    );
  }

  Future<Response> createUser(
      {required String phoneNumber,
      required String firstName,
      required String lastName,
      required String password,
      required int userRole}) async {
    return await _apiClientService.request(
      method: Methods.post,
      url: ApiConstants.register,
      seeLogs: true,
      body: {
        "phone_number": phoneNumber,
        "first_name": firstName,
        "last_name": lastName,
        "password": password,
        "user_role": userRole,
      },
    );
  }

  Future<Response> verifyOtp(
      {required String otp, required String userId}) async {
    return await _apiClientService.request(
      method: Methods.post,
      url: ApiConstants.verifyOtp,
      body: {
        "code": otp,
        "user_id": userId,
      },
    );
  }

  Future<Response> resendOtp({required String userId}) async {
    return await _apiClientService.request(
      method: Methods.post,
      url: ApiConstants.resendOtp,
      body: {
        "user_id": userId,
      },
    );
  }
}
