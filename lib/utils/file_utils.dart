import 'dart:io';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';

import '../common/get_storage_key.dart';

class FileUtils {
  static void export2Json() async {
    final dir = await getApplicationDocumentsDirectory();
    final box = GetStorage();
    final localOrgsString = box.read(GetStorageKey.localOrgs);
    File jsonFile = File('${dir.path}/org_list.json');
    jsonFile.createSync();
    jsonFile.writeAsStringSync(localOrgsString);
    EasyLoading.showSuccess('JSON SAVED: ${dir.path}/org_list.json');
  }
}
