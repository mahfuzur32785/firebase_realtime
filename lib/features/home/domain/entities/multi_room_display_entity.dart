import 'dart:convert';

class MultiRoomDisplayEntity {
  int? id;
  String? name;
  dynamic deacription;
  String? status;
  int? createBy;
  dynamic updateBy;
  DateTime? createdAt;
  dynamic updatedAt;
  List<RoomList>? roomList;

  MultiRoomDisplayEntity({
    this.id,
    this.name,
    this.deacription,
    this.status,
    this.createBy,
    this.updateBy,
    this.createdAt,
    this.updatedAt,
    this.roomList,
  });

  MultiRoomDisplayEntity copyWith({
    int? id,
    String? name,
    dynamic deacription,
    String? status,
    int? createBy,
    dynamic updateBy,
    DateTime? createdAt,
    dynamic updatedAt,
    List<RoomList>? roomList,
  }) =>
      MultiRoomDisplayEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        deacription: deacription ?? this.deacription,
        status: status ?? this.status,
        createBy: createBy ?? this.createBy,
        updateBy: updateBy ?? this.updateBy,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        roomList: roomList ?? this.roomList,
      );

  factory MultiRoomDisplayEntity.fromRawJson(String str) => MultiRoomDisplayEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MultiRoomDisplayEntity.fromJson(Map<String, dynamic> json) => MultiRoomDisplayEntity(
    id: json["id"],
    name: json["name"],
    deacription: json["deacription"],
    status: json["status"],
    createBy: json["create_by"],
    updateBy: json["update_by"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"],
    roomList: json["room"] == null ? [] : List<RoomList>.from(json["room"]!.map((x) => RoomList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "deacription": deacription,
    "status": status,
    "create_by": createBy,
    "update_by": updateBy,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt,
    "room": roomList == null ? [] : List<dynamic>.from(roomList!.map((x) => x.toJson())),
  };
}

class RoomList {
  int? id;
  int? roomDisplayId;
  int? roomId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Room? room;

  RoomList({
    this.id,
    this.roomDisplayId,
    this.roomId,
    this.createdAt,
    this.updatedAt,
    this.room,
  });

  RoomList copyWith({
    int? id,
    int? roomDisplayId,
    int? roomId,
    DateTime? createdAt,
    DateTime? updatedAt,
    Room? room,
  }) =>
      RoomList(
        id: id ?? this.id,
        roomDisplayId: roomDisplayId ?? this.roomDisplayId,
        roomId: roomId ?? this.roomId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        room: room ?? this.room,
      );

  factory RoomList.fromRawJson(String str) => RoomList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RoomList.fromJson(Map<String, dynamic> json) => RoomList(
    id: json["id"],
    roomDisplayId: json["room_display_id"],
    roomId: json["room_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    room: json["room"] == null ? null : Room.fromJson(json["room"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "room_display_id": roomDisplayId,
    "room_id": roomId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "room": room?.toJson(),
  };
}

class Room {
  int? id;
  String? name;
  dynamic deacription;
  String? status;
  int? createBy;
  dynamic updateBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  Room({
    this.id,
    this.name,
    this.deacription,
    this.status,
    this.createBy,
    this.updateBy,
    this.createdAt,
    this.updatedAt,
  });

  Room copyWith({
    int? id,
    String? name,
    dynamic deacription,
    String? status,
    int? createBy,
    dynamic updateBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Room(
        id: id ?? this.id,
        name: name ?? this.name,
        deacription: deacription ?? this.deacription,
        status: status ?? this.status,
        createBy: createBy ?? this.createBy,
        updateBy: updateBy ?? this.updateBy,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Room.fromRawJson(String str) => Room.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Room.fromJson(Map<String, dynamic> json) => Room(
    id: json["id"],
    name: json["name"],
    deacription: json["deacription"],
    status: json["status"],
    createBy: json["create_by"],
    updateBy: json["update_by"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "deacription": deacription,
    "status": status,
    "create_by": createBy,
    "update_by": updateBy,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
