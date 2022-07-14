import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/org.dart';
import '../org_list/logic.dart';
import 'state.dart';

class OrgListTileLogic extends GetxController {
  final OrgListTileState state = OrgListTileState();

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

  Widget renderPrimaryUser(Org org) {
    var userList = org.userList;
    if (userList != null) {
      if (userList.isNotEmpty) {
        return Text(userList[0].username);
      }
      return Text('');
    }
    return Text('');
  }

  void deleteOrg(int index) {
    final orgListLogic = Get.find<OrgListLogic>();
    orgListLogic.deleteOrg(index);
  }

  void openOrg(Org org) {
    var domain = org.domain;
    domain ??= 'https://${org.isProduction ? 'login' : 'test'}.salesforce.com';
    // Salesforce org domain example are shown as below:
    // https://login.salesforce.com/?un=daniel@example.com&pw=hunter12
    var url = Uri.parse(
        '$domain/?un=${org.userList![0].username}&pw=${org.userList![0].password}');
    Clipboard.setData(ClipboardData(text: org.userList![0].password));
    launchUrl(url);
  }

  double setHeight(context) {
    return MediaQuery.of(context).size.height * 0.2;
  }
}
