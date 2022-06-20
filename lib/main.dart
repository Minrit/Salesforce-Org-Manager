import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sf_org_manager/widgets/org_detail/view.dart';

import 'widgets/home/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(initialRoute: '/', getPages: [
      GetPage(
        name: '/',
        page: () => HomePage(),
      ),
      GetPage(
        name: '/org_detail',
        page: () => OrgDetailPage(),
      ),
    ]);
  }
}
