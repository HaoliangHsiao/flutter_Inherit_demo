import 'package:flutter/material.dart';
import 'package:flutter_tab_demo/stream/page_stream_logic.dart';
import 'package:flutter_tab_demo/widgets/tab_inherit_widget.dart';

class PageStreamShowText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StreamLogic logic = TabInheritWidget
        .ofService(context)
        .getService(TabInheritWidget.stream_logic);

    if (logic == null) {
      logic = StreamLogic();
      TabInheritWidget
          .ofService(context)
          .setService(TabInheritWidget.stream_logic, logic);
    }

    return StreamBuilder(
      initialData: logic.getSelectItem(),
      stream: logic.getShowItem,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          ColorItem item = snapshot.data;
          return Container(
            alignment: Alignment.bottomCenter,
            child: Text("你所選的顏色為 ${item.text}"),
          );
        } else {
          return Container(
            alignment: Alignment.bottomCenter,
            child: Text("請選擇顏色"),
          );
        }
      },
    );
  }
}
