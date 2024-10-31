import 'package:file/src/interface/file.dart';
import 'package:get/get.dart';

import '../../interface/service/video_cache_manager.dart';
import '../../interface/usecase/video.dart';
import '../entity/travel_video.dart';

class VideoUseCase implements IVideoUseCase{

  final IVideoCacheManagerService _videoCacheManagerService = Get.find<IVideoCacheManagerService>();

  @override
  Future<List<File>> downloadVideos(List<Items> items) {
    final List<String> links = items.map((Items e) => e.medias!.first.link!).toList();
  }

  @override
  Future<File> fetchVideo(Items item) {
    // TODO: implement fetchVideo
    throw UnimplementedError();
  }

  @override
  Future<TravelVideoPage> getTravelVideos({int pageSize = 10, String postType = 'film', String type = 'post', String? cursor}) {
    // TODO: implement getTravelVideos
    throw UnimplementedError();
  }

}
