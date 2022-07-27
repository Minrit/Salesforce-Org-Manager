import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
                icon: const FaIcon(FontAwesomeIcons.fileArrowUp),
                color: Colors.white,
                onPressed: logic.importJson,
                tooltip: 'Import JSON',
                iconSize: 17),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
                icon: const FaIcon(FontAwesomeIcons.fileExport),
                color: Colors.white,
                onPressed: logic.export2Json,
                tooltip: 'Export JSON',
                iconSize: 17),
          )
        ],
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical, child: OrgListComponent()),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: logic.goToDetail,
        label: const Text('Add an org'),
        icon: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
