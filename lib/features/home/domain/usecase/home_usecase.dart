import 'package:dartz/dartz.dart';
import 'package:hospital/core/error/error.dart';
import 'package:hospital/features/home/data/model/all_room_single_payload.dart';
import 'package:hospital/features/home/domain/entities/all_room_display_entity.dart';
import 'package:hospital/features/home/domain/entities/multi_room_display_entity.dart';
import 'package:hospital/features/home/domain/repository/home_repository.dart';

class HomeUseCase {
  final HomeRepository repository;

  HomeUseCase({required this.repository});

  Future<Either<Failure,List<AllRoomDisplayEntity>>> getAllRoomDisplayDataList() async {
    return await repository.getAllRoomDisplayDataList();
  }
  Future<Either<Failure,AllRoomSinglePayload>> getSingleAllRoomDisplayData({required int id}) async {
    return await repository.getSingleAllRoomDisplayData(id: id);
  }



  Future<Either<Failure,List<MultiRoomDisplayEntity>>> getMultiRoomDisplayDataList() async {
    return await repository.getMultiRoomDisplayDataList();
  }
}