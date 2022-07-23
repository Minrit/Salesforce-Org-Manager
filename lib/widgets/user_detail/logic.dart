import 'package:get/get.dart';
import 'package:sf_org_manager/models/user.dart';
import 'package:sf_org_manager/utils/form_utils.dart';

import '../org_detail/logic.dart';
import 'state.dart';

class UserDetailLogic extends GetxController {
  final UserDetailState state = UserDetailState();

  @override
  void onReady() {
    // TODO: implement onReady
    state.personaController.text = 'Admin';
    if (Get.arguments['editMode']) {
      var user = Get.arguments['user'] as User;
      state.usernameController.text = user.username;
      state.passwordController.text = user.password;
      state.personaController.text = user.persona ?? '';
      state.securityTokenController.text = user.securityToken ?? '';
      state.internalState = user.internal ?? true;
    }
    update();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void handleDone() {
    if (state.userFormKey.currentState!.validate()) {
      final orgDetailLogic = Get.find<OrgDetailLogic>();
      var user = User(
          state.usernameController.text, state.passwordController.text,
          persona: state.personaController.text,
          securityToken: state.securityTokenController.text,
          internal: state.internalState);
      if (Get.arguments['editMode']) {
        orgDetailLogic.handleUserDone(user, index: Get.arguments['index']);
      } else {
        orgDetailLogic.handleUserDone(user);
      }
      Get.back();
    }
  }

  void handleInternalChange(bool? v) {
    state.edited = true;
    state.internalState = v ?? false;
    update();
  }

  String? usernameValidator(v) {
    return FormUtils.validateEmail(v);
  }

  String? passwordValidator(v) {
    return FormUtils.isFieldEmpty(v, 'Please enter a username');
  }
}
