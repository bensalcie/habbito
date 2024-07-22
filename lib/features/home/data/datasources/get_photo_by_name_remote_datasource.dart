import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/dio_config.dart';

abstract class GetPhotoByNameRemoteDataSource {
  /// Call api to Get Home Views
  ///
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<String>> getPhotos({required List<String?> photonames});
}

@LazySingleton(as: GetPhotoByNameRemoteDataSource)
class GetPhotoByNameRemoteDataSourceImpl
    implements GetPhotoByNameRemoteDataSource {
  final DioClient _client;

  GetPhotoByNameRemoteDataSourceImpl(this._client);

  @override
  Future<List<String>> getPhotos({required List<String?> photonames}) async {
    try {



List<String> photourls =[];
      for(final photoname in photonames){

            final response = await _client.get('/v1/search',
          queryParameters: {'query': photoname, 'page': 1, 'per_page': 1});
      if (kDebugMode) {
        print('Get Photo response: $response');
      }

      var photourl = //Placeholder
          'https://img.freepik.com/free-vector/kids-learning-playing-illustration_53876-40285.jpg?size=626&ext=jpg&ga=GA1.1.2008272138.1721174400&semt=sph';

      final photosresponse = response['photos'];

      if (photosresponse != null) {
        final photosreslist = photosresponse as List;
        if(photosreslist.isNotEmpty){
           final photos = photosresponse[0];

        final src = photos['src'];
        if (src != null) {
          photourl = src['large'];
        }
        }
       
      }

      photourls.add(photourl);
      }
  

      return photourls;
    } catch (e) {
      if (kDebugMode) {
        print('Get Photo response: $e');
      }
      rethrow;
    }
  }
}
