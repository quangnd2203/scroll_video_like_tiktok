import 'package:flutter_cache_manager/file.dart';

abstract class IVideoCacheManagerService{
  Future<File> fetchAndCacheVideo(String url);
  Future<List<File>> saveMultipleVideos(List<String> urls);
}
