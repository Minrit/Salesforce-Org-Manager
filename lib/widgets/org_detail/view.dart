import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sf_org_manager/widgets/user_tile/view.dart';

import '../../models/user.dart';
import '../checkbox_form_field.dart';
import 'logic.dart';

class OrgDetailPage extends StatelessWidget {
  final logic = Get.put(OrgDetailLogic());
  final state = Get.find<OrgDetailLogic>().state;

  UserTileComponent _buildItem(User user, int index) {
    return UserTileComponent(user, index);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Future.value(false);
      },
      child: GetBuilder<OrgDetailLogic>(builder: (logic) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text('New Org'),
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      logic.handleDone();
                      Get.back();
                    },
                    child: Icon(
                      Icons.done,
                      size: 26.0,
                    ),
                  )),
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                    key: state.loginFormKey,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: state.nameController,
                          decoration: const InputDecoration(labelText: 'Name'),
                          // validator: controller.validator,
                        ),
                        TextFormField(
                          controller: state.domainController,
                          decoration:
                              const InputDecoration(labelText: 'Domain'),
                          // validator: controller.validator,
                          obscureText: false,
                        ),
                        Row(children: [
                          Flexible(
                            child: CheckboxFormField(
                                title: Text('Is Production'),
                                // onSaved: logic.onCheckboxChange,
                                validator: logic.checkboxValidator,
                                onChanged: logic.onCheckboxChange,
                                initialValue: state.checkboxState),
                          ),
                          ElevatedButton(
                            child: Text('Add User'),
                            onPressed: logic.addUser,
                          )
                        ]),
                        // ElevatedButton(
                        //   child: Text('Create'),
                        //   onPressed: logic.create,
                        // )
                      ],
                    ),
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
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
