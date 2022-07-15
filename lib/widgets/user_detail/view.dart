import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class UserDetailPage extends StatelessWidget {
  final logic = Get.put(UserDetailLogic());
  final state = Get.find<UserDetailLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserDetailLogic>(builder: (logic) {
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
                ),
                TextFormField(
                  controller: state.passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  validator: logic.passwordValidator,
                  obscureText: true,
                ),
                TextFormField(
                  controller: state.personaController,
                  decoration: const InputDecoration(labelText: 'Persona'),
                ),
                TextFormField(
                  controller: state.securityTokenController,
                  decoration: const InputDecoration(labelText: 'Security Token'),
                  obscureText: true,
                ),
                // ElevatedButton(
                //   child: Text('Create'),
                //   onPressed: logic.create,
                // )
              ],
            ),
          ),
        ),
      );
    });
  }
}
