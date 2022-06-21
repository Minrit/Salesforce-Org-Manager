import 'package:get/get.dart';

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

  void deleteOrg(int index){
    final orgListLogic = Get.find<OrgListLogic>();
    orgListLogic.deleteOrg(index);
  }
}
