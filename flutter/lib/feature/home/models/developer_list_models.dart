import 'dart:convert';

DeveloperListModel devloperListModelFromJson(String str) =>
    DeveloperListModel.fromJson(json.decode(str));

class DeveloperListModel {
  DeveloperListModel({
    this.success,
    this.message,
    this.data,
  });

  final bool? success;
  final String? message;
  final List<ADeveloperModel>? data;

  factory DeveloperListModel.fromJson(Map<String, dynamic> json) =>
      DeveloperListModel(
        success: json['success'] == null ? null : json['success'],
        message: json['message'] == null ? null : json['message'],
        data: json['data'] == null
            ? null
            : List<ADeveloperModel>.from(
                json['data'].map((x) => ADeveloperModel.fromJson(x))),
      );
}

class ADeveloperModel {
  ADeveloperModel({
    this.id,
    this.developerName,
    this.companyId,
    this.email,
    this.role,
    this.yearOfExperience,
    this.inductionComment,
    this.techStack,
    this.dateJoined,
    this.isEngaged,
  });

  final String? id;
  final String? developerName;
  final String? companyId;
  final String? email;
  final String? role;
  final double? yearOfExperience;
  final String? inductionComment;
  final List<String>? techStack;
  final DateTime? dateJoined;
  final bool? isEngaged;

  factory ADeveloperModel.fromJson(Map<String, dynamic> json) =>
      ADeveloperModel(
        id: json["id"] == null ? null : json["id"],
        developerName:
            json["developer_name"] == null ? null : json["developer_name"],
        companyId: json["company_id"] == null ? null : json["company_id"],
        email: json["email"] == null ? null : json["email"],
        role: json["role"] == null ? null : json["role"],
        yearOfExperience: json["year_of_experience"] == null
            ? null
            : json["year_of_experience"],
        inductionComment: json["induction_comment"] == null
            ? null
            : json["induction_comment"],
        techStack: json["tech_stack"] == null
            ? null
            : List<String>.from(json["tech_stack"].map((x) => x)),
        dateJoined: json["date_joined"] == null
            ? null
            : DateTime.parse(json["date_joined"]),
        isEngaged: json["is_engaged"] == null ? null : json["is_engaged"],
      );
}
