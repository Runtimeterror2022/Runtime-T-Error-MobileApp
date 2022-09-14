import 'package:mvc_bolierplate_getx/core/api_service/dio_service.dart';
import 'package:mvc_bolierplate_getx/core/routes/api_routes.dart';

class HomeService {
  static Future<Map<String, dynamic>?> getAllDevelopers() async {
    final dio = DioUtil().getInstance();
    final response =
        await dio!.post(ApiUrl.getAllDevelopers, data: {'developer_id': ''});
    if (response.statusCode == 200) {
      print(response.data);
      return response.data;
    }
    return null;
  }

  static Future<Map<String, dynamic>?> getAllClients() async {
    final dio = DioUtil().getInstance();
    final response =
        await dio!.post(ApiUrl.getAllClient, data: {'cilent_id': ''});
    if (response.statusCode == 200) {
      print(response.data);
      return response.data;
    }
    return null;
  }
}
