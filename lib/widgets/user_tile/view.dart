import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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

  UserTileComponent(this.user, this.index, this.showPassword, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserTileLogic>(builder: (logic) {
      return SizedBox(
          width: 100.w > 600 ? 46.w : 100.w,
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
                          TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(0.0),
                                // primary: Colors.white,
                                // textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                Clipboard.setData(
                                    ClipboardData(text: user.username));
                                EasyLoading.showSuccess('Copied!');
                              },
                              child: Text(user.username)),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          GestureDetector(
                              onTap: () {
                                logic.togglePassword(index);
                              },
                              child: Icon(
                                  showPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  size: 14,
                                  color: Colors.black54)),
                          SizedBox(width: 5),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(0.0),
                              // primary: Colors.white,
                              // textStyle: const TextStyle(fontSize: 20),
                            ),
                            onPressed: () {
                              Clipboard.setData(
                                  ClipboardData(text: user.password));
                              EasyLoading.showSuccess('Copied!');
                            },
                            child: Text(showPassword
                                ? user.password
                                : user.password.runes
                                    .map((rune) => "*")
                                    .toList()
                                    .join()),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                            child: const Text('OPEN',
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
