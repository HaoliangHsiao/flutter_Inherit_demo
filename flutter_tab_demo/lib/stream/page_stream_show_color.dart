import 'package:flutter/material.dart';
import 'package:flutter_tab_demo/stream/page_stream_logic.dart';
import 'package:flutter_tab_demo/widgets/tab_inherit_widget.dart';

class PageStreamShowColor extends StatelessWidget {
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
            width: double.infinity,
            height: 60.0,
            margin: EdgeInsets.all(6.0),
            decoration: BoxDecoration(color: item.color),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
