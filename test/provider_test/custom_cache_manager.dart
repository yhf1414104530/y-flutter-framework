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

class CustomCacheManager extends CacheManager {
  static const key = 'xy_cache';

  static final CustomCacheManager _instance = CustomCacheManager._();

  factory CustomCacheManager() {
    return _instance;
  }

  CustomCacheManager._()
      : super(Config(
          key,
          stalePeriod: Duration(days: 7),
          maxNrOfCacheObjects: 20,
        ));
}
