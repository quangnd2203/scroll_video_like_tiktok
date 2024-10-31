import 'package:flutter/foundation.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import '../../interface/service/video_cache_manager.dart';

class VideoCacheManagerService implements IVideoCacheManagerService {
  final CacheManager _cacheManager = CacheManager(Config(
    'video_cache',
    stalePeriod: const Duration(days: 7),
    maxNrOfCacheObjects: 50,
  ));

  @override
  Future<File> fetchAndCacheVideo(String url) async {
    final File file = await _cacheManager.getSingleFile(url);
    return file;
  }
  
  @override
  Future<List<File>> saveMultipleVideos(List<String> urls) async {
    final List<File> files = await compute(_saveMultipleVideos, urls);
    return files;
  }

  Future<List<File>> _saveMultipleVideos(List<String> urls) async {
    final List<File> files = <File>[];
    for (final String url in urls) {
      final File file = await _cacheManager.getSingleFile(url);
      files.add(file);
    }
    return files;
  }

}
