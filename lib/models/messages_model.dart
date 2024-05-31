class MessagesModel {
  bool success;
  List<Datum> data;
  Pagination pagination;

  MessagesModel({
    required this.success,
    required this.data,
    required this.pagination,
  });

  factory MessagesModel.fromJson(Map<String, dynamic> json) => MessagesModel(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
      };
}

class Datum {
  String id;
  String senderId;
  String text;
  String senderName;
  DateTime sentAt;
  List<Media> media;

  Datum({
    required this.id,
    required this.senderId,
    required this.text,
    required this.senderName,
    required this.sentAt,
    required this.media,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        senderId: json["senderId"],
        text: json["text"],
        senderName: json["senderName"],
        sentAt: DateTime.parse(json["sentAt"]),
        media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "senderId": senderId,
        "text": text,
        "senderName": senderName,
        "sentAt": sentAt.toIso8601String(),
        "media": List<dynamic>.from(media.map((x) => x.toJson())),
      };
}

class Media {
  String type;
  String url;
  String mimetype;

  Media({
    required this.type,
    required this.url,
    required this.mimetype,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        type: json["type"],
        url: json["url"],
        mimetype: json["mimetype"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "url": url,
        "mimetype": mimetype,
      };
}

class Pagination {
  int total;
  int pages;
  int currentPage;

  Pagination({
    required this.total,
    required this.pages,
    required this.currentPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        total: json["total"],
        pages: json["pages"],
        currentPage: json["currentPage"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "pages": pages,
        "currentPage": currentPage,
      };
}
