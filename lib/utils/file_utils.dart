import 'dart:convert';
import 'dart:io' as io;

import 'package:file_picker/file_picker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:universal_html/html.dart';

import '../common/get_storage_key.dart';
import '../models/org.dart';

class FileUtils {
  static void export2Json() async {
    final box = GetStorage();
    final localOrgsString = box.read(GetStorageKey.localOrgs);
    if (kIsWeb) {
      List<int> bytes = utf8.encode(localOrgsString);
      final content = base64Encode(bytes);
      AnchorElement(
          href:
              "data:application/octet-stream;charset=utf-16le;base64,$content")
        ..setAttribute("download", "org_list.json")
        ..click();
    } else {
      final dir = await getApplicationDocumentsDirectory();
      io.File jsonFile = io.File('${dir.path}/org_list.json');
      jsonFile.createSync();
      jsonFile.writeAsStringSync(localOrgsString);
      EasyLoading.showSuccess('JSON SAVED: ${dir.path}/org_list.json');
    }
  }

  static Future<List<Org>> importJson() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    var importedOrgList = <Org>[];
    try {
      if (result != null) {
        if (kIsWeb) {
          var bytes = result.files.first.bytes;
          if(bytes != null){
            var jsonString = utf8.decode(bytes);
            importedOrgList = (json.decode(jsonString) as List)
                .map((i) => Org.fromJson(i))
                .toList();
          }
        } else {
          var path = result.files.single.path;
          if (path != null) {
            io.File jsonFile = io.File(path);
            var jsonString = await jsonFile.readAsString();
            importedOrgList = (json.decode(jsonString) as List)
                .map((i) => Org.fromJson(i))
                .toList();
          }
        }
      }
    } catch (e) {
      print(e);
    }
    return importedOrgList;
  }
}
