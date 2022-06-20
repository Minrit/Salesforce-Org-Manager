import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/org.dart';
import 'logic.dart';

class OrgListTileComponent extends StatelessWidget {
  late Org org;
  final logic = Get.put(OrgListTileLogic());
  final state = Get.find<OrgListTileLogic>().state;

  OrgListTileComponent({Key? key, required this.org}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
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
                    Text(org.domain ?? '-'),
                    TextButton(
                        onPressed: () {},
                        child: Text(org.userList?[0].username ?? ''),
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
                    },
                  ),
                  // const SizedBox(width: 8),
                ],
              ),
            ]),
          ),
        ));
  }
}
