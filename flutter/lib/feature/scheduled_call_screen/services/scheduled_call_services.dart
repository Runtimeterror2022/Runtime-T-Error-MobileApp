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

  static Future<Map<String, dynamic>?> scheduleACall(
      String? developerId, String? clientId) async {
    final dio = DioUtil().getInstance();
    final response = await dio!.post(ApiUrl.scheduleCall, data: {
      "start_date": "2022-09-15",
      "start_time": "08:00:00",
      "end_time": "09:00:00",
      "end_date": "2022-09-15",
      "cilent": clientId,
      "developer": developerId
    });
    if (response.statusCode == 200) {
      print(response.data);
      return response.data;
    }
    return null;
  }
}
