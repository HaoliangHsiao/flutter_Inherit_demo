import 'package:flutter/material.dart';
import 'package:flutter_tab_demo/stream/page_stream_logic.dart';
import 'package:flutter_tab_demo/widgets/tab_inherit_widget.dart';

class PageStreamItemList extends StatelessWidget {
  PageStreamItemList() {}

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
      initialData: logic.getItemInitData(),
      stream: logic.getItems,
      builder: (context, snapshot) {
//        print("state : ${snapshot.connectionState}");
        if (snapshot.hasData) {
          List<ColorItem> list = snapshot.data;
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(
                  list[index].selected
                      ? Icons.check_box
                      : Icons.check_box_outline_blank,
                ),
                title: Text(list[index].text),
                onTap: () {
                  logic.sendSelectIndex(index);
                },
              );
            },
            itemCount: list.length,
          );
        } else {
          return Center(
            child: Text("沒有選擇列表"),
          );
        }
      },
    );
  }
}
