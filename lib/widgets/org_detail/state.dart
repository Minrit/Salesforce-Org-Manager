import 'package:flutter/material.dart';

import '../../models/org.dart';

class OrgDetailState {
  final loginFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final domainController = TextEditingController();
  bool checkboxState = false;
  List<Org> orgList = [];

  OrgDetailState() {
    ///Initialize variables
  }
}
