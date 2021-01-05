import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/utils/custom_colors.dart';

import 'api/base/json_convert_content.dart';
import 'brower.dart';
import 'config/routes_name_config.dart';
import 'entity/tree_type_entity.dart';
import 'home/home_page.dart';
import 'login/login.dart';
import 'mine/mine_page.dart';
import 'search/hot_search_page.dart';
import 'tree/tree_type_page.dart';

void main() => runApp(CommonApp());

class CommonApp extends StatelessWidget {
  // 注册路由表
  final Map<String, WidgetBuilder> _routes = {
    "/": (context) => MyHomePage(),
    RoutersNameConfig.browser: (context) => Browser(),
    // RoutersNameConfig.search_result: (context) =>
    //     SearchResultPage(ModalRoute.of(context).settings.arguments.toString()),
    // RoutersNameConfig.chapter: (context) => ChaptersPage(
    //     list: JsonConvert.fromJsonAsT<List<ChaptersEntity>>(
    //         jsonDecode(ModalRoute.of(context).settings.arguments)["list"])),
    // RoutersNameConfig.unknown_page: (context) => UnknownPage(),
    RoutersNameConfig.login_page: (context) => Login(),
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
        primaryColor: CustomColors.colorPrimary,
        primaryColorDark: CustomColors.colorPrimaryDark,
        accentColor: CustomColors.colorAccent,
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
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white, //背景颜色
          primaryColor: CustomColors.wanColor, //设置高亮文字颜色
          // //设置一般文字颜色
          // textTheme: Theme.of(context)
          //     .textTheme
          //     .copyWith(caption: new TextStyle(color: Colors.yellow))
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTabTapped,
          items: [
            BottomNavigationBarItem(
              // backgroundColor: Colors.red,
              icon: Icon(Icons.home),
              label: "首页",
            ),
            BottomNavigationBarItem(
              // backgroundColor: Colors.blue,
              icon: Icon(Icons.navigation),
              label: "导航",
            ),
            BottomNavigationBarItem(
              // backgroundColor: Colors.green,
              icon: Icon(Icons.extension),
              label: "体系",
            ),
            BottomNavigationBarItem(
              // backgroundColor: Colors.orange,
              icon: Icon(
                Icons.person,
              ),
              label: "我的",
            ),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
