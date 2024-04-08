import 'package:amp_up/services/dio.dart';
import 'package:dio/dio.dart' as Dio;

class AirtimeDataController {
  final String baseUrl = '/account/airtimedata';
  Future<Map> detectNetwork(Map creds) async {
    try {
      Dio.Response response =
          await axios().post('$baseUrl/detectnetwork', data: creds);
      return response.data;
    } on Dio.DioException catch (e) {
      return {'status': 'error', 'message': e.error};
    }
  }



  Future<Map> buyAirtime(Map creds) async {
    try {
      Dio.Response response =
          await axios().post('$baseUrl/buyairtime', data: creds);
      return response.data;
    } on Dio.DioException catch (e) {
      return {'status': 'error', 'message': e.error};
    }
  }

  Future<Map> buyData(Map creds) async {
    try {
      Dio.Response response =
          await axios().post('$baseUrl/buydata', data: creds);
      return response.data;
    } on Dio.DioException catch (e) {
      return {'status': 'error', 'message': e.error};
    }
  }
}
