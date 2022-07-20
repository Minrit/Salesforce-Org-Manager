import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reorderables/reorderables.dart';
import 'package:sf_org_manager/widgets/org_list_tile/view.dart';

import '../../models/org.dart';
import 'logic.dart';

class OrgListComponent extends StatelessWidget {
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
      return ReorderableWrap(
        needsLongPressDraggable: false,
        direction: Axis.horizontal,
        alignment: WrapAlignment.start,
        onReorder: logic.onReorder,
        children: List.generate(
            state.orgList.length, (i) => _buildItem(i, state.orgList[i])),
      );
    });
  }
}
