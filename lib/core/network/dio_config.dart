import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:habbito/core/common/constants/app_strings.dart';
import 'package:injectable/injectable.dart';

import '../../di/injection.dart';
import '../common/data/datasources/local/storage_utils.dart';
import '../error/exceptions.dart';

@lazySingleton
class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio
      ..httpClientAdapter
      ..options.headers = {'Content-Type': 'application/json'};
    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
        responseBody: false,
        error: true,
        requestHeader: false,
        responseHeader: false,
        request: false,
        requestBody: false,
      ));
    }
  }

  Future delete(APIDESTINATION destination, String uri) async {
    try {
      final apptoken = await getIt<StorageUtils>().getDataForSingle(
        key: token,
      );

      if (kDebugMode) {
        print('Token: $apptoken');
      }
      destination == APIDESTINATION.indexroute
          ? _dio.options.baseUrl = dotenv.env['INDEX_BASE_URL']!
          : _dio.options.baseUrl = dotenv.env['BASE_URL']!;

      _dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            // Add the access token to the request header
            options.headers['api-key'] = dotenv.env['INDEX_APIKEY'];
            options.headers['Authorization'] = 'Token $apptoken';

            return handler.next(options);
          },
          onError: (DioException e, handler) async {
            if (e.response?.statusCode == 401) {
              // If a 401 response is received, refresh the access token
              //String newAccessToken = await refreshToken();

              // Update the request header with the new access token
              //e.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

              // Repeat the request with the updated header
              //return handler.resolve(await dio.fetch(e.requestOptions));
            }
            return handler.next(e);
          },
        ),
      );

      var response = await _dio.delete(uri);

      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException('Unable to process the data.');
    } catch (e) {
      throw ServerException();
    }
  }

  Future put(
    APIDESTINATION destination,
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final apptoken = await getIt<StorageUtils>().getDataForSingle(
        key: token,
      );

      if (kDebugMode) {
        print('Token: $apptoken');
      }
      destination == APIDESTINATION.indexroute
          ? _dio.options.baseUrl = dotenv.env['INDEX_BASE_URL']!
          : _dio.options.baseUrl = dotenv.env['BASE_URL']!;

      _dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            // Add the access token to the request header
            options.headers['api-key'] = dotenv.env['INDEX_APIKEY'];
            options.headers['Authorization'] = 'Token $apptoken';

            return handler.next(options);
          },
          onError: (DioException e, handler) async {
            if (e.response?.statusCode == 401) {
              // If a 401 response is received, refresh the access token
              //String newAccessToken = await refreshToken();

              // Update the request header with the new access token
              //e.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

              // Repeat the request with the updated header
              //return handler.resolve(await dio.fetch(e.requestOptions));
            }
            return handler.next(e);
          },
        ),
      );

      var response = await _dio.put(
        uri,
        data: queryParameters,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException('Unable to process the data.');
    } catch (e) {
      throw ServerException();
    }
  }

  Future post(
    APIDESTINATION destination,
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final apptoken = await getIt<StorageUtils>().getDataForSingle(
        key: token,
      );

      if (kDebugMode) {
        print('Token: $apptoken');
      }
      destination == APIDESTINATION.indexroute
          ? _dio.options.baseUrl = dotenv.env['INDEX_BASE_URL']!
          : _dio.options.baseUrl = dotenv.env['BASE_URL']!;

      _dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            // Add the access token to the request header
            options.headers['api-key'] = dotenv.env['INDEX_APIKEY'];
            options.headers['Authorization'] = 'Token $apptoken';

            return handler.next(options);
          },
          onError: (DioException e, handler) async {
            if (e.response?.statusCode == 401) {
              // If a 401 response is received, refresh the access token
              //String newAccessToken = await refreshToken();

              // Update the request header with the new access token
              //e.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

              // Repeat the request with the updated header
              //return handler.resolve(await dio.fetch(e.requestOptions));
            }
            return handler.next(e);
          },
        ),
      );

      var response = await _dio.post(
        uri,
        data: queryParameters,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException('Unable to process the data.');
    } catch (e) {
      throw ServerException();
    }
  }

  Future postForImages(
    APIDESTINATION destination,
    String uri, {
    List<Map<String, dynamic>>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final apptoken = await getIt<StorageUtils>().getDataForSingle(
        key: token,
      );

      destination == APIDESTINATION.indexroute
          ? _dio.options.baseUrl = dotenv.env['INDEX_BASE_URL']!
          : _dio.options.baseUrl = dotenv.env['BASE_URL']!;

      _dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            // Add the access token to the request header
            // Add the access token to the request header if available
            if (apptoken.isNotEmpty) {
              options.headers['Authorization'] = 'Token $apptoken';
            }
            options.headers['api-key'] = dotenv.env['INDEX_APIKEY'];

            return handler.next(options);
          },
          onError: (DioException e, handler) async {
            if (e.response?.statusCode == 401) {
              // If a 401 response is received, refresh the access token
              //String newAccessToken = await refreshToken();

              // Update the request header with the new access token
              //e.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

              // Repeat the request with the updated header
              //return handler.resolve(await dio.fetch(e.requestOptions));
            }
            return handler.next(e);
          },
        ),
      );

      var response = await _dio.post(
        uri,
        data: queryParameters,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException('Unable to process the data.');
    } catch (e) {
      throw ServerException();
    }
  }

  Future getPlain(
    APIDESTINATION destination,
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final apptoken = await getIt<StorageUtils>().getDataForSingle(key: token);
      if (kDebugMode) {
        print('Token: $apptoken');
      }

      // Set base URL based on destination
      _dio.options.baseUrl = destination == APIDESTINATION.indexroute
          ? dotenv.env['INDEX_BASE_URL']!
          : dotenv.env['BASE_URL']!;

      // Clear existing interceptors to avoid adding multiple interceptors
      _dio.interceptors.clear();

      _dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            // Add the access token to the request header
            if (apptoken.isNotEmpty) {
              options.headers['Authorization'] = 'Token $apptoken';
            }
            if (destination == APIDESTINATION.indexroute) {
              options.headers['api-key'] = dotenv.env['INDEX_APIKEY'];
            }

            return handler.next(options);
          },
          onError: (DioException e, handler) async {
            if (e.response?.statusCode == 401) {
              // Handle token refresh logic here if needed

              return handler.next(e);
            }
            return handler.next(e);
          },
        ),
      );

      var response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException('Unable to process the data.');
    } catch (e) {
      throw ServerException();
    }
  }

  Future get(
    APIDESTINATION destination,
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final apptoken = await getIt<StorageUtils>().getDataForSingle(
        key: token,
      );
      if (kDebugMode) {
        print('Token: $apptoken');
      }

      destination == APIDESTINATION.indexroute
          ? _dio.options.baseUrl = dotenv.env['INDEX_BASE_URL']!
          : _dio.options.baseUrl = dotenv.env['BASE_URL']!;
      _dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            // Add the access token to the request header
            if (apptoken.isNotEmpty) {
              options.headers['Authorization'] = 'Token $apptoken';
            }
            if (destination == APIDESTINATION.indexroute) {
              options.headers['api-key'] = dotenv.env['INDEX_APIKEY'];
            }

            return handler.next(options);
          },
          onError: (DioException e, handler) async {
            if (e.response?.statusCode == 401) {
              // If a 401 response is received, refresh the access token
              //String newAccessToken = await refreshToken();

              // Update the request header with the new access token
              //e.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

              // Repeat the request with the updated header
              //return handler.resolve(await dio.fetch(e.requestOptions));
            }
            return handler.next(e);
          },
        ),
      );

      var response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        data: queryParameters,
        // options: Options(headers: {'Authorization': appToken}),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException('Unable to process the data.');
    } catch (e) {
      throw ServerException();
    }
  }

  Future getForMaps(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      _dio.options.baseUrl = 'https://maps.googleapis.com/maps/api/';
      _dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            // Add the access token to the request header
            return handler.next(options);
          },
          onError: (DioException e, handler) async {
            if (e.response?.statusCode == 401) {
              // If a 401 response is received, refresh the access token
              //String newAccessToken = await refreshToken();

              // Update the request header with the new access token
              //e.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

              // Repeat the request with the updated header
              //return handler.resolve(await dio.fetch(e.requestOptions));
            }
            return handler.next(e);
          },
        ),
      );

      var response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        data: queryParameters,
        // options: Options(headers: {'Authorization': appToken}),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException('Unable to process the data.');
    } catch (e) {
      throw ServerException();
    }
  }

  Future uploadFile(
    APIDESTINATION destination,
    String uri, {
    required String filepath,
    required String filename,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    destination == APIDESTINATION.indexroute
        ? _dio.options.baseUrl = dotenv.env['INDEX_BASE_URL']!
        : _dio.options.baseUrl = dotenv.env['BASE_URL']!;
    try {
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(filepath, filename: filename),
        // You can add more fields here if needed
      });
      final apptoken = await getIt<StorageUtils>().getDataForSingle(
        key: token,
      );
      var response = await _dio.post(
        uri,
        data: formData,
        options: Options(headers: {'Authorization': apptoken}),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException('Unable to process the data.');
    } catch (e) {
      throw ServerException();
    }
  }
}

enum APIDESTINATION { apiroute, indexroute }
