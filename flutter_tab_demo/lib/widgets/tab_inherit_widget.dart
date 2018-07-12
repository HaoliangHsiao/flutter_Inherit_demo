import 'package:flutter/material.dart';

class ServiceProvider {
  final Map<String, dynamic> store = {};

  dynamic getService(String name) => store[name];
  void setService(String name, dynamic service) => store[name] = service;
}

// 負責儲存資料
class TabInheritWidget extends InheritedWidget {
  static const String stream_logic = "stream_logic";
  final ServiceProvider provider = ServiceProvider();

  TabInheritWidget({
    Key key,
    Widget child,
  }) : super(
          key: key,
          child: child,
        );

  static ServiceProvider ofService(BuildContext context) {
    TabInheritWidget widget =
        context.inheritFromWidgetOfExactType(TabInheritWidget);
    return widget.provider;
  }

  static TabInheritWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(TabInheritWidget);
  }

  dispose() {
    provider.store.forEach((name, data) {
      if (data is LogicBase) {
        data.dispose();
      }
    });
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}

abstract class LogicBase {
  dispose();
}
