import 'package:mvc_bolierplate_getx/core/api_service/dio_service.dart';
import 'package:mvc_bolierplate_getx/core/routes/api_routes.dart';

class HomeService {
  static Future<Map<String, dynamic>?> getAllDevelopers() async {
    final dio = DioUtil().getInstance();
    final response = await dio!.get(ApiUrl.getAllDevelopers);
    if (response.statusCode == 200) {
      return response.data;
    }
    return null;
  }
}
