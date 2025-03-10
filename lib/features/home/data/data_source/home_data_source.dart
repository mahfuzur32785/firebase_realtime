import 'package:dartz/dartz.dart';
import 'package:hospital/config/const/app/api_endpoints.dart';
import 'package:hospital/core/dio_client/dio_client.dart';
import 'package:hospital/core/dio_client/request_params.dart';
import 'package:hospital/core/error/api_error_generator.dart';
import 'package:hospital/core/error/error.dart';
import 'package:hospital/features/home/data/model/all_room_display_payload.dart';
import 'package:hospital/features/home/data/model/all_room_single_payload.dart';
import 'package:hospital/features/home/data/model/multi_room_display_payload.dart';
import 'package:hospital/features/home/domain/entities/all_room_display_entity.dart';
import 'package:hospital/features/home/domain/entities/multi_room_display_entity.dart';

class HomeDataSource {
  final DioClient client = DioClient.instance;

  Future<Either<Failure, List<AllRoomDisplayEntity>>> getAllRoomDisplayDataList() async {

    final arg = APIRequestParam(
      path: ApiEndPoints.roomDisplayShowAllApi,
    );

    return await client.get(arg).then(
          (response) {
        return response.fold(
              (error) {
            return Left(ApiErrorGenerator.apiError(error));
          }, (success) {
          try {
            final data = success.data;
            if (data['status']=='success') {
              final AllRoomDisplayPayload allRoomDisplayPayload = AllRoomDisplayPayload.fromJson(data);
              return Right(allRoomDisplayPayload.data!);
            } else {
              return Left(InvalidFormatFailure(
                message: 'Data not Found',
              ));
            }
          } catch (e) {
            return Left(InvalidFormatFailure(
              message: e.toString(),
            ));
          }
        },
        );
      },
    );
  }

  Future<Either<Failure,AllRoomSinglePayload>> getSingleAllRoomDisplayData({required int id}) async {

    final arg = APIRequestParam(
      path: ApiEndPoints.roomDisplayShowSingleApi(id),
    );

    return await client.get(arg).then(
          (response) {
        return response.fold(
              (error) {
            return Left(ApiErrorGenerator.apiError(error));
          }, (success) {
          try {
            final data = success.data;
            if (data['status']=='success') {
              final AllRoomSinglePayload allRoomDisplayPayload = AllRoomSinglePayload.fromJson(data);
              return Right(allRoomDisplayPayload);
            } else {
              return Left(InvalidFormatFailure(
                message: 'Data not Found',
              ));
            }
          } catch (e) {
            return Left(InvalidFormatFailure(
              message: e.toString(),
            ));
          }
        },
        );
      },
    );
  }

  Future<Either<Failure, List<MultiRoomDisplayEntity>>> getMultiRoomDisplayDataList() async {

    final arg = APIRequestParam(
      path: ApiEndPoints.multiRoomDisplayAllApi,
    );

    return await client.get(arg).then(
          (response) {
        return response.fold(
              (error) {
            return Left(ApiErrorGenerator.apiError(error));
          }, (success) {
          try {
            final data = success.data;
            if (data['status']=='success') {
              final MultiRoomDisplayPayload multiRoomDisplayPayload = MultiRoomDisplayPayload.fromJson(data);
              return Right(multiRoomDisplayPayload.data!);
            } else {
              return Left(InvalidFormatFailure(
                message: 'Data not Found',
              ));
            }
          } catch (e) {
            return Left(InvalidFormatFailure(
              message: e.toString(),
            ));
          }
        },
        );
      },
    );
  }






}