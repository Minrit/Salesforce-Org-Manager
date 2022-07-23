import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/widget_utils.dart';
import 'logic.dart';

class UserDetailPage extends StatelessWidget {
  final logic = Get.put(UserDetailLogic());
  final state = Get.find<UserDetailLogic>().state;

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
      child: GetBuilder<UserDetailLogic>(builder: (logic) {
        return Scaffold(
          appBar: AppBar(
            // automaticallyImplyLeading: false,
            title: const Text('User Detail'),
            actions: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: IconButton(
                      icon: const Icon(Icons.done),
                      iconSize: 30,
                      splashRadius: 40,
                      color: Colors.white,
                      onPressed: logic.handleDone
                  ),
              ),
            ],
          ),
          body: Container(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: state.userFormKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: state.usernameController,
                    decoration: const InputDecoration(labelText: 'User Name'),
                    validator: logic.usernameValidator,
                    onChanged: (v) {
                      state.edited = true;
                    },
                  ),
                  TextFormField(
                    controller: state.passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    validator: logic.passwordValidator,
                    obscureText: true,
                    onChanged: (v) {
                      state.edited = true;
                    },
                  ),
                  TextFormField(
                    controller: state.personaController,
                    decoration: const InputDecoration(labelText: 'Persona'),
                    onChanged: (v) {
                      state.edited = true;
                    },
                  ),
                  TextFormField(
                    controller: state.securityTokenController,
                    decoration:
                        const InputDecoration(labelText: 'Security Token'),
                    obscureText: true,
                    onChanged: (v) {
                      state.edited = true;
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
