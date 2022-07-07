import 'package:flutter/material.dart';

import '../../models/org.dart';
import '../../models/user.dart';

class OrgDetailState {
  final loginFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final domainController = TextEditingController();
  bool checkboxState = false;
  List<Org> orgList = [];
  late Org org;
  List<User> userList = [];

  OrgDetailState() {
    ///Initialize variables
  }
}
