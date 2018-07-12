import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tab_demo/widgets/tab_inherit_widget.dart';
import 'package:rxdart/subjects.dart';

class StreamLogic implements LogicBase {
  // 資料
  int _selectIndex = -1;
  List<ColorItem> items = [
    ColorItem(
      color: Colors.red,
      text: "紅色",
      selected: false,
    ),
    ColorItem(
      color: Colors.blue,
      text: "藍色",
      selected: false,
    ),
    ColorItem(
      color: Colors.yellow,
      text: "黃色",
      selected: false,
    ),
    ColorItem(
      color: Colors.purple,
      text: "紫色",
      selected: false,
    ),
    ColorItem(
      color: Colors.pink,
      text: "粉色",
      selected: false,
    ),
  ];

  // Items 資料
  Stream<List<ColorItem>> get getItems => _itemsBehavior.stream;

  final _itemsBehavior = new BehaviorSubject<List<ColorItem>>();

  // 主畫面展現
  Stream<ColorItem> get getShowItem => _showItemBehavior.stream;

  final _showItemBehavior = new BehaviorSubject<ColorItem>();

  // 發送 指令送到這邊

  StreamLogic() {}

  void sendSelectIndex(int selectIndex) {
    _commandHandler(selectIndex);
  }

  void _commandHandler(int selectedIndex) {
    if (_selectIndex == selectedIndex) {
      return;
    }

    _selectIndex = selectedIndex;

    items.forEach((item) {
      item.selected = false;
    });

    items[_selectIndex].selected = true;

    _itemsBehavior.add(items);
    _showItemBehavior.add(items[_selectIndex]);
  }

  // 初始區
  List<ColorItem> getItemInitData() {
    return items;
  }

  ColorItem getSelectItem() {
    if (_selectIndex >= 0) {
      return items[_selectIndex];
    } else {
      return null;
    }
  }

  @override
  dispose() {
    _itemsBehavior.close();
    _showItemBehavior.close();
  }
}

class ColorItem {
  Color color;
  String text;
  bool selected;

  ColorItem({
    this.color,
    this.text,
    this.selected,
  });

  @override
  String toString() {
    return "$text : selected = $selected";
  }
}
