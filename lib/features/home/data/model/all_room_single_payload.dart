import 'dart:convert';

import 'package:hospital/features/home/domain/entities/multi_room_display_entity.dart';

class AllRoomSinglePayload {
  String? status;
  String? message;
  Room? room;
  Lasttoken? lasttoken;

  AllRoomSinglePayload({
    this.status,
    this.message,
    this.room,
    this.lasttoken,
  });

  AllRoomSinglePayload copyWith({
    String? status,
    String? message,
    Room? room,
    Lasttoken? lasttoken,
  }) =>
      AllRoomSinglePayload(
        status: status ?? this.status,
        message: message ?? this.message,
        room: room ?? this.room,
        lasttoken: lasttoken ?? this.lasttoken,
      );

  factory AllRoomSinglePayload.fromRawJson(String str) => AllRoomSinglePayload.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AllRoomSinglePayload.fromJson(Map<String, dynamic> json) => AllRoomSinglePayload(
    status: json["status"],
    message: json["message"],
    room: json["room"] == null ? null : Room.fromJson(json["room"]),
    lasttoken: json["lasttoken"] == null ? null : Lasttoken.fromJson(json["lasttoken"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "room": room?.toJson(),
    "lasttoken": lasttoken?.toJson(),
  };
}


class Lasttoken {
  int? id;
  int? doctorId;
  int? patientId;
  int? roomId;
  String? tokenNumber;
  String? status;
  int? atendBy;
  DateTime? callTime;
  DateTime? date;
  int? createBy;
  dynamic updateBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  Doctor? doctor;
  dynamic department;
  Room? room;
  Patient? patient;

  Lasttoken({
    this.id,
    this.doctorId,
    this.patientId,
    this.roomId,
    this.tokenNumber,
    this.status,
    this.atendBy,
    this.callTime,
    this.date,
    this.createBy,
    this.updateBy,
    this.createdAt,
    this.updatedAt,
    this.doctor,
    this.department,
    this.room,
    this.patient,
  });

  Lasttoken copyWith({
    int? id,
    int? doctorId,
    int? patientId,
    int? roomId,
    String? tokenNumber,
    String? status,
    int? atendBy,
    DateTime? callTime,
    DateTime? date,
    int? createBy,
    dynamic updateBy,
    DateTime? createdAt,
    DateTime? updatedAt,
    Doctor? doctor,
    dynamic department,
    Room? room,
    Patient? patient,
  }) =>
      Lasttoken(
        id: id ?? this.id,
        doctorId: doctorId ?? this.doctorId,
        patientId: patientId ?? this.patientId,
        roomId: roomId ?? this.roomId,
        tokenNumber: tokenNumber ?? this.tokenNumber,
        status: status ?? this.status,
        atendBy: atendBy ?? this.atendBy,
        callTime: callTime ?? this.callTime,
        date: date ?? this.date,
        createBy: createBy ?? this.createBy,
        updateBy: updateBy ?? this.updateBy,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        doctor: doctor ?? this.doctor,
        department: department ?? this.department,
        room: room ?? this.room,
        patient: patient ?? this.patient,
      );

  factory Lasttoken.fromRawJson(String str) => Lasttoken.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Lasttoken.fromJson(Map<String, dynamic> json) => Lasttoken(
    id: json["id"],
    doctorId: json["doctor_id"],
    patientId: json["patient_id"],
    roomId: json["room_id"],
    tokenNumber: json["token_number"],
    status: json["status"],
    atendBy: json["atend_by"],
    callTime: json["call_time"] == null ? null : DateTime.parse(json["call_time"]),
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    createBy: json["create_by"],
    updateBy: json["update_by"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    doctor: json["doctor"] == null ? null : Doctor.fromJson(json["doctor"]),
    department: json["department"],
    room: json["room"] == null ? null : Room.fromJson(json["room"]),
    patient: json["patient"] == null ? null : Patient.fromJson(json["patient"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "doctor_id": doctorId,
    "patient_id": patientId,
    "room_id": roomId,
    "token_number": tokenNumber,
    "status": status,
    "atend_by": atendBy,
    "call_time": callTime?.toIso8601String(),
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "create_by": createBy,
    "update_by": updateBy,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "doctor": doctor?.toJson(),
    "department": department,
    "room": room?.toJson(),
    "patient": patient?.toJson(),
  };
}


class Doctor {
  int? id;
  String? username;
  String? employeeId;
  String? name;
  dynamic surname;
  int? roleId;
  dynamic developer;
  dynamic licenceNumber;
  String? doctor;
  dynamic email;
  String? phone;
  dynamic nationality;
  String? language;
  int? departmentId;
  String? designation;
  int? specialist;
  dynamic qualification;
  dynamic workExp;
  dynamic specialization;
  dynamic fatherName;
  dynamic motherName;
  dynamic emergencyContactNo;
  DateTime? dateOfBirth;
  String? maritalStatus;
  dynamic dateOfJoining;
  dynamic dateOfLeaving;
  dynamic localAddress;
  dynamic permanentAddress;
  dynamic note;
  String? gender;
  dynamic bloodGroup;
  dynamic accountTitle;
  dynamic bankAccountNo;
  dynamic bankName;
  dynamic ifscCode;
  dynamic bankBranch;
  dynamic payscale;
  String? basicSalary;
  dynamic epfNo;
  dynamic location;
  dynamic facebook;
  dynamic twitter;
  dynamic linkedin;
  dynamic instagram;
  dynamic resume;
  dynamic joiningLetter;
  dynamic resignationLetter;
  dynamic otherDocumentName;
  dynamic otherDocumentFile;
  String? idCardNumber;
  dynamic localIdCardNumber;
  dynamic passport;
  String? image;
  String? isban;
  DateTime? lastSeen;
  dynamic emailVerifiedAt;
  dynamic signature;
  dynamic stamp;
  int? room;
  int? counter;
  int? tokenDepartmentId;
  int? tokenServiceId;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  Role? role;
  List<UserRole>? userRole;

  Doctor({
    this.id,
    this.username,
    this.employeeId,
    this.name,
    this.surname,
    this.roleId,
    this.developer,
    this.licenceNumber,
    this.doctor,
    this.email,
    this.phone,
    this.nationality,
    this.language,
    this.departmentId,
    this.designation,
    this.specialist,
    this.qualification,
    this.workExp,
    this.specialization,
    this.fatherName,
    this.motherName,
    this.emergencyContactNo,
    this.dateOfBirth,
    this.maritalStatus,
    this.dateOfJoining,
    this.dateOfLeaving,
    this.localAddress,
    this.permanentAddress,
    this.note,
    this.gender,
    this.bloodGroup,
    this.accountTitle,
    this.bankAccountNo,
    this.bankName,
    this.ifscCode,
    this.bankBranch,
    this.payscale,
    this.basicSalary,
    this.epfNo,
    this.location,
    this.facebook,
    this.twitter,
    this.linkedin,
    this.instagram,
    this.resume,
    this.joiningLetter,
    this.resignationLetter,
    this.otherDocumentName,
    this.otherDocumentFile,
    this.idCardNumber,
    this.localIdCardNumber,
    this.passport,
    this.image,
    this.isban,
    this.lastSeen,
    this.emailVerifiedAt,
    this.signature,
    this.stamp,
    this.room,
    this.counter,
    this.tokenDepartmentId,
    this.tokenServiceId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.role,
    this.userRole,
  });

  Doctor copyWith({
    int? id,
    String? username,
    String? employeeId,
    String? name,
    dynamic surname,
    int? roleId,
    dynamic developer,
    dynamic licenceNumber,
    String? doctor,
    dynamic email,
    String? phone,
    dynamic nationality,
    String? language,
    int? departmentId,
    String? designation,
    int? specialist,
    dynamic qualification,
    dynamic workExp,
    dynamic specialization,
    dynamic fatherName,
    dynamic motherName,
    dynamic emergencyContactNo,
    DateTime? dateOfBirth,
    String? maritalStatus,
    dynamic dateOfJoining,
    dynamic dateOfLeaving,
    dynamic localAddress,
    dynamic permanentAddress,
    dynamic note,
    String? gender,
    dynamic bloodGroup,
    dynamic accountTitle,
    dynamic bankAccountNo,
    dynamic bankName,
    dynamic ifscCode,
    dynamic bankBranch,
    dynamic payscale,
    String? basicSalary,
    dynamic epfNo,
    dynamic location,
    dynamic facebook,
    dynamic twitter,
    dynamic linkedin,
    dynamic instagram,
    dynamic resume,
    dynamic joiningLetter,
    dynamic resignationLetter,
    dynamic otherDocumentName,
    dynamic otherDocumentFile,
    String? idCardNumber,
    dynamic localIdCardNumber,
    dynamic passport,
    String? image,
    String? isban,
    DateTime? lastSeen,
    dynamic emailVerifiedAt,
    dynamic signature,
    dynamic stamp,
    int? room,
    int? counter,
    int? tokenDepartmentId,
    int? tokenServiceId,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
    Role? role,
    List<UserRole>? userRole,
  }) =>
      Doctor(
        id: id ?? this.id,
        username: username ?? this.username,
        employeeId: employeeId ?? this.employeeId,
        name: name ?? this.name,
        surname: surname ?? this.surname,
        roleId: roleId ?? this.roleId,
        developer: developer ?? this.developer,
        licenceNumber: licenceNumber ?? this.licenceNumber,
        doctor: doctor ?? this.doctor,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        nationality: nationality ?? this.nationality,
        language: language ?? this.language,
        departmentId: departmentId ?? this.departmentId,
        designation: designation ?? this.designation,
        specialist: specialist ?? this.specialist,
        qualification: qualification ?? this.qualification,
        workExp: workExp ?? this.workExp,
        specialization: specialization ?? this.specialization,
        fatherName: fatherName ?? this.fatherName,
        motherName: motherName ?? this.motherName,
        emergencyContactNo: emergencyContactNo ?? this.emergencyContactNo,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        maritalStatus: maritalStatus ?? this.maritalStatus,
        dateOfJoining: dateOfJoining ?? this.dateOfJoining,
        dateOfLeaving: dateOfLeaving ?? this.dateOfLeaving,
        localAddress: localAddress ?? this.localAddress,
        permanentAddress: permanentAddress ?? this.permanentAddress,
        note: note ?? this.note,
        gender: gender ?? this.gender,
        bloodGroup: bloodGroup ?? this.bloodGroup,
        accountTitle: accountTitle ?? this.accountTitle,
        bankAccountNo: bankAccountNo ?? this.bankAccountNo,
        bankName: bankName ?? this.bankName,
        ifscCode: ifscCode ?? this.ifscCode,
        bankBranch: bankBranch ?? this.bankBranch,
        payscale: payscale ?? this.payscale,
        basicSalary: basicSalary ?? this.basicSalary,
        epfNo: epfNo ?? this.epfNo,
        location: location ?? this.location,
        facebook: facebook ?? this.facebook,
        twitter: twitter ?? this.twitter,
        linkedin: linkedin ?? this.linkedin,
        instagram: instagram ?? this.instagram,
        resume: resume ?? this.resume,
        joiningLetter: joiningLetter ?? this.joiningLetter,
        resignationLetter: resignationLetter ?? this.resignationLetter,
        otherDocumentName: otherDocumentName ?? this.otherDocumentName,
        otherDocumentFile: otherDocumentFile ?? this.otherDocumentFile,
        idCardNumber: idCardNumber ?? this.idCardNumber,
        localIdCardNumber: localIdCardNumber ?? this.localIdCardNumber,
        passport: passport ?? this.passport,
        image: image ?? this.image,
        isban: isban ?? this.isban,
        lastSeen: lastSeen ?? this.lastSeen,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        signature: signature ?? this.signature,
        stamp: stamp ?? this.stamp,
        room: room ?? this.room,
        counter: counter ?? this.counter,
        tokenDepartmentId: tokenDepartmentId ?? this.tokenDepartmentId,
        tokenServiceId: tokenServiceId ?? this.tokenServiceId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        role: role ?? this.role,
        userRole: userRole ?? this.userRole,
      );

  factory Doctor.fromRawJson(String str) => Doctor.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    id: json["id"],
    username: json["username"],
    employeeId: json["employee_id"],
    name: json["name"],
    surname: json["surname"],
    roleId: json["role_id"],
    developer: json["developer"],
    licenceNumber: json["licence_number"],
    doctor: json["doctor"],
    email: json["email"],
    phone: json["phone"],
    nationality: json["nationality"],
    language: json["language"],
    departmentId: json["department_id"],
    designation: json["designation"],
    specialist: json["specialist"],
    qualification: json["qualification"],
    workExp: json["work_exp"],
    specialization: json["specialization"],
    fatherName: json["father_name"],
    motherName: json["mother_name"],
    emergencyContactNo: json["emergency_contact_no"],
    dateOfBirth: json["date_of_birth"] == null ? null : DateTime.parse(json["date_of_birth"]),
    maritalStatus: json["marital_status"],
    dateOfJoining: json["date_of_joining"],
    dateOfLeaving: json["date_of_leaving"],
    localAddress: json["local_address"],
    permanentAddress: json["permanent_address"],
    note: json["note"],
    gender: json["gender"],
    bloodGroup: json["blood_group"],
    accountTitle: json["account_title"],
    bankAccountNo: json["bank_account_no"],
    bankName: json["bank_name"],
    ifscCode: json["ifsc_code"],
    bankBranch: json["bank_branch"],
    payscale: json["payscale"],
    basicSalary: json["basic_salary"],
    epfNo: json["epf_no"],
    location: json["location"],
    facebook: json["facebook"],
    twitter: json["twitter"],
    linkedin: json["linkedin"],
    instagram: json["instagram"],
    resume: json["resume"],
    joiningLetter: json["joining_letter"],
    resignationLetter: json["resignation_letter"],
    otherDocumentName: json["other_document_name"],
    otherDocumentFile: json["other_document_file"],
    idCardNumber: json["id_card_number"],
    localIdCardNumber: json["local_id_card_number"],
    passport: json["passport"],
    image: json["image"],
    isban: json["isban"],
    lastSeen: json["last_seen"] == null ? null : DateTime.parse(json["last_seen"]),
    emailVerifiedAt: json["email_verified_at"],
    signature: json["signature"],
    stamp: json["stamp"],
    room: json["room"],
    counter: json["counter"],
    tokenDepartmentId: json["token_department_id"],
    tokenServiceId: json["token_service_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    role: json["role"] == null ? null : Role.fromJson(json["role"]),
    userRole: json["user_role"] == null ? [] : List<UserRole>.from(json["user_role"]!.map((x) => UserRole.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "employee_id": employeeId,
    "name": name,
    "surname": surname,
    "role_id": roleId,
    "developer": developer,
    "licence_number": licenceNumber,
    "doctor": doctor,
    "email": email,
    "phone": phone,
    "nationality": nationality,
    "language": language,
    "department_id": departmentId,
    "designation": designation,
    "specialist": specialist,
    "qualification": qualification,
    "work_exp": workExp,
    "specialization": specialization,
    "father_name": fatherName,
    "mother_name": motherName,
    "emergency_contact_no": emergencyContactNo,
    "date_of_birth": "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
    "marital_status": maritalStatus,
    "date_of_joining": dateOfJoining,
    "date_of_leaving": dateOfLeaving,
    "local_address": localAddress,
    "permanent_address": permanentAddress,
    "note": note,
    "gender": gender,
    "blood_group": bloodGroup,
    "account_title": accountTitle,
    "bank_account_no": bankAccountNo,
    "bank_name": bankName,
    "ifsc_code": ifscCode,
    "bank_branch": bankBranch,
    "payscale": payscale,
    "basic_salary": basicSalary,
    "epf_no": epfNo,
    "location": location,
    "facebook": facebook,
    "twitter": twitter,
    "linkedin": linkedin,
    "instagram": instagram,
    "resume": resume,
    "joining_letter": joiningLetter,
    "resignation_letter": resignationLetter,
    "other_document_name": otherDocumentName,
    "other_document_file": otherDocumentFile,
    "id_card_number": idCardNumber,
    "local_id_card_number": localIdCardNumber,
    "passport": passport,
    "image": image,
    "isban": isban,
    "last_seen": lastSeen?.toIso8601String(),
    "email_verified_at": emailVerifiedAt,
    "signature": signature,
    "stamp": stamp,
    "room": room,
    "counter": counter,
    "token_department_id": tokenDepartmentId,
    "token_service_id": tokenServiceId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "deleted_at": deletedAt,
    "role": role?.toJson(),
    "user_role": userRole == null ? [] : List<dynamic>.from(userRole!.map((x) => x.toJson())),
  };
}

class Role {
  int? id;
  String? name;

  Role({
    this.id,
    this.name,
  });

  Role copyWith({
    int? id,
    String? name,
  }) =>
      Role(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory Role.fromRawJson(String str) => Role.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class UserRole {
  int? id;
  int? staffId;
  int? roleId;
  int? createBy;
  dynamic updateBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserRole({
    this.id,
    this.staffId,
    this.roleId,
    this.createBy,
    this.updateBy,
    this.createdAt,
    this.updatedAt,
  });

  UserRole copyWith({
    int? id,
    int? staffId,
    int? roleId,
    int? createBy,
    dynamic updateBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      UserRole(
        id: id ?? this.id,
        staffId: staffId ?? this.staffId,
        roleId: roleId ?? this.roleId,
        createBy: createBy ?? this.createBy,
        updateBy: updateBy ?? this.updateBy,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory UserRole.fromRawJson(String str) => UserRole.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserRole.fromJson(Map<String, dynamic> json) => UserRole(
    id: json["id"],
    staffId: json["staff_id"],
    roleId: json["role_id"],
    createBy: json["create_by"],
    updateBy: json["update_by"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "staff_id": staffId,
    "role_id": roleId,
    "create_by": createBy,
    "update_by": updateBy,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Patient {
  int? id;
  int? patientCategoryId;
  dynamic howToKnowId;
  String? hospitalId;
  String? firstName;
  dynamic lastName;
  String? idCardNumber;
  String? email;
  String? phone;
  dynamic guardianName;
  dynamic guardianPhone;
  DateTime? dateOfBirth;
  String? gender;
  String? nationality;
  dynamic maritalStatus;
  dynamic remarks;
  String? address;
  String? photo;
  dynamic signature;
  dynamic bloodGroup;
  String? status;
  dynamic lastSeen;
  String? advanceAmount;
  dynamic document;
  int? createBy;
  dynamic updateBy;
  DateTime? createdAt;
  dynamic updatedAt;
  Room? category;
  dynamic howToKnow;
  Createby? createby;
  dynamic updateby;

  Patient({
    this.id,
    this.patientCategoryId,
    this.howToKnowId,
    this.hospitalId,
    this.firstName,
    this.lastName,
    this.idCardNumber,
    this.email,
    this.phone,
    this.guardianName,
    this.guardianPhone,
    this.dateOfBirth,
    this.gender,
    this.nationality,
    this.maritalStatus,
    this.remarks,
    this.address,
    this.photo,
    this.signature,
    this.bloodGroup,
    this.status,
    this.lastSeen,
    this.advanceAmount,
    this.document,
    this.createBy,
    this.updateBy,
    this.createdAt,
    this.updatedAt,
    this.category,
    this.howToKnow,
    this.createby,
    this.updateby,
  });

  Patient copyWith({
    int? id,
    int? patientCategoryId,
    dynamic howToKnowId,
    String? hospitalId,
    String? firstName,
    dynamic lastName,
    String? idCardNumber,
    String? email,
    String? phone,
    dynamic guardianName,
    dynamic guardianPhone,
    DateTime? dateOfBirth,
    String? gender,
    String? nationality,
    dynamic maritalStatus,
    dynamic remarks,
    String? address,
    String? photo,
    dynamic signature,
    dynamic bloodGroup,
    String? status,
    dynamic lastSeen,
    String? advanceAmount,
    dynamic document,
    int? createBy,
    dynamic updateBy,
    DateTime? createdAt,
    dynamic updatedAt,
    Room? category,
    dynamic howToKnow,
    Createby? createby,
    dynamic updateby,
  }) =>
      Patient(
        id: id ?? this.id,
        patientCategoryId: patientCategoryId ?? this.patientCategoryId,
        howToKnowId: howToKnowId ?? this.howToKnowId,
        hospitalId: hospitalId ?? this.hospitalId,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        idCardNumber: idCardNumber ?? this.idCardNumber,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        guardianName: guardianName ?? this.guardianName,
        guardianPhone: guardianPhone ?? this.guardianPhone,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        gender: gender ?? this.gender,
        nationality: nationality ?? this.nationality,
        maritalStatus: maritalStatus ?? this.maritalStatus,
        remarks: remarks ?? this.remarks,
        address: address ?? this.address,
        photo: photo ?? this.photo,
        signature: signature ?? this.signature,
        bloodGroup: bloodGroup ?? this.bloodGroup,
        status: status ?? this.status,
        lastSeen: lastSeen ?? this.lastSeen,
        advanceAmount: advanceAmount ?? this.advanceAmount,
        document: document ?? this.document,
        createBy: createBy ?? this.createBy,
        updateBy: updateBy ?? this.updateBy,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        category: category ?? this.category,
        howToKnow: howToKnow ?? this.howToKnow,
        createby: createby ?? this.createby,
        updateby: updateby ?? this.updateby,
      );

  factory Patient.fromRawJson(String str) => Patient.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
    id: json["id"],
    patientCategoryId: json["patient_category_id"],
    howToKnowId: json["how_to_know_id"],
    hospitalId: json["hospital_id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    idCardNumber: json["id_card_number"],
    email: json["email"],
    phone: json["phone"],
    guardianName: json["guardian_name"],
    guardianPhone: json["guardian_phone"],
    dateOfBirth: json["date_of_birth"] == null ? null : DateTime.parse(json["date_of_birth"]),
    gender: json["gender"],
    nationality: json["nationality"],
    maritalStatus: json["marital_status"],
    remarks: json["remarks"],
    address: json["address"],
    photo: json["photo"],
    signature: json["signature"],
    bloodGroup: json["blood_group"],
    status: json["status"],
    lastSeen: json["last_seen"],
    advanceAmount: json["advance_amount"],
    document: json["document"],
    createBy: json["create_by"],
    updateBy: json["update_by"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"],
    category: json["category"] == null ? null : Room.fromJson(json["category"]),
    howToKnow: json["how_to_know"],
    createby: json["createby"] == null ? null : Createby.fromJson(json["createby"]),
    updateby: json["updateby"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "patient_category_id": patientCategoryId,
    "how_to_know_id": howToKnowId,
    "hospital_id": hospitalId,
    "first_name": firstName,
    "last_name": lastName,
    "id_card_number": idCardNumber,
    "email": email,
    "phone": phone,
    "guardian_name": guardianName,
    "guardian_phone": guardianPhone,
    "date_of_birth": "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
    "gender": gender,
    "nationality": nationality,
    "marital_status": maritalStatus,
    "remarks": remarks,
    "address": address,
    "photo": photo,
    "signature": signature,
    "blood_group": bloodGroup,
    "status": status,
    "last_seen": lastSeen,
    "advance_amount": advanceAmount,
    "document": document,
    "create_by": createBy,
    "update_by": updateBy,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt,
    "category": category?.toJson(),
    "how_to_know": howToKnow,
    "createby": createby?.toJson(),
    "updateby": updateby,
  };
}

class Createby {
  int? id;
  String? name;
  String? username;
  String? employeeId;
  dynamic role;
  List<UserRole>? userRole;

  Createby({
    this.id,
    this.name,
    this.username,
    this.employeeId,
    this.role,
    this.userRole,
  });

  Createby copyWith({
    int? id,
    String? name,
    String? username,
    String? employeeId,
    dynamic role,
    List<UserRole>? userRole,
  }) =>
      Createby(
        id: id ?? this.id,
        name: name ?? this.name,
        username: username ?? this.username,
        employeeId: employeeId ?? this.employeeId,
        role: role ?? this.role,
        userRole: userRole ?? this.userRole,
      );

  factory Createby.fromRawJson(String str) => Createby.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Createby.fromJson(Map<String, dynamic> json) => Createby(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    employeeId: json["employee_id"],
    role: json["role"],
    userRole: json["user_role"] == null ? [] : List<UserRole>.from(json["user_role"]!.map((x) => UserRole.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "employee_id": employeeId,
    "role": role,
    "user_role": userRole == null ? [] : List<dynamic>.from(userRole!.map((x) => x.toJson())),
  };
}