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
          title: Text('User Detail'),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: logic.create,
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
            // key: state.loginFormKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  // controller: state.nameController,
                  decoration: const InputDecoration(labelText: 'User Name'),
                  // validator: controller.validator,
                ),
                TextFormField(
                  // controller: state.domainController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  // validator: controller.validator,
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