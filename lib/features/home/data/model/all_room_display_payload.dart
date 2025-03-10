import 'dart:convert';

import 'package:hospital/features/home/domain/entities/all_room_display_entity.dart';

class AllRoomDisplayPayload {
  String? status;
  String? message;
  List<AllRoomDisplayEntity>? data;

  AllRoomDisplayPayload({
    this.status,
    this.message,
    this.data,
  });

  AllRoomDisplayPayload copyWith({
    String? status,
    String? message,
    List<AllRoomDisplayEntity>? data,
  }) =>
      AllRoomDisplayPayload(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory AllRoomDisplayPayload.fromRawJson(String str) => AllRoomDisplayPayload.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AllRoomDisplayPayload.fromJson(Map<String, dynamic> json) => AllRoomDisplayPayload(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<AllRoomDisplayEntity>.from(json["data"]!.map((x) => AllRoomDisplayEntity.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}
