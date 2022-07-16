import 'package:get/get.dart';

import '../../utils/file_utils.dart';
import '../org_list/logic.dart';
import 'state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();

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

  void goToDetail() {
    Get.toNamed("/org_detail", arguments: {'editMode': false});
  }

  void export2Json() {
    FileUtils.export2Json();
  }

  void importJson() async {
    var importedOrgList = await FileUtils.importJson();
    if (importedOrgList.isNotEmpty) {
      var orgListLogic = Get.find<OrgListLogic>();
      orgListLogic.handleImport(importedOrgList);
    }
  }
}
