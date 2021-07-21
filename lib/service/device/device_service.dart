/*
 * 项目名:    feng_go_app
 * 包名
 * 文件名:    router_history_service
 * 创建时间:  2020/9/10 on 11:30 AM
 * 描述:
 *
 * @author   YHF
 */

import 'dart:collection';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:package_info/package_info.dart';

class DeviceInfoService {
  String get osType => Platform.isAndroid ? 'Android' : 'iOS';

  String get deviceId =>
      Platform.isAndroid ? _getAndroidDeviceId() : _getIosDeviceId();

  late AndroidDeviceInfo _androidDeviceInfo;
  late IosDeviceInfo _iosDeviceInfo;
  late PackageInfo _packageInfo;

  String get version => _packageInfo.version;

  String get buildNumber => _packageInfo.buildNumber;

  void initDevice() async {
    _packageInfo = await PackageInfo.fromPlatform();
    if (Platform.isAndroid)
      _androidDeviceInfo = await DeviceInfoPlugin().androidInfo;
    if (Platform.isIOS) _iosDeviceInfo = await DeviceInfoPlugin().iosInfo;
  }

  _getAndroidDeviceId() {
    return '${_androidDeviceInfo.androidId}';
  }

  _getIosDeviceId() {
    return _iosDeviceInfo.identifierForVendor;
  }
}
