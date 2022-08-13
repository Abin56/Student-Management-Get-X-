import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_list_bloc/core/color/color.dart';
import 'package:student_list_bloc/presentation/home/screen_home.dart';
import 'package:student_list_bloc/widget/camera_gallery.dart';

import 'database/database.dart';
import 'presentation/splashscreen.dart/splash_screen.dart';

late Box<DBStudentList> studentdataDB;
Future<void >main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Hive.initFlutter();
  if(!Hive.isAdapterRegistered(DBStudentListAdapter().typeId)){
    Hive.registerAdapter(DBStudentListAdapter());
  }
  studentdataDB = await Hive.openBox<DBStudentList>('studentlist');
  requestpermission();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(423.5294196844927, 925.0980565145541),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            theme: ThemeData(
              textTheme: const TextTheme(
                  bodyText1: TextStyle(
                    color: kwhite,
                  ),
                  bodyText2: TextStyle(color: kwhite)),
            ),
            debugShowCheckedModeBanner: false,
            home: const Screensplash(),
          );
        });
  }
}
