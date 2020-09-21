/*
 * 项目名:    gma_law_flutter2
 * 包名
 * 文件名:    custom_cache_manager
 * 创建时间:  2020-01-07 on 16:21
 * 描述:
 *
 * @author   YHF
 */

import 'package:path_provider/path_provider.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path/path.dart' as p;

class CustomCacheManager extends BaseCacheManager {
  static const key = "xy_cache";

  static CustomCacheManager _instance;

  factory CustomCacheManager() {
    if (_instance == null) {
      _instance = new CustomCacheManager._();
    }
    return _instance;
  }

  CustomCacheManager._()
      : super(
          key,
          maxAgeCacheObject: Duration(days: 7),
          maxNrOfCacheObjects: 20,
        );

  Future<String> getFilePath() async {
    var directory = await getTemporaryDirectory();
    return p.join(directory.path, key);
  }
}
