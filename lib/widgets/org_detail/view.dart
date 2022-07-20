import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reorderables/reorderables.dart';
import 'package:sf_org_manager/widgets/user_tile/view.dart';

import '../../models/user.dart';
import '../../utils/form_utils.dart';
import '../checkbox_form_field.dart';
import 'logic.dart';

class OrgDetailPage extends StatelessWidget {
  final logic = Get.put(OrgDetailLogic());
  final state = Get.find<OrgDetailLogic>().state;

  UserTileComponent _buildItem(User user, int index) {
    return UserTileComponent(user, index, state.showUserPasswordList[index]);
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> showDialogFuture(BuildContext context) async {
      bool back = false;
      Completer c = Completer();
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Alert"),
          content: Text("Would you like to discard changes and back?"),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Get.back();
                c.complete();
              },
            ),
            TextButton(
              child: Text('Discard', style: TextStyle(color: Colors.red)),
              onPressed: () {
                back = true;
                Get.back();
                c.complete();
              },
            ),
          ],
        ),
      );
      await c.future;
      return back;
    }

    return WillPopScope(
      onWillPop: () async {
        if (state.edited) {
          var back = showDialogFuture(context);
          return Future.value(back);
        } else {
          return Future.value(true);
        }
      },
      child: GetBuilder<OrgDetailLogic>(builder: (logic) {
        return Scaffold(
          appBar: AppBar(
            // automaticallyImplyLeading: false,
            title: Text('Org Detail'),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 10.0),
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
                    }
                ),
              ),
            ],
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
                      // mainAxisAlignment: MainAxisAlignment.center,
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
                        Row(children: [
                          Flexible(
                            child: CheckboxFormField(
                                title: Text('Is Production'),
                                // onSaved: logic.onCheckboxChange,
                                // validator: logic.checkboxValidator,
                                onChanged: logic.onCheckboxChange,
                                initialValue: state.checkboxState),
                          ),
                          ElevatedButton(
                            child: Text('Add User'),
                            onPressed: logic.addUser,
                          )
                        ]),
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
