import 'package:flutter/material.dart';

//热搜
class HotSearchPage extends StatefulWidget {
  @override
  _HotSearchPageState createState() => _HotSearchPageState();
}

class _HotSearchPageState extends State<HotSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("热搜"),
      ),
    );
  }
}
