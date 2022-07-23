import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetUtils {
  static Future<bool> showDialogFuture(BuildContext context) async {
    bool back = false;
    Completer c = Completer();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Alert"),
        content: const Text("Would you like to discard changes and back?"),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Get.back();
              c.complete();
            },
          ),
          TextButton(
            child: const Text('Discard', style: TextStyle(color: Colors.red)),
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
}
