import 'package:get/get.dart';
import 'package:sf_org_manager/models/org.dart';

import '../../models/user.dart';
import 'state.dart';

class OrgListLogic extends GetxController {
  final OrgListState state = OrgListState();

  @override
  void onReady() {
    // TODO: implement onReady
    var user = User('minrit3@minrit3.com', 'Dsm612566');
    var org = Org('minrit3', true,
        domain: 'https://minrit3-dev-ed.lightning.force.com/',
        userList: [user],
        comment: 'first test');
    var org1 = Org('minrit3', false,
        domain: 'https://minrit3-dev-ed.lightning.force.com/',
        userList: [user],
        comment: 'first test');
    state.orgList = [org, org1];
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
