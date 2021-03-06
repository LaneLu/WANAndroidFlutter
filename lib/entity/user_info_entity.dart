import 'package:flutter_wanandroid/api/base/json_convert_content.dart';

class UserInfoEntity with JsonConvert<UserInfoEntity> {
  bool admin;
  List<dynamic> chapterTops;
  List<int> collectIds;
  String email;
  String icon;
  int id;
  String nickname;
  String password;
  String publicName;
  String token;
  int type;
  String username;
  int coinCount;
  String rank;
  int userId;
  int level;
}
