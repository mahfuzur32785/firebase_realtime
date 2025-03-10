import 'package:dartz/dartz.dart';
import 'package:hospital/core/error/error.dart';
import 'package:hospital/features/home/data/data_source/home_data_source.dart';
import 'package:hospital/features/home/data/model/all_room_single_payload.dart';
import 'package:hospital/features/home/domain/entities/all_room_display_entity.dart';
import 'package:hospital/features/home/domain/entities/multi_room_display_entity.dart';
import 'package:hospital/features/home/domain/repository/home_repository.dart';


class HomeRepositoryImpl extends HomeRepository {
  final HomeDataSource service;

  HomeRepositoryImpl({required this.service});

  @override
  Future<Either<Failure, List<AllRoomDisplayEntity>>> getAllRoomDisplayDataList() async {
    return service.getAllRoomDisplayDataList();
  }
  @override
  Future<Either<Failure,AllRoomSinglePayload>> getSingleAllRoomDisplayData({required int id}) async {
    return service.getSingleAllRoomDisplayData(id: id);
  }


  @override
  Future<Either<Failure, List<MultiRoomDisplayEntity>>> getMultiRoomDisplayDataList() async {
    return service.getMultiRoomDisplayDataList();
  }
}
