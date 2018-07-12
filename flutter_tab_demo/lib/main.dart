import 'package:flutter/material.dart';
import 'package:flutter_tab_demo/data/page_wait.dart';
import 'package:flutter_tab_demo/stream/page_stream_demo.dart';
import 'package:flutter_tab_demo/widgets/tab_inherit_widget.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabInheritWidget(
        child: new MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _tabController = TabController(
      initialIndex: _currentIndex,
      length: 3,
      vsync: this,
    );
    _tabController.addListener(_tabChanged);
  }

  // 換Tab
  _tabChanged() {
    if (_currentIndex != _tabController.index) {
      _currentIndex = _tabController.index;
      _pageController.jumpToPage(_currentIndex);
    }
  }

  @override
  void dispose() {
    TabInheritWidget.of(context)?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Demo"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: "Stream"),
            Tab(text: "Test2"),
            Tab(text: "Test3"),
          ],
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          if (index == 0) {
            return PageStreamDemo();
          } else {
            return PageWaitDemo();
          }
        },
      ),
    );
  }
}
