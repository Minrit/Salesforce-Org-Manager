import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class UserDetailPage extends StatelessWidget {
  final logic = Get.put(UserDetailLogic());
  final state = Get.find<UserDetailLogic>().state;

  @override
  Widget build(BuildContext context) {
    Future<bool> showDialogFuture(BuildContext context) async {
      bool back = false;
      Completer c = Completer();
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Alert"),
          content:
          Text("Would you like to discard changes and back?"),
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
      child: GetBuilder<UserDetailLogic>(builder: (logic) {
        return Scaffold(
          appBar: AppBar(
            // automaticallyImplyLeading: false,
            title: Text('User Detail'),
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: logic.handleDone,
                    child: Icon(
                      Icons.done,
                      size: 26.0,
                    ),
                  )),
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
