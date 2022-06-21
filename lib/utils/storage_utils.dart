import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../common/get_storage_key.dart';
import '../models/org.dart';

class StorageUtils {
  static void storeOrgList(List<Org> orgList) {
    var jsonString = jsonEncode(orgList.map((e) => e.toJson()).toList());
    final box = GetStorage();
    box.write(GetStorageKey.localOrgs, jsonString);
  }
}
