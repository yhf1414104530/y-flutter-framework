
import 'package:flutter/material.dart';

class RouterUtil with RouterFunction {
  // 工厂模式
  factory RouterUtil() => _getInstance();

  static RouterUtil get instance => _getInstance();
  static RouterUtil _instance;

  RouterUtil._internal() {
    // 初始化
  }

  static RouterUtil _getInstance() {
    if (_instance == null) {
      _instance = new RouterUtil._internal();
    }
    return _instance;
  }

  //静态路由
  Map<String, WidgetBuilder> getRouter() {
    return {
      //路由指定页面
      //aPage: (BuildContext context) => new MyApp(),
    };
  }
}



mixin RouterFunction {
  //跳转页面 name:页面名称
  void pushName(BuildContext buildContext, String name, {arguments}) {
    Navigator.of(buildContext).pushNamed(name, arguments: arguments);
  }

  //动态路由  传入widget组件
  void push(BuildContext buildContext, Widget widget, {routerName}) {
    Navigator.of(buildContext).push(new MaterialPageRoute(
        builder: (_) {
          return widget;
        },
        settings:
            RouteSettings(name: routerName ?? widget.runtimeType.toString())));
  }

  void pushNamedAndRemoveUntil(
      BuildContext buildContext, String routersName, untilRoutersName,
      {arguments}) {
    Navigator.of(buildContext).pushNamedAndRemoveUntil(
        routersName, ModalRoute.withName(untilRoutersName),
        arguments: arguments);
  }

  void pushAndRemoveUntil(
      BuildContext buildContext, Widget nextWidget, untilRoutersName,
      {arguments, routerName, isBackEnd}) {
    Navigator.of(buildContext).pushAndRemoveUntil(
        new MaterialPageRoute(
            builder: (context) => nextWidget,
            settings: RouteSettings(name: routerName ?? nextWidget.toString())),
        (route) => isBackEnd ?? route.settings.name == untilRoutersName);
  }

  void popAndRemoveUntil(BuildContext buildContext, untilRoutersName,
      {arguments, routerName}) {
    Navigator.of(buildContext)
        .popUntil((route) => route.settings.name == untilRoutersName);
  }

  void pushReplacement(BuildContext buildContext, Widget widget, {routerName}) {
    Navigator.of(buildContext).pushReplacement(new MaterialPageRoute(
        builder: (_) {
          return widget;
        },
        settings:
            RouteSettings(name: routerName ?? widget.runtimeType.toString())));
  }

  void pushAndReceive(BuildContext context, Widget widget, Function receive,
      {routerName}) {
    Navigator.push(
      context,
      new MaterialPageRoute(
          builder: (BuildContext context) {
            return widget;
          },
          settings: RouteSettings(name: routerName)),
    ).then(receive);
  }

  void pushWithData(BuildContext buildContext, Widget widget) {
    Navigator.push(buildContext,
        new MaterialPageRoute(builder: (BuildContext context) {
      return widget;
    })).then((Object result) {
      //跳转页面返回数据接收
    });
  }

  void pop(BuildContext buildContext) {
    Navigator.of(buildContext).pop();
  }

  void popWithData(BuildContext buildContext, data) {
    Navigator.of(buildContext).pop(data);
  }
}
