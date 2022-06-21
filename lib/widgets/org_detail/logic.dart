import 'package:get/get.dart';

import '../../models/org.dart';
import '../org_list/logic.dart';
import 'state.dart';

class OrgDetailLogic extends GetxController {
  final OrgDetailState state = OrgDetailState();

  void create() {
    print('login');
    print(state.nameController.text);
    print(state.domainController.text);
    print(state.checkboxState);
    var org = Org(state.nameController.text, state.checkboxState,
        domain: state.domainController.text);
    final orgListLogic = Get.find<OrgListLogic>();
    orgListLogic.addOrg(org);
    Get.back();
  }

  void addUser() {
    Get.toNamed("/user_detail");
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
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
