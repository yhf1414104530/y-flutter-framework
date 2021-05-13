/*
 * 项目名:    y_framework
 * 包名       provider
 * 文件名:    y_dio
 * 创建时间:  2020/9/18 on 4:31 PM
 * 描述:
 *
 * @author   YHF
 */

abstract class YDio {
  Future requestGet(String apiAddress, {Map<String, dynamic> requestParams});

  Future requestPost(String apiAddress, {Map<String, dynamic> requestParams});

  @deprecated
  Future requestPostJson(String apiAddress, {String json});

  @deprecated
  Future requestPostJsonV2(String apiAddress, {dynamic jsonObject});

  Future requestDel(String apiAddress, {Map<String, dynamic> requestParams});
}
