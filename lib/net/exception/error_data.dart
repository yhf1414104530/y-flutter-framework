/*
 * 项目名:    cacart_flutter
 * 包名
 * 文件名:    error_data
 * 创建时间:  2019/2/28 on 5:33 PM
 * 描述:
 *
 * @author   YHF
 */

class ErrorData {
  int? errCode;

  ErrorData({this.errCode, this.errMsg});

  String? errMsg;

  String toString(){return 'errCode=$errCode; errMsg=$errMsg';}
}
