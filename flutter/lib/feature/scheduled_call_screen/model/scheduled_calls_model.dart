// To parse this JSON data, do
//
//     final scheduledCallsModel = scheduledCallsModelFromJson(jsonString);

import 'dart:convert';

ScheduledCallsModel scheduledCallsModelFromJson(String str) =>
    ScheduledCallsModel.fromJson(json.decode(str));

class ScheduledCallsModel {
  ScheduledCallsModel({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  List<ScheduleCallsData>? data;

  factory ScheduledCallsModel.fromJson(Map<String, dynamic> json) =>
      ScheduledCallsModel(
        success: json['success'] == null ? null : json['success'],
        message: json['message'] == null ? null : json['message'],
        data: json['data'] == null
            ? null
            : List<ScheduleCallsData>.from(
                json['data'].map((x) => ScheduleCallsData.fromJson(x))),
      );
}

class ScheduleCallsData {
  ScheduleCallsData({
    this.id,
    this.cilentId,
    this.developerId,
    this.startDate,
    this.startTime,
    this.endDate,
    this.endTime,
    this.meetingLink,
  });

  int? id;
  String? cilentId;
  String? developerId;
  DateTime? startDate;
  String? startTime;
  DateTime? endDate;
  String? endTime;
  dynamic meetingLink;

  factory ScheduleCallsData.fromJson(Map<String, dynamic> json) =>
      ScheduleCallsData(
        id: json['id'] == null ? null : json['id'],
        cilentId: json['cilent_id'] == null ? null : json['cilent_id'],
        developerId: json['developer_id'] == null ? null : json['developer_id'],
        startDate: json['start_date'] == null
            ? null
            : DateTime.parse(json['start_date']),
        startTime: json['start_time'] == null ? null : json['start_time'],
        endDate:
            json['end_date'] == null ? null : DateTime.parse(json['end_date']),
        endTime: json['end_time'] == null ? null : json['end_time'],
        meetingLink: json['meeting_link'],
      );
}
