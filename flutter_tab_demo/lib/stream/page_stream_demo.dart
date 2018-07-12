import 'package:flutter/material.dart';
import 'package:flutter_tab_demo/stream/page_stream_item_list.dart';
import 'package:flutter_tab_demo/stream/page_stream_show_color.dart';
import 'package:flutter_tab_demo/stream/page_stream_show_text.dart';

class PageStreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: PageStreamShowText(),
        ),
        Expanded(
          child: PageStreamShowColor(),
        ),
        Container(
          height: 220.0,
          child: PageStreamItemList(),
        )
      ],
    );
  }
}
