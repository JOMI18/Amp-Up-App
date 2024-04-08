// ignore_for_file: library_prefixes

import 'package:amp_up/services/dio.dart';
import 'package:amp_up/imports.dart';
import 'package:dio/dio.dart' as Dio;

class AuthController {
  final container = ProviderContainer();

  Future<Map> register(Map creds) async {
    // print(" cred----$creds");

    try {
      Dio.Response response = await axios().post('/auth/register', data: creds);

      return response.data;
    } on Dio.DioException catch (e) {
      return {'status': 'error', 'message': e.error};
    }
  }

  Future<Map> login(Map creds) async {
    try {
      Dio.Response response = await axios().post('/auth/login', data: creds);
      return response.data;
    } on Dio.DioException catch (e) {
      return {'status': 'error', 'message': e.error};
    }
  }

  Future<Map> checkOtp(Map creds) async {
    try {
      Dio.Response response = await axios().post('/auth/checkotp', data: creds);

      return response.data;
    } on Dio.DioException catch (e) {
      return {'status': 'error', 'message': e.error};
    }
  }

  Future<Map> sendOtp(Map creds) async {
    try {
      Dio.Response response = await axios().post('/auth/sendotp', data: creds);
      return response.data;
    } on Dio.DioException catch (e) {
      return {'status': 'error', 'message': e.error};
    }
  }

  Future<Map> createTxPin(Map creds) async {
    try {
      Dio.Response response =
          await axios().post('/account/createtxpin', data: creds);
      print(response);

      return response.data;
    } on Dio.DioException catch (e) {
      return {'status': 'error', 'message': e.error};
    }
  }

  Future<Map> verifyBvn(Map creds) async {
    try {
      Dio.Response response =
          await axios().post('/account/verifybvn', data: creds);

      return response.data;
    } on Dio.DioException catch (e) {
      return {'status': 'error', 'message': e.error};
    }
  }

  Future<Map> sendSms(Map creds) async {
    try {
      Dio.Response response =
          await axios().post('/account/SendSmsOtp', data: creds);

      return response.data;
    } on Dio.DioException catch (e) {
      return {'status': 'error', 'message': e.error};
    }
  }
}
