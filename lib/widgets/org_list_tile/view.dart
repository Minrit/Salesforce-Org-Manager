import 'package:flutter/material.dart';
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
        height: 156,
        width: 100.w > 400 ? 50.w : 100.w,
        child: GestureDetector(
          onTap: () {
            Get.toNamed('org_detail',
                arguments: {'org': org, 'editMode': true, 'index': index});
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
                // ListTile(
                //   leading:
                //       Icon(org.isProduction ? Icons.cloud : Icons.cloud_outlined),
                //   title: Text(org.name),
                //   subtitle: Text(org.domain ?? 'No Domain'),
                // ),
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
                      Row(
                        children: <Widget>[
                          Icon(Icons.copy, size: 16),
                          SizedBox(
                            width: 30.w,
                            child: Text(
                              org.domain ?? '-',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
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
                    // TextButton(
                    //   child: const Text('BUY TICKETS'),
                    //   onPressed: () {
                    //     /* ... */
                    //   },
                    // ),
                    // const SizedBox(width: 8),
                    TextButton(
                      child: const Text('DELETE',
                          style: TextStyle(color: Colors.red)),
                      onPressed: () {
                        /* ... */
                        logic.deleteOrg(index);
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
