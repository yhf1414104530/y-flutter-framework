/*
 * 项目名:    y_framework
 * 包名       provider_test
 * 文件名:    provider_test
 * 创建时间:  2020/9/18 on 5:19 PM
 * 描述:
 *
 * @author   YHF
 */

import 'package:y_framework/net/request_bean.dart';
import 'package:y_framework/provider/y_base_provider_builder.dart';

import 'base_provider.dart';

void main() async {
  TestProvider().load();
  await Future.delayed(Duration(minutes: 1));
}

class Test {}

class TestProvider extends BaseProvider<Test> {
  @override
  // TODO: implement requestBean
  RequestBean get requestBean =>
      RequestBean('mall/ad/homePage', {}, requestType: RequestType.GET);


}
