import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomNavigatorObserver extends NavigatorObserver {
  static CustomNavigatorObserver _instance;

  NavigatorState get navigator => _navigator;
  NavigatorState _navigator;

  static CustomNavigatorObserver getInstance() {
    if (_instance == null) {
      _instance = CustomNavigatorObserver();
    }
    return _instance;
  }

  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);
    if (_navigator == null) if (route is CupertinoPageRoute ||
        previousRoute is MaterialPageRoute) {
      _navigator = route.navigator;
    }
  }

  @override
  void didReplace({Route newRoute, Route oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute is CupertinoPageRoute || newRoute is MaterialPageRoute) {
      if (oldRoute.settings.name == '/') _navigator = newRoute.navigator;
    }
  }

  void push(Widget widget, {String routerName}) {
    _navigator.push(new MaterialPageRoute(
        builder: (_) {
          return widget;
        },
        settings: RouteSettings(name: routerName)));
  }
}
