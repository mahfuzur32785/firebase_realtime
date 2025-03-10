import 'dart:convert';

import 'package:hospital/features/home/domain/entities/multi_room_display_entity.dart';

class MultiRoomDisplayPayload {
  String? status;
  String? message;
  List<MultiRoomDisplayEntity>? data;

  MultiRoomDisplayPayload({
    this.status,
    this.message,
    this.data,
  });

  MultiRoomDisplayPayload copyWith({
    String? status,
    String? message,
    List<MultiRoomDisplayEntity>? data,
  }) =>
      MultiRoomDisplayPayload(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory MultiRoomDisplayPayload.fromRawJson(String str) => MultiRoomDisplayPayload.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MultiRoomDisplayPayload.fromJson(Map<String, dynamic> json) => MultiRoomDisplayPayload(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<MultiRoomDisplayEntity>.from(json["data"]!.map((x) => MultiRoomDisplayEntity.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}
