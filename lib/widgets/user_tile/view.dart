import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/user.dart';
import 'logic.dart';

class UserTileComponent extends StatelessWidget {
  final logic = Get.put(UserTileLogic());
  final state = Get.find<UserTileLogic>().state;

  late User user;
  late int index;

  UserTileComponent(this.user, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(children: <Widget>[
      Expanded(child: Text(user.username)),
      Expanded(child: Text(user.password)),
    ]));
  }
}
