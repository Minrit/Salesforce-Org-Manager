import 'package:flutter/material.dart';

class UserDetailState {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final personaController = TextEditingController();
  final securityTokenController = TextEditingController();
  final userFormKey = GlobalKey<FormState>();
  UserDetailState() {
    ///Initialize variables
  }
}
