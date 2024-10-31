import 'package:flutter_cache_manager/file.dart';

import '../../domain/entity/travel_video.dart';

abstract class IVideoUseCase {
  Future<TravelVideoPage> getTravelVideos({
    int pageSize = 10,
    String postType = 'film',
    String type = 'post',
    String? cursor,
  });

  Future<List<File>> downloadVideos(List<Items> items);

  Future<File> fetchVideo(Items item);
}
