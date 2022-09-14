// To parse this JSON data, do
//
//     final clientListModel = clientListModelFromJson(jsonString);

import 'dart:convert';

ClientListModel clientListModelFromJson(String str) =>
    ClientListModel.fromJson(json.decode(str));

String clientListModelToJson(ClientListModel data) =>
    json.encode(data.toJson());

class ClientListModel {
  ClientListModel({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  List<ClientListData>? data;

  factory ClientListModel.fromJson(Map<String, dynamic> json) =>
      ClientListModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<ClientListData>.from(
                json["data"].map((x) => ClientListData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "message": message == null ? null : message,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ClientListData {
  ClientListData({
    this.id,
    this.cilentName,
    this.cilentEmail,
    this.cilentCompanyName,
    this.projectId,
  });

  String? id;
  String? cilentName;
  String? cilentEmail;
  String? cilentCompanyName;
  String? projectId;

  factory ClientListData.fromJson(Map<String, dynamic> json) => ClientListData(
        id: json["id"] == null ? null : json["id"],
        cilentName: json["cilent_name"] == null ? null : json["cilent_name"],
        cilentEmail: json["cilent_email"] == null ? null : json["cilent_email"],
        cilentCompanyName: json["cilent_company_name"] == null
            ? null
            : json["cilent_company_name"],
        projectId: json["project_id"] == null ? null : json["project_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "cilent_name": cilentName == null ? null : cilentName,
        "cilent_email": cilentEmail == null ? null : cilentEmail,
        "cilent_company_name":
            cilentCompanyName == null ? null : cilentCompanyName,
        "project_id": projectId == null ? null : projectId,
      };
}
