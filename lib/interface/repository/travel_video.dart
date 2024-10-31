import '../../domain/entity/travel_video.dart';
import '../../infrastructure/model/network_state.dart';

abstract class ITravelVideoRepository {
  Future<NetworkState<TravelVideoPage>> getTravelVideos(
      {int pageSize = 10,
      String postType = 'film',
      String type = 'post',
      String? cursor});
}
