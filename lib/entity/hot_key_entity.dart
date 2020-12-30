import 'package:flutter_wanandroid/api/base/json_convert_content.dart';

class HotKeyEntity with JsonConvert<HotKeyEntity> {
  int id;
  String link;
  String name;
  int order;
  int visible;
}
