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
    return SizedBox(
        height: 95,
        width: 300,
        child: GestureDetector(
          onTap: () {
            Get.toNamed('user_detail',
                arguments: {'user': user, 'editMode': true, 'index': index});
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(user.username),
                    Text(user.password),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          child: const Text('DELETE',
                              style: TextStyle(color: Colors.red)),
                          onPressed: () {
                            logic.deleteUser(index);
                          },
                        ),
                        // const SizedBox(width: 8),
                      ],
                    ),
                  ]),
            ),
          ),
        ));
  }
}
