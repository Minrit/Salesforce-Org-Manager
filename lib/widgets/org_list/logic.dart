
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
    // TODO: implement onReady

    final box = GetStorage();
    final localOrgsString = box.read(GetStorageKey.localOrgs);

    if (localOrgsString != null) {
      var orgList = (json.decode(localOrgsString) as List)
          .map((i) => Org.fromJson(i))
          .toList();
      state.orgList = orgList;
    }
    print('run sfl');
    update();
    super.onReady();
  }

  void addOrg(Org org) {
    state.orgList.add(org);
    // var jsonString = jsonEncode(state.orgList.map((e) => e.toJson()).toList());
    // final box = GetStorage();
    // box.write(GetStorageKey.localOrgs, jsonString);
    StorageUtils.storeOrgList(state.orgList);
    print('added');
    update();
  }

  void deleteOrg(int index) {
    print(index);
    state.orgList.removeAt(index);
    StorageUtils.storeOrgList(state.orgList);
    update();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
