import 'package:amp_up/services/dio.dart';
import 'package:dio/dio.dart' as Dio;

class BillController {
  final String baseUrl = '/account/airtimedata';

  Future<Map> getBillPlans(Map creds) async {
    try {
      // $baseUrl/buydata
      Dio.Response response =
          await axios().post('/auth/getbillplans', data: creds);
      return response.data;
    } on Dio.DioException catch (e) {
      return {'status': 'error', 'message': e.error};
    }
  }
}
