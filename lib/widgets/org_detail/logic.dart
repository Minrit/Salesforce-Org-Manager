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
      print(Get.arguments['index']);
      orgListLogic.updateOrgList(org, index: Get.arguments['index']);
    } else {
      print(state.nameController.text);
      print(state.domainController.text);
      print(state.checkboxState);
      var org = Org(state.nameController.text, state.checkboxState,
          domain: state.domainController.text, userList: state.userList);
      orgListLogic.updateOrgList(org);
    }
    Get.back();
  }

  void addUser() {
    Get.toNamed("/user_detail");
  }

  void handleAddUserDone(User user) {
    state.userList.add(user);
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
