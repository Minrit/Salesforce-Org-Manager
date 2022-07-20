import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../models/org.dart';
import 'logic.dart';

class OrgListTileComponent extends StatelessWidget {
  late Org org;
  late int index;
  final logic = Get.put(OrgListTileLogic());
  final state = Get.find<OrgListTileLogic>().state;

  OrgListTileComponent({Key? key, required this.index, required this.org})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 100.w > 600 ? 50.w : 100.w,
        child: GestureDetector(
          onTap: () {
            Get.toNamed('org_detail',
                arguments: {'org': org, 'editMode': true, 'index': index});
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                                org.isProduction
                                    ? Icons.cloud
                                    : Icons.cloud_outlined,
                                color: Colors.blue.shade400,
                                size: 16),
                            const SizedBox(width: 8),
                            Text(org.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16)),
                          ]),
                      SizedBox(height: 5),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            height: 16.0,
                            width: 16.0,
                            child: IconButton(
                                icon: const Icon(Icons.copy),
                                padding: new EdgeInsets.all(0.0),
                                splashRadius: 16,// color: Colors.white,
                                onPressed: () {
                                  Clipboard.setData(ClipboardData(
                                      text: org.domain ?? 'No Domain'));
                                  EasyLoading.showSuccess('Copied!');
                                },
                                iconSize: 14,
                                tooltip: 'Copy'),
                          ),
                          const SizedBox(width: 8),
                          SizedBox(
                            width: 100.w > 600 ? (47.5.w * 0.8) : (100.w * 0.7),
                            child: Text(
                              org.domain?.replaceAll('https://', '') ?? '-',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      TextButton(
                          onPressed: () {
                            logic.openOrg(org);
                          },
                          child: logic.renderPrimaryUser(org),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ))
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: const Text('DELETE',
                          style: TextStyle(color: Colors.red)),
                      onPressed: () {
                        AlertDialog alertDialog = AlertDialog(
                          title: Text("AlertDialog"),
                          content: Text("Would you like to delete your org?"),
                          actions: [
                            TextButton(
                              child: Text(
                                "Cancel",
                                style: TextStyle(color: Colors.red),
                              ),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                            TextButton(
                              child: Text("Confirm"),
                              onPressed: () {
                                logic.deleteOrg(index);
                                Get.back();
                              },
                            )
                          ],
                        );
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alertDialog;
                          },
                        );
                      },
                    ),
                    // const SizedBox(width: 8),
                  ],
                ),
              ]),
            ),
          ),
        ));
  }
}
