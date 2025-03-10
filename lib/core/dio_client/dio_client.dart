import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:hospital/config/const/app/api_endpoints.dart';
import 'package:hospital/config/utilities/keys/app_keys.dart';
import 'package:hospital/main.dart';

import 'api_provider.dart';
import 'request_params.dart';

class DioClient implements ApiProvider {
  static DioClient? _instance;
  DioClient._();
  static DioClient get instance {
    _instance ??= DioClient._();
    return _instance!;
  }

  CancelToken cancelToken = CancelToken();

  Dio _createDio(APIRequestParam param) {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiEndPoints.baseUrl,
        connectTimeout: const Duration(milliseconds: 100000),
        receiveTimeout: const Duration(milliseconds: 50000),
        followRedirects: false,
        contentType: 'application/json',
      ),
    );

    // Add a custom HttpClientAdapter for self-signed certificates
    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate = (client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };

    dio.interceptors.add(LogInterceptor(
      request: true,
      responseBody: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
      logPrint: (object) => log('$object '),
    ));

    dio.options.headers['Authorization'] = param.accessToken ?? prefs.getString(AppKeys.accessToken);

    return dio;
  }

  @override
  Future<Either<DioException, Response>> delete(APIRequestParam param) async {
    return await Task(() async => await _createDio(param).delete(
          param.path,
          data: param.data,
          queryParameters: param.queryParameters,
          options: param.options,
        )).attempt().run().then((either) {
      return either.fold((l) {
        return Left(l as DioException);
      }, (r) {
        return Right(r);
      });
    });
  }

  @override
  Future<Either<DioException, Response>> get(APIRequestParam param) async {
    return await Task(() async => await _createDio(param).get(
          param.path,
          queryParameters: param.queryParameters,
          options: param.options,
        )).attempt().run().then((either) {
      return either.fold((l) {
        return Left(l as DioException);
      }, (r) {
        return Right(r);
      });
    });
  }

  @override
  Future<Either<DioException, Response>> patch(APIRequestParam param) async {
    return await Task(() async => await _createDio(param).patch(
          param.path,
          data: param.data,
          queryParameters: param.queryParameters,
          options: param.options,
        )).attempt().run().then((either) {
      return either.fold((l) {
        return Left(l as DioException);
      }, (r) {
        return Right(r);
      });
    });
  }

  @override
  Future<Either<DioException, Response>> post(APIRequestParam param) async {
    return await Task(() async => await _createDio(param).post(
          param.path,
          data: param.data,
          queryParameters: param.queryParameters,
          options: param.options,
        )).attempt().run().then((either) {
      return either.fold((l) {
        return Left(l as DioException);
      }, (r) {
        return Right(r);
      });
    });
  }

  @override
  Future<Either<DioException, Response>> put(APIRequestParam param) async {
    return await Task(() async => await _createDio(param).put(
      param.path,
      data: param.data,
      queryParameters: param.queryParameters,
      options: param.options,
    )).attempt().run().then((either) {
      return either.fold((l) {
        return Left(l as DioException);
      }, (r) {
        return Right(r);
      });
    });
  }

  @override
  Future<Either<DioException, Response>> download(APIRequestParam param) {
    throw UnimplementedError();
  }
}
