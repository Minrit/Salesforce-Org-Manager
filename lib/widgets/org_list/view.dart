import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sf_org_manager/widgets/org_list_tile/view.dart';

import '../../models/org.dart';
import 'logic.dart';

class OrgListComponent extends StatelessWidget {
  // final data = List.generate(128, (i) => Color(0xFFFF00FF - 2 * i));
  final logic = Get.put(OrgListLogic());
  final state = Get.find<OrgListLogic>().state;

  String colorString(Color color) =>
      "#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}";

  // Container _buildItem(Color color) => Container(
  //       alignment: Alignment.center,
  //       width: 100,
  //       height: 30,
  //       color: color,
  //       child: Text(
  //         colorString(color),
  //         style: const TextStyle(color: Colors.white, shadows: [
  //           Shadow(color: Colors.black, offset: Offset(.5, .5), blurRadius: 2)
  //         ]),
  //       ),
  //     );
  OrgListTileComponent _buildItem(Org org) {
    print(org);
    return OrgListTileComponent(org: org);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 20,
        childAspectRatio: 1 / 0.5,
        children: state.orgList.map((org) => _buildItem(org)).toList(),
        physics: const ScrollPhysics());
  }
}
