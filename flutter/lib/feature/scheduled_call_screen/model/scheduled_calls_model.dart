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
    this.devList,
  });

  bool? success;
  String? message;
  List<ScheduleCallsData>? data;
  List<List<DevList>>? devList;

  factory ScheduledCallsModel.fromJson(Map<String, dynamic> json) =>
      ScheduledCallsModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<ScheduleCallsData>.from(
                json["data"].map((x) => ScheduleCallsData.fromJson(x))),
        devList: json["dev_list"] == null
            ? null
            : List<List<DevList>>.from(json["dev_list"].map(
                (x) => List<DevList>.from(x.map((x) => DevList.fromJson(x))))),
      );
}

class DevList {
  DevList({
    this.id,
    this.developerName,
    this.companyId,
    this.email,
    this.role,
    this.yearOfExperience,
    this.description,
    this.techStack,
    this.dateJoined,
    this.isEngaged,
  });

  String? id;
  String? developerName;
  String? companyId;
  String? email;
  String? role;
  double? yearOfExperience;
  String? description;
  List<String>? techStack;
  DateTime? dateJoined;
  bool? isEngaged;

  factory DevList.fromJson(Map<String, dynamic> json) => DevList(
        id: json["id"] == null ? null : json["id"],
        developerName:
            json["developer_name"] == null ? null : json["developer_name"],
        companyId: json["company_id"] == null ? null : json["company_id"],
        email: json["email"] == null ? null : json["email"],
        role: json["role"] == null ? null : json["role"],
        yearOfExperience: json["year_of_experience"] == null
            ? null
            : json["year_of_experience"].toDouble(),
        description: json["description"] == null ? null : json["description"],
        techStack: json["tech_stack"] == null
            ? null
            : List<String>.from(json["tech_stack"].map((x) => x)),
        dateJoined: json["date_joined"] == null
            ? null
            : DateTime.parse(json["date_joined"]),
        isEngaged: json["is_engaged"] == null ? null : json["is_engaged"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "developer_name": developerName == null ? null : developerName,
        "company_id": companyId == null ? null : companyId,
        "email": email == null ? null : email,
        "role": role == null ? null : role,
        "year_of_experience":
            yearOfExperience == null ? null : yearOfExperience,
        "description": description == null ? null : description,
        "tech_stack": techStack == null
            ? null
            : List<dynamic>.from(techStack!.map((x) => x)),
        "date_joined": dateJoined == null
            ? null
            : "${dateJoined!.year.toString().padLeft(4, '0')}-${dateJoined!.month.toString().padLeft(2, '0')}-${dateJoined!.day.toString().padLeft(2, '0')}",
        "is_engaged": isEngaged == null ? null : isEngaged,
      };
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
