/*
 * 项目名:    gma_law_flutter2
 * 包名
 * 文件名:    request_bean
 * 创建时间:  2020-01-06 on 14:01
 * 描述:
 *
 * @author   YHF
 */

class RequestBean {
  final String requestUrl;
  final Map<String, dynamic> requestParams;
  final String requestJson;
  RequestType requestType;

  /// if [isCacheLocal] is true ，I cache the data requested by the network locally
  final bool isCacheLocal;
  final String cacheTag;

  RequestBean(
    this.requestUrl,
    this.requestParams, {
    this.cacheTag = '',
    this.requestJson,
    this.isCacheLocal = false,
    this.requestType = RequestType.POST,
  });
}

enum RequestType {
  GET,
  POST,
  POST_JSON,
  DEL,
  PUT,
}
