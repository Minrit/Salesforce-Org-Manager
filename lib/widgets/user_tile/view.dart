import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../models/user.dart';
import 'logic.dart';

class UserTileComponent extends StatelessWidget {
  final logic = Get.put(UserTileLogic());
  final state = Get.find<UserTileLogic>().state;

  late User user;
  late int index;
  late bool showPassword;

  UserTileComponent(this.user, this.index, this.showPassword, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserTileLogic>(builder: (logic) {
      return SizedBox(
          height: 106,
          width: 100.w > 400 ? 47.5.w : 100.w,
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                              onTap: () {
                                Clipboard.setData(
                                    ClipboardData(text: user.username));
                              },
                              child: Icon(Icons.copy, size: 14)),
                          SizedBox(width: 5),
                          Text(user.username),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          GestureDetector(
                              onTap: () {
                                Clipboard.setData(
                                    ClipboardData(text: user.password));
                              },
                              child: Icon(Icons.copy, size: 14)),
                          SizedBox(width: 5),
                          Text(showPassword
                              ? user.password
                              : user.password.runes
                                  .map((rune) => "*")
                                  .toList()
                                  .join()),
                          SizedBox(width: 5),
                          GestureDetector(
                              onTap: () {
                                logic.togglePassword(index);
                              },
                              child: Icon(
                                  showPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  size: 14)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                            child: const Text('Open',
                                style: TextStyle(color: Colors.blue)),
                            onPressed: () {
                              logic.openOrg(index);
                            },
                          ),
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
    });
  }
}
