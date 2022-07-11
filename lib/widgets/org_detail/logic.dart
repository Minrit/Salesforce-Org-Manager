import 'package:get/get.dart';

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
    }
    update();
  }

  void onCheckboxChange(v) {
    print('change');
    print(v);
    state.checkboxState = v;
    update();
  }

  String? checkboxValidator(v) {
    print('validate');
    print(v);
    return '';
  }

  void deleteUser(int index) {
    state.userList.removeAt(index);
    update();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    if (Get.arguments['editMode']) {
      var org = Get.arguments['org'] as Org;
      state.nameController.text = org.name;
      state.domainController.text = org.domain ?? '';
      state.checkboxState = org.isProduction;
      state.userList = org.userList ?? [];
      state.org = org;
      update();
    }
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
