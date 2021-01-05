import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/config/ApiUrl.dart';
import 'package:flutter_wanandroid/diohttp/dio_manager.dart';
import 'package:flutter_wanandroid/diohttp/nw_method.dart';
import 'package:flutter_wanandroid/entity/hot_key_entity.dart';
import 'package:flutter_wanandroid/utils/FluttertoastUtils.dart';

//热搜
class HotSearchPage extends StatefulWidget {
  @override
  _HotSearchPageState createState() => _HotSearchPageState();
}

class _HotSearchPageState extends State<HotSearchPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHotKey();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        body: Column(),
      ),
    );
  }

  // 获取搜索热词
  void getHotKey() {
    DioManager().requestList<HotKeyEntity>(
        NWMethod.GET, ApiUrl.init().hotKeyList,
        params: {}, success: (data) {
      setState(() {

      });
    }, error: (error) {
      FluttertoastUtils.showToast(error.errorMsg);
    });
  }
}
