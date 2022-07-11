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
    if (Get.arguments['editMode']) {
      var user = Get.arguments['user'] as User;
      state.usernameController.text = user.username;
      state.passwordController.text = user.password;
      update();
    }
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
      if (Get.arguments['editMode']) {
        var user =
            User(state.usernameController.text, state.passwordController.text);
        orgDetailLogic.handleUserDone(user, index: Get.arguments['index']);
      } else {
        var user =
            User(state.usernameController.text, state.passwordController.text);
        orgDetailLogic.handleUserDone(user);
      }
      Get.back();
    }
  }

  String? usernameValidator(v) {
    return FormUtils.isFieldEmpty(v, 'Please enter a username');
  }

  String? passwordValidator(v) {
    return FormUtils.isFieldEmpty(v, 'Please enter a password');
  }
}
