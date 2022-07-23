import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/user.dart';
import '../org_detail/logic.dart';
import 'state.dart';

class UserTileLogic extends GetxController {
  final UserTileState state = UserTileState();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void deleteUser(int index) {
    var orgDetailLogic = Get.find<OrgDetailLogic>();
    orgDetailLogic.deleteUser(index);
  }

  void openOrg(int index) {
    var orgDetailLogic = Get.find<OrgDetailLogic>();
    orgDetailLogic.openOrg(index);
  }

  void togglePassword(index) {
    var orgDetailLogic = Get.find<OrgDetailLogic>();
    orgDetailLogic.togglePassword(index);
  }

  Widget renderInternalIcon(User user) {
    var internal = user.internal;
    IconData iconData;
    if (internal != null) {
      if (internal) {
        iconData = Icons.manage_accounts;
      } else {
        iconData = Icons.manage_accounts_outlined;
      }
    } else {
      iconData = Icons.manage_accounts;
    }
    return Icon(iconData, color: Colors.blue.shade400, size: 16);
  }
}
