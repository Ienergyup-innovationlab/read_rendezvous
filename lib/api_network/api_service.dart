import 'dart:convert' as convert;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../utils/local_storage.dart';
import '../utils/storage_dir.dart';
import 'api_constant.dart';


mixin ApiServices {
  static final Map<String, String> _requestHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static final _options = BaseOptions(
    baseUrl: Constants.baseUrl,
    headers: _requestHeaders,
    connectTimeout: const Duration(seconds: 50),
    receiveTimeout: const Duration(seconds: 50),
  );

  Dio getDio() {
    Dio dio;
    if (kDebugMode) {
      dio = Dio(_options);
    } else {
      dio = Dio(_options)
        ..interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ));
    }
    return dio;
  }

  static final _optionsFlutterWave = BaseOptions(
    method: "Get",
    baseUrl: Constants.baseUrlFlutterWave,
    headers: _requestHeaders,
    connectTimeout: const Duration(seconds: 50),
    receiveTimeout: const Duration(seconds: 50),
  );

  static final _optionsFlutterWaveResolveAccount = BaseOptions(
    method: "Post",
    baseUrl: Constants.baseUrlFlutterWave,
    headers: _requestHeaders,
    connectTimeout: const Duration(seconds: 50),
    receiveTimeout: const Duration(seconds: 50),
  );

  Dio getDioFlutterWave() {
    Dio dio;
    if (kDebugMode) {
      dio = Dio(_optionsFlutterWave);
    } else {
      dio = Dio(_optionsFlutterWave)
        ..interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ));
    }
    return dio;
  }
  Dio getDioFlutterWaveResolveAccount() {
    Dio dio;
    if (kDebugMode) {
      dio = Dio(_optionsFlutterWaveResolveAccount);
    } else {
      dio = Dio(_optionsFlutterWaveResolveAccount)
        ..interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ));
    }
    return dio;
  }

  Future<Response?> apiPostRequests(
      String endPoint, Map<String, dynamic> credentials,
      {Map<String, dynamic>? header}) async {
    try {
      header ??= {};
      Dio dio = await getDio();
      Response response = await dio.post(endPoint,
          data: credentials,
          options: Options(headers: {
            "Authorization": "Bearer${await getAuthToken()}",
            ...header
          }));
      return response;
    } on DioError catch (e) {
      debugPrint("e.toString()");
      print(e.toString());
      // return "";
      return e.response;
    }
  }

  Future<Response?> apiPostWithStringRequests(
      String endPoint, String credentials,
      {Map<String, dynamic>? header}) async {
    try {
      header ??= {};
      Dio dio = await getDio();
      Response response = await dio.post(endPoint,
          data: credentials,
          options: Options(headers: {
            "Authorization": "Bearer " + await getAuthToken(),
            ...header
          }));
      return response;
    } on DioError catch (e) {
      debugPrint("e.toString()");
      print(e.toString());
      // return "";
      return e.response;
    }
  }

  Future<Response?> apiUploadPostRequests(
      String endPoint, Map<String, dynamic> credentials) async {
    try {
      Dio dio = await getDio();
      Response? response = await dio.post(endPoint,
          data: FormData.fromMap(credentials),
          options: Options(headers: {
            "Authorization": "Bearer " + await getAuthToken(),
            "Content-Type": "multipart/form-data"
          }));
//      print(response);
      return response;
    } on DioError catch (e) {
      return catchError(e);
    }
  }

  Future<Response?> apiGetRequests(String endPoint) async {
    try {
      Dio dio = await getDio();
      Response response = await dio.get(endPoint,
          options: Options(
              headers: {"Authorization": "Bearer " + await getAuthToken()}));
      //  debugPrint(response.data.toString());
      return response;
    } on DioError catch (e) {
      return catchError(e);
    }
  }

  Future<Response?> apiGetBanks(String endPoint) async {
    try {
      Dio dio = await getDioFlutterWave();
      Response response = await dio.get(endPoint,
          options: Options(
              headers: {"Authorization": 'Bearer FLWSECK_TEST-SANDBOXDEMOKEY-X'}));
      //  debugPrint(response.data.toString());
      return response;
    } on DioError catch (e) {
      return catchError(e);
    }
  }

  Future<Response?> apiFwResolveAccount(
      String endPoint, Map<String, dynamic> credentials,
      {Map<String, dynamic>? header}) async {
    try {
      header ??= {};
      Dio dio = await getDioFlutterWaveResolveAccount();
      Response response = await dio.post(endPoint,
          data: credentials,
          options: Options(headers: {
            "Authorization": 'Bearer FLWSECK_TEST-SANDBOXDEMOKEY-X',
            ...header
          }));
      return response;
    } on DioError catch (e) {
      debugPrint("e.toString()");
      print(e.toString());
      // return "";
      return e.response;
    }
  }

  Future<Response?> apiDeleteRequests(String endPoint) async {
    try {
      Dio dio = await getDio();
      Response response = await dio.delete(endPoint,
          options: Options(
              headers: {"Authorization": "Bearer " + await getAuthToken()}));
      return response;
    } on DioError catch (e) {
      return catchError(e);
    }
  }

  Future<dynamic> apiDeleteRequestsWithFullResponse(String endPoint) async {
    try {
      Dio dio = await getDio();
      return await dio.delete(endPoint,
          options: Options(
              headers: {"Authorization": "Bearer " + await getAuthToken()}));
    } on DioError catch (e) {
      return catchError(e);
    }
  }

  Future<Map<String, dynamic>?> apiPatchRequests(String endPoint) async {
    try {
      Dio dio = await getDio();
      final response = await dio.patch(endPoint,
          options: Options(
              headers: {"Authorization": "Bearer " + await getAuthToken()}));
      return convert.json.decode(response.toString());
    } on DioError catch (e) {
      return catchError(e);
    }
  }

  Future<Map<String, dynamic>?> apiPatchWithDataRequests(
      String endPoint, Map<String, dynamic> credentials) async {
    try {
      Dio dio = await getDio();
      final response = await dio.patch(endPoint,
          data: credentials,
          options: Options(
              headers: {"Authorization": "Bearer " + await getAuthToken()}));
      return convert.json.decode(response.toString());
    } on DioError catch (e) {
      return catchError(e);
    }
  }

  Future<Response?> apiPutRequests(
      String endPoint, Map<String, dynamic> credentials,) async {
    try {
      Dio dio = await getDio();
      final response = await dio.put(endPoint,
          data: FormData.fromMap(credentials),
          options: Options(
              headers: {"Authorization": "Bearer " + await getAuthToken()}));
      return response;
    } on DioError catch (e) {

      return e.response;
    }
  }


  Future<Response?> apiPutDeactivateAcc(String endPoint) async {
    try {
      Dio dio = await getDio();
      final response = await dio.put(endPoint,
          options: Options(
              headers: {"Authorization": "Bearer " + await getAuthToken()}));
      return response;
    } on DioError catch (e) {
      print(e);
      return catchError(e);
    }
  }

  Future<Map<String, dynamic>?> apiUploadPutRequests(
      String endPoint, FormData credentials) async {
    try {
      // print(credentials.files);
      Dio dio = await getDio();
      final response = await dio.post(endPoint,
          data: credentials,
          options: Options(
              headers: {"Authorization": "Bearer " + await getAuthToken()}));
      return convert.json.decode(response.toString());
    } on DioError catch (e) {
      print(e);
      return catchError(e);
    }
  }

  Future<Response?> apiPatchRequestsWithCredentials(
      String endPoint, Map<String, dynamic> credentials) async {
    try {
      Dio dio = await getDio();
      final response = await dio.patch(endPoint,
          data: credentials,
          options: Options(
              headers: {"Authorization": "Bearer " + await getAuthToken()}));
      return response;
    } on DioError catch (e) {
      return catchError(e);
    }
  }

  Future<Response?> apiImageUpload(String endPoint, FormData formdata) async {
    try {
      Dio dio = await getDio();
      final response = await dio.post(endPoint,
          data: formdata,
          options: Options(
              headers: {"Authorization": "Bearer " + await getAuthToken()}));
      return response;
    } on DioError catch (e) {
      return catchError(e);
    }
  }

  Future<Map<String, dynamic>?> apiGenericGetRequest(
      String token, String endPoint, String baseUrl) async {
    try {
      Dio dio = Dio(BaseOptions(
        baseUrl: baseUrl,
        headers: _requestHeaders,
        connectTimeout: Duration(seconds: 20),
        receiveTimeout: Duration(seconds: 20),
      ));
      final response = await dio.get(endPoint,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      return convert.json.decode(response.toString());
    } on DioError catch (e) {
      return catchError(e);
    }
  }

  catchError(DioError e) {
    if (e.message.toString().contains("SocketException")) {
      throw ({
        "status": "error",
        "message": "Network Error! Check your internet connection."
      });
    }

    if (e.message.toString().contains("timed out")) {
      throw ({"status": "error", "message": "Connection timeout."});
    }

    if (e.message.toString().contains("CONNECT_TIMEOUT")) {
      return {"status": "error", "message": "Connection timeout."};
    }

    if (e.message.runtimeType.toString() == "String") {
      return {"status": "error", "message": e.message};
    }

    if (e.response?.statusCode == 422) {
      return {
        "status": "error",
        "message": e.response?.data?["data"],
      };
    }

    if (e.response != null) {
      checkForExpiredToken(e);

      return {
        "status": "error",
        "message": e.response?.data,
      };
    } else {
      return {
        "status": "error",
        "message": "Error connecting to network!",
      };
    }
  }
  Future<String> getAuthToken() async {
    final localStorage = LocalStorage();
    String? token = await localStorage.fetch(StorageDir.authToken);
    return token ?? "";
  }


  checkForExpiredToken(DioError e) {
    if (e.response != null &&
        e.response!.data.runtimeType.toString().toLowerCase().contains("map")) {
      if (e.response!.data["message"]
          .toString()
          .toLowerCase()
          .contains("unauthenticated")) {

      }
    }
  }
}
