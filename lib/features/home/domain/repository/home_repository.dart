import 'package:dartz/dartz.dart';
import 'package:hospital/core/error/error.dart';
import 'package:hospital/features/home/data/model/all_room_single_payload.dart';
import 'package:hospital/features/home/domain/entities/all_room_display_entity.dart';
import 'package:hospital/features/home/domain/entities/multi_room_display_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<AllRoomDisplayEntity>>> getAllRoomDisplayDataList();
  Future<Either<Failure,AllRoomSinglePayload>> getSingleAllRoomDisplayData({required int id});


  Future<Either<Failure, List<MultiRoomDisplayEntity>>> getMultiRoomDisplayDataList();
}