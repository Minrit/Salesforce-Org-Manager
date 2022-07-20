import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sf_org_manager/common/get_storage_key.dart';
import 'package:sf_org_manager/models/org.dart';

import 'dart:convert';
import '../../utils/storage_utils.dart';
import 'state.dart';

class OrgListLogic extends GetxController {
  final OrgListState state = OrgListState();

  @override
  void onReady() {
    final box = GetStorage();
    final localOrgsString = box.read(GetStorageKey.localOrgs);

    if (localOrgsString != null) {
      var orgList = (json.decode(localOrgsString) as List)
          .map((i) => Org.fromJson(i))
          .toList();
      state.orgList = orgList;
    }
    update();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onReorder(int oldIndex, int newIndex) {
    Org org = state.orgList.removeAt(oldIndex);
    state.orgList.insert(newIndex, org);
    StorageUtils.storeOrgList(state.orgList);
    update();
  }

  void updateOrgList(Org org, {int index = -1}) {
    if (index != -1) {
      state.orgList[index] = org;
    } else {
      state.orgList.add(org);
    }
    StorageUtils.storeOrgList(state.orgList);
    update();
  }

  void deleteOrg(int index) {
    state.orgList.removeAt(index);
    StorageUtils.storeOrgList(state.orgList);
    update();
  }

  void handleImport(List<Org> orgList) {
    var newOrgList = <Org>[...state.orgList, ...orgList];
    state.orgList = newOrgList;
    update();
    StorageUtils.storeOrgList(state.orgList);
  }
}
