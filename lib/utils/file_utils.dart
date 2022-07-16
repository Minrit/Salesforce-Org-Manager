import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';

import '../common/get_storage_key.dart';
import '../models/org.dart';

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

  static Future<List<Org>> importJson() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    var importedOrgList = <Org>[];
    try {
      if (result != null) {
        var path = result.files.single.path;
        if (path != null) {
          File jsonFile = File(path);
          var jsonString = await jsonFile.readAsString();
          importedOrgList = (json.decode(jsonString) as List)
              .map((i) => Org.fromJson(i))
              .toList();
          print(importedOrgList);
        }
      }
    } catch (e) {}
    return importedOrgList;
  }
}
