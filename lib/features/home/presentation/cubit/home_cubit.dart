import 'dart:convert';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hospital/config/utilities/enum/bloc_api_state.dart';
import 'package:hospital/features/home/data/model/all_room_single_payload.dart';
import 'package:hospital/features/home/domain/entities/all_room_display_entity.dart';
import 'package:hospital/features/home/domain/entities/multi_room_display_entity.dart';
import 'package:hospital/features/home/domain/usecase/home_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {

  final HomeUseCase useCase;
  HomeCubit({required this.useCase}) : super(HomeState.initial());


  Future<void> getAllRoomDisplayDataList({required BuildContext context}) async {

    emit(state.copyWith(
      fetchApiState: NormalApiState.loading,
      fetchError: '',
    ));
    await useCase.getAllRoomDisplayDataList().then((response) {
      response.fold((error) {
        if (kDebugMode) {
          print('getAllRoomDisplayDataList error');
        }
        emit(state.copyWith(
          fetchApiState: NormalApiState.failure,
          fetchError: error.message,
          allRoomDisplayList: []
        ));
      }, (success) {
        if (kDebugMode) {
          print('getAllRoomDisplayDataList success');
        }

        emit(
          state.copyWith(
            fetchApiState: NormalApiState.loaded,
            fetchError: '',
            allRoomDisplayList: success,
          ),
        );
      });
    });
  }
  Future<void> getSingleAllRoomDisplayData({required BuildContext context, required int id}) async {

    emit(state.copyWith(
      fetchApiState: NormalApiState.loading,
      fetchError: '',
    ));
    await useCase.getSingleAllRoomDisplayData(id: id).then((response) {
      response.fold((error) {
        if (kDebugMode) {
          print('getSingleAllRoomDisplayData error');
        }
        emit(state.copyWith(
          fetchApiState: NormalApiState.failure,
          fetchError: error.message,
          allRoomSinglePayload: null
        ));
      }, (success) {
        if (kDebugMode) {
          print('getSingleAllRoomDisplayData success');
        }

        emit(
          state.copyWith(
            fetchApiState: NormalApiState.loaded,
            fetchError: '',
            allRoomSinglePayload: success,
          ),
        );
      });
    });
  }


  Future<void> getMultiRoomDisplayDataList({required BuildContext context}) async {

    emit(state.copyWith(
      fetchApiState: NormalApiState.loading,
      fetchError: '',
    ));
    await useCase.getMultiRoomDisplayDataList().then((response) {
      response.fold((error) {
        if (kDebugMode) {
          print('getMultiRoomDisplayDataList error');
        }
        emit(state.copyWith(
          fetchApiState: NormalApiState.failure,
          fetchError: error.message,
          multiRoomDisplayList: []
        ));
      }, (success) {
        if (kDebugMode) {
          print('getMultiRoomDisplayDataList success');
        }

        emit(
          state.copyWith(
            fetchApiState: NormalApiState.loaded,
            fetchError: '',
            multiRoomDisplayList: success,
          ),
        );
      });
    });
  }



}
