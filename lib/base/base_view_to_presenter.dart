/*
 * 项目名:    cacart_flutter
 * 包名
 * 文件名:    base_loading
 * 创建时间:  2019-10-30 on 15:00
 * 描述:
 *
 * @author   YHF
 */


mixin ViewToBloc {
  void showLoadingDialog({String msg});

  void dismissDialog();

  void toast(String s);

  bool isShowLoading();

  void sendEventToView(ViewEvent event);
}

abstract class ViewEvent {}
