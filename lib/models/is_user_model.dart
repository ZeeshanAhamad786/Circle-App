
import 'dart:convert';

List<isUsersModel> usersFromJson(String str) => List<isUsersModel>.from(json.decode(str).map((x) => isUsersModel.fromJson(x)));

String usersToJson(List<isUsersModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class isUsersModel {
  String phoneNumber;
  String userId;
  bool isUser;

  isUsersModel({
    required this.phoneNumber,
    required this.userId,
    required this.isUser,
  });

  factory isUsersModel.fromJson(Map<String, dynamic> json) => isUsersModel(
    phoneNumber: json["phoneNumber"],
    userId: json["userId"],
    isUser: json["isUser"],
  );

  Map<String, dynamic> toJson() => {
    "phoneNumber": phoneNumber,
    "userId": userId,
    "isUser": isUser,
  };
}
