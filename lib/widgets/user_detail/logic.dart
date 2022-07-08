import 'package:get/get.dart';
import 'package:sf_org_manager/models/user.dart';

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
    print('user done');
    print(state.usernameController.text);
    print(state.passwordController.text);
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
    // orgDetailLogic.handleAddUserDone(
    //     User(state.usernameController.text, state.passwordController.text));
    Get.back();
  }
}
