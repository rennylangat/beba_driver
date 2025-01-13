import 'dart:developer';
import 'dart:io';

import 'package:beba_driver/app/app.locator.dart';
import 'package:beba_driver/ui/common/req_methods.dart';
import 'package:beba_driver/ui/common/req_options.dart';
import 'package:beba_driver/ui/views/login/login_view.dart';
import 'package:beba_driver/ui/views/widgets/cust_snackbar.dart';
import 'package:dio/dio.dart' as d;
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_secure_storage/get_secure_storage.dart';
import 'package:stacked_services/stacked_services.dart';

class ApiClientService {
  final dio = d.Dio();
  final box = GetSecureStorage();

  Future<d.Response> request({
    required String method,
    required String url,
    bool seeLogs = false,
    bool isLogin = false,
    d.FormData? formData,
    Map<String, dynamic>? body,
  }) async {
    late d.Response res;
    String token =
        box.read("token") == null ? "" : "Bearer ${box.read("token") ?? ""}";

    try {
      if (method == Methods.get) {
        res = await dio.get(
          url,
          options: ReqOptions(
            token: token,
          ),
        );
      } else if (method == Methods.post) {
        res = await dio.post(
          url,
          data: body!,
          options: ReqOptions(
            token: token,
          ),
        );
      } else if (method == Methods.put) {
        res = await dio.put(
          url,
          data: body!,
          options: ReqOptions(
            token: token,
          ),
        );
      } else if (method == Methods.patch) {
        res = await dio.patch(
          url,
          data: body!,
          options: ReqOptions(
            token: token,
          ),
        );
      } else if (method == Methods.delete) {
        res = await dio.delete(
          url,
          options: ReqOptions(
            token: token,
          ),
        );
      } else if (method == Methods.multiPart) {
        res = await dio.post(
          url,
          data: formData,
          options: ReqOptions(
            token: token,
          ),
          onSendProgress: (int sent, int total) {
            if (sent <= total) {
              EasyLoading.showProgress(
                sent / total,
                status:
                    "Uploading ${((sent / total) * 100).toStringAsFixed(0)}%",
              );
            }
          },
        );
      }

      if (res.statusCode == 200 || res.statusCode == 201) {
        EasyLoading.dismiss();
        if (seeLogs) {
          log("Ok Response: Code: ${res.statusCode} Data:\n ${res.data}");
        }
        return res;
      } else if (res.statusCode == 401) {
        if (isLogin) {
          if (seeLogs) {
            log("Unauth Response: Code: ${res.statusCode} Data:\n ${res.data}");
          }
          EasyLoading.dismiss();
          CustSnackbar.showSnackBar(
            "Error!",
            res.data["errors"][0]["detail"] ?? "Invalid credentials",
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPos.BOTTOM,
          );

          return res;
        } else {
          EasyLoading.dismiss();
          if (seeLogs) {
            log("Unauth Response: Code: ${res.statusCode} Data:\n ${res.data}");
          }
          CustSnackbar.showSnackBar(
            "Oops !",
            "Seems like your session has expired. Please login again",
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPos.BOTTOM,
          );
          box.erase();
          await box.write("firstTime", false);

          locator<NavigationService>().clearStackAndShowView(const LoginView());
        }
      } else if (res.statusCode == 500) {
        EasyLoading.dismiss();
        if (seeLogs) {
          log("Server Error occured:${res.statusCode} Data:\n ${res.data}");
        }
        CustSnackbar.showSnackBar(
          'Error',
          res.data["message"] ?? 'Internal Server Error',
          snackPosition: SnackPos.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else if (res.statusCode != 200 || res.statusCode != 201) {
        EasyLoading.dismiss();
        if (seeLogs) {
          log("Other Error occured:${res.statusCode} Data:\n ${res.data}");
        }
        if (isLogin) {
          CustSnackbar.showSnackBar(
            'Error',
            'Invalid credentials',
            snackPosition: SnackPos.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        } else {
          CustSnackbar.showSnackBar(
            'Error',
            'Oops! Something went wrong. Please try again later.',
            snackPosition: SnackPos.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      }
      return res;
    } on d.DioExceptionType catch (e) {
      if (seeLogs) log("Dio Exception Error occured: $e");
      CustSnackbar.showSnackBar(
        'Error',
        e.toString(),
        snackPosition: SnackPos.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      throw Exception(e.toString());
    } on SocketException catch (_) {
      CustSnackbar.showSnackBar(
        'Error',
        'No internet connection',
        snackPosition: SnackPos.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      throw Exception("No internet connection");
    } catch (e) {
      EasyLoading.dismiss();
      if (seeLogs) {
        log("App Error occured : ${res.statusCode} Data:\n ${res.data}");
      }
      CustSnackbar.showSnackBar(
        'Error',
        'Oops! Something went wrong. Please try again later.',
        snackPosition: SnackPos.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );

      throw Exception(e.toString());
      // rethrow;
    }
  }
}
