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

  OrgListTileComponent _buildItem(int index, Org org) {
    return OrgListTileComponent(index: index, org: org);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrgListLogic>(builder: (logic) {
      return Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.start,
        // spacing: 8.0,
        // runAlignment: WrapAlignment.center,
        // runSpacing: 8.0,
        // crossAxisAlignment: WrapCrossAlignment.center,
        // textDirection: TextDirection.rtl,
        // verticalDirection: VerticalDirection.up,
        children: List.generate(
            state.orgList.length, (i) => _buildItem(i, state.orgList[i])),
      );
      // return GridView.count(
      //     scrollDirection: Axis.vertical,
      //     shrinkWrap: true,
      //     crossAxisCount: 3,
      //     mainAxisSpacing: 12,
      //     crossAxisSpacing: 20,
      //     childAspectRatio: 1 / 0.5,
      //     // children: state.orgList.map((org) => _buildItem(org)).toList(),
      //     children: List.generate(
      //         state.orgList.length, (i) => _buildItem(i, state.orgList[i])),
      //     physics: const ScrollPhysics());
    });
  }
}
