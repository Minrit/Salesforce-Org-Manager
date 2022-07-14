import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sf_org_manager/widgets/org_detail/view.dart';
import 'package:sf_org_manager/widgets/user_detail/view.dart';
import 'package:sizer/sizer.dart';
import 'package:window_size/window_size.dart';

import 'widgets/home/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowMinSize(const Size(600, 300));
    setWindowMaxSize(Size.infinite);
  }
  await GetStorage.init();
  EasyLoading.instance
    .displayDuration = const Duration(milliseconds: 300);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        initialRoute: '/',
        getPages: [
          GetPage(
            name: '/',
            page: () => HomePage(),
          ),
          GetPage(
            name: '/org_detail',
            page: () => OrgDetailPage(),
          ),
          GetPage(
            name: '/user_detail',
            page: () => UserDetailPage(),
          ),
        ],
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
      );
    });
  }
}
