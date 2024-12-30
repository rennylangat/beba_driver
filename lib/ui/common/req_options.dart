import 'package:dio/dio.dart';

class ReqOptions extends Options {
  ReqOptions({String? token})
      : super(
          validateStatus: (status) => status != null,
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": token,
          },
          contentType: Headers.jsonContentType,
          receiveTimeout: const Duration(seconds: 30),
        );
}
