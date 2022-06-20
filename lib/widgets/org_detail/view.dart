import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../checkbox_form_field.dart';
import 'logic.dart';

class OrgDetailPage extends StatelessWidget {
  final logic = Get.put(OrgDetailLogic());
  final state = Get.find<OrgDetailLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Org')),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: state.loginFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: state.nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                // validator: controller.validator,
              ),
              TextFormField(
                controller: state.domainController,
                decoration: const InputDecoration(labelText: 'Domain'),
                // validator: controller.validator,
                obscureText: true,
              ),
              CheckboxFormField(
                  title: Text('Is Production'),
                  // onSaved: logic.onCheckboxChange,
                  validator: logic.checkboxValidator,
                  onChanged: logic.onCheckboxChange,
                  initialValue: state.checkboxState),
              ElevatedButton(
                child: Text('Create'),
                onPressed: logic.create,
              )
            ],
          ),
        ),
      ),
    );
  }
}
