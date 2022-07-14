import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/org.dart';
import '../../models/user.dart';
import '../org_list/logic.dart';
import 'state.dart';

class OrgDetailLogic extends GetxController {
  final OrgDetailState state = OrgDetailState();

  void handleDone() {
    final orgListLogic = Get.find<OrgListLogic>();
    if (Get.arguments['editMode']) {
      var org = Org(state.nameController.text, state.checkboxState,
          domain: state.domainController.text, userList: state.userList);
      orgListLogic.updateOrgList(org, index: Get.arguments['index']);
    } else {
      var org = Org(state.nameController.text, state.checkboxState,
          domain: state.domainController.text, userList: state.userList);
      orgListLogic.updateOrgList(org);
    }
  }

  void addUser() {
    Get.toNamed("/user_detail", arguments: {'editMode': false});
  }

  void handleUserDone(User user, {int index = -1}) {
    if (index != -1) {
      state.userList[index] = user;
    } else {
      state.userList.add(user);
      state.showUserPasswordList.add(false);
    }
    update();
  }

  void onCheckboxChange(v) {
    state.checkboxState = v;
    update();
  }

  String? checkboxValidator(v) {
    return '';
  }

  void deleteUser(int index) {
    print('delete user');
    state.userList.removeAt(index);
    state.showUserPasswordList.removeAt(index);
    update();
  }

  void openOrg(int index){
    var domain = state.domainController.text;
    // Salesforce org domain example are shown as below:
    // https://login.salesforce.com/?un=daniel@example.com&pw=hunter12
    var url = Uri.parse(
        '$domain/?un=${state.userList[index].username}&pw=${state.userList[index].password}');
    Clipboard.setData(ClipboardData(text: state.userList[index].password));
    launchUrl(url);
  }

  void togglePassword(int index){
    state.showUserPasswordList[index] = !state.showUserPasswordList[index];
    update();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    state.domainController.text = 'https://test.salesforce.com';
    if (Get.arguments['editMode']) {
      var org = Get.arguments['org'] as Org;
      state.nameController.text = org.name;
      state.domainController.text = org.domain ?? '';
      state.checkboxState = org.isProduction;
      state.userList = List.from(org.userList ?? []);
      print(org.userList?.length);
      state.org = org;
    }
    for(var i = 0; i < state.userList.length; i++){
      state.showUserPasswordList.add(false);
    }
    update();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
