// To parse this JSON data, do
//
//     final notifModel = notifModelFromJson(jsonString);

import 'dart:convert';

List<NotifModel> notifModelFromJson(String str) => List<NotifModel>.from(json.decode(str).map((x) => NotifModel.fromJson(x)));

String notifModelToJson(List<NotifModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotifModel {
    NotifModel({
        this.receiverId,
        this.hospitalName,
        this.hospitalSystem,
        this.status,
        this.notificationId,
        this.type,
        this.timestamp,
    });

    String? receiverId;
    String? hospitalName;
    String? hospitalSystem;
    String? status;
    String? notificationId;
    String? type;
    DateTime? timestamp;

    factory NotifModel.fromJson(Map<String, dynamic> json) => NotifModel(
        receiverId: json["receiver_id"],
        hospitalName: json["hospital_name"],
        hospitalSystem: json["hospital_system"],
        status: json["status"],
        notificationId: json["notification_id"],
        type: json["type"],
        timestamp: DateTime.parse(json["timestamp"]),
    );

    Map<String, dynamic> toJson() => {
        "receiver_id": receiverId,
        "hospital_name": hospitalName,
        "hospital_system": hospitalSystem,
        "status": status,
        "notification_id": notificationId,
        "type": type,
        "timestamp": timestamp!.toIso8601String(),
    };
}
