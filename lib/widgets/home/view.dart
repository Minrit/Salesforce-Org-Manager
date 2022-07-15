import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sf_org_manager/widgets/org_list/view.dart';

import 'logic.dart';

class HomePage extends StatelessWidget {
  final logic = Get.put(HomeLogic());
  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Org Manager'),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: logic.export2Json,
                child: Icon(
                  Icons.download,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical, child: OrgListComponent()),
      floatingActionButton: FloatingActionButton(
        onPressed: logic.goToDetail,
        tooltip: 'Add Org',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
