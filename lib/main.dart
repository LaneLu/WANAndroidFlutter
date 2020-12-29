import 'package:flutter/material.dart';

import 'home/HomePage.dart';
import 'mine/MinePage.dart';
import 'search/HotSearchPage.dart';
import 'tree/TreeTypePage.dart';

void main() {
  runApp(CommonApp());
}

class CommonApp extends StatelessWidget {
  // 注册路由表
  final Map<String, WidgetBuilder> _routes = {
    "/": (context) => MyHomePage(),
    // RoutersNameConfig.browser: (context) => Browser(),
    // RoutersNameConfig.search_result: (context) =>
    //     SearchResultPage(ModalRoute.of(context).settings.arguments.toString()),
    // RoutersNameConfig.chapter: (context) => ChaptersPage(
    //     list: JsonConvert.fromJsonAsT<List<ChaptersEntity>>(
    //         jsonDecode(ModalRoute.of(context).settings.arguments)["list"])),
    // RoutersNameConfig.unknown_page: (context) => UnknownPage(),
    // RoutersNameConfig.login_page: (context) => Login(),
    // RoutersNameConfig.treeListPage: (context) => TreeListPage(
    //       list: JsonConvert.fromJsonAsT<List<TreeTypechild>>(
    //           jsonDecode(ModalRoute.of(context).settings.arguments)["list"]),
    //       index: jsonDecode(ModalRoute.of(context).settings.arguments)["index"],
    //       title: jsonDecode(ModalRoute.of(context).settings.arguments)["title"],
    //     ),
    // RoutersNameConfig.collectListPage: (context) => MineCollectPage(),
    // RoutersNameConfig.projectListPage: (context) => PrejectListPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "玩安卓",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      routes: _routes,
      initialRoute: "/",
    );
  }
}

//首页嵌套路由
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0; //底部导航栏索引
  List<Widget> pages = [
    HomePage(),
    HotSearchPage(),
    TreeTypePage(),
    MinePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      //底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "首页",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "热搜",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.extension),
            label: "体系",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "我的",
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
