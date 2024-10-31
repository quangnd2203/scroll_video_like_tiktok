import 'package:dio/dio.dart';

import '../../core/constants/app_endpoint.dart';
import '../../domain/entity/travel_video.dart';
import '../../interface/client/client.dart';
import '../../interface/repository/travel_video.dart';
import '../model/network_state.dart';
import 'package:get/get.dart' as getx;

class TravelVideoRepository implements ITravelVideoRepository {
  final IClient _client = getx.Get.find<IClient>();

  @override
  Future<NetworkState<TravelVideoPage>> getTravelVideos(
      {int pageSize = 10,
      String postType = 'film',
      String type = 'post',
      String? cursor}) async {
    try {
      final Response<dynamic> res = await _client.get(
        AppEndpoint.TRAVEL_VIDEO,
        queryParameters: <String, dynamic>{
          'pageSize': pageSize,
          'postType': postType,
          'type': type,
          'cursor': cursor,
        },
      );

      return NetworkState<TravelVideoPage>(
        data: TravelVideoPage.fromJson(res.data['data']),
        status: res.statusCode,
      );
    } on DioException catch (e) {
      return NetworkState<TravelVideoPage>.withError(e);
    }
  }
}
