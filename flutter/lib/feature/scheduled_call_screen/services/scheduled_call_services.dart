import 'package:mvc_bolierplate_getx/core/api_service/dio_service.dart';
import 'package:mvc_bolierplate_getx/core/routes/api_routes.dart';

class ScheduledCallService {
  static Future<Map<String, dynamic>?> getAllScheduledCalls(
      String? developerId) async {
    final dio = DioUtil().getInstance();
    final response = await dio!.post(ApiUrl.getAllScheduleCalls,
        data: {'developer_id': developerId ?? ''});
    if (response.statusCode == 200) {
      print(response.data);
      return response.data;
    }
    return null;
  }
}
