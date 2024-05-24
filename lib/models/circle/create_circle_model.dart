class CreateCircleModel {
  final String circleName;
  final String circleImage;
  final String description;
  final String type;
  final String interest;
  final String memberIds;

  CreateCircleModel({
    required this.circleName,
    required this.circleImage,
    required this.description,
    required this.type,
    required this.interest,
    required this.memberIds,
  });

  CreateCircleModel.fromJson(Map<String, Object?> json)
      : this(
    circleName: json["circleName"] as String,
    circleImage: json["circleImage"] as String,
    description: json["description"] as String,
    type: json["type"] as String,
    interest: json["interest"] as String,
    memberIds: json["memberIds"] as String,
  );

  Map<String, Object?> toJson() {
    return {
      "circleName": circleName??"",
      "circleImage": circleImage??"",
      "description": description??"",
      "type": type??"",
      "interest": interest??"",
      "memberIds": memberIds??"",
    };
  }
}
