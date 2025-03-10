import 'dart:convert';

class AllRoomDisplayEntity {
  int? id;
  String? name;
  dynamic deacription;
  String? status;
  int? createBy;
  dynamic updateBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  AllRoomDisplayEntity({
    this.id,
    this.name,
    this.deacription,
    this.status,
    this.createBy,
    this.updateBy,
    this.createdAt,
    this.updatedAt,
  });

  AllRoomDisplayEntity copyWith({
    int? id,
    String? name,
    dynamic deacription,
    String? status,
    int? createBy,
    dynamic updateBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      AllRoomDisplayEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        deacription: deacription ?? this.deacription,
        status: status ?? this.status,
        createBy: createBy ?? this.createBy,
        updateBy: updateBy ?? this.updateBy,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory AllRoomDisplayEntity.fromRawJson(String str) => AllRoomDisplayEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AllRoomDisplayEntity.fromJson(Map<String, dynamic> json) => AllRoomDisplayEntity(
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
