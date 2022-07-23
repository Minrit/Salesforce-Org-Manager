import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reorderables/reorderables.dart';
import 'package:sf_org_manager/widgets/user_tile/view.dart';

import '../../models/user.dart';
import '../../utils/form_utils.dart';
import '../../utils/widget_utils.dart';
import 'logic.dart';

class OrgDetailPage extends StatelessWidget {
  final logic = Get.put(OrgDetailLogic());
  final state = Get.find<OrgDetailLogic>().state;

  UserTileComponent _buildItem(User user, int index) {
    return UserTileComponent(user, index, state.showUserPasswordList[index]);
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
        if (state.edited) {
          var back = WidgetUtils.showDialogFuture(context);
          return Future.value(back);
        } else {
          return Future.value(true);
        }
      },
      child: GetBuilder<OrgDetailLogic>(builder: (logic) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Org Detail'),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: IconButton(
                    icon: const Icon(Icons.done),
                    iconSize: 30,
                    splashRadius: 40,
                    color: Colors.white,
                    onPressed: () {
                      if (state.orgFormKey.currentState!.validate()) {
                        logic.handleDone();
                        Get.back();
                      }
                    }),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: logic.addUser,
            label: const Text('Add a user'),
            icon: const Icon(Icons.add),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                    key: state.orgFormKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: state.nameController,
                          decoration: const InputDecoration(labelText: 'Name'),
                          validator: (value) {
                            return FormUtils.isFieldEmpty(
                                value, 'Please enter an org name');
                          },
                          onChanged: (v) {
                            state.edited = true;
                          },
                        ),
                        TextFormField(
                          controller: state.domainController,
                          decoration:
                              const InputDecoration(labelText: 'Domain'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid domain';
                            } else {
                              if (Uri.parse(value).isAbsolute) {
                                return null;
                              } else {
                                return 'Please enter a valid domain';
                              }
                            }
                          },
                          obscureText: false,
                          onChanged: (v) {
                            state.edited = true;
                          },
                        ),
                        const SizedBox(height: 10),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: Checkbox(
                                    value: state.checkboxState,
                                    onChanged: logic.onCheckboxChange),
                              ),
                              const SizedBox(width: 10),
                              const Text('Is Production')
                            ]),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                  ReorderableWrap(
                    needsLongPressDraggable: false,
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    onReorder: logic.onReorder,
                    children: List.generate(state.userList.length,
                        (i) => _buildItem(state.userList[i], i)),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
