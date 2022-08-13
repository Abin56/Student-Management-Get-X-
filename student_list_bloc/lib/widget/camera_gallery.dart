import 'dart:developer';

import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:student_list_bloc/main.dart';



Directory? dir;

Future<bool> requestpermission() async {
  var store = Permission.storage;
  var access = Permission.accessMediaLocation;
  var secondaccess = Permission.manageExternalStorage;

  if (await store.isGranted &&
      await access.isGranted &&
      await secondaccess.isGranted) {
    return true;
  } else {
    var result = await store.request();
    var oneresult = await access.request();
    var tworesult = await secondaccess.request();

    if (result == PermissionStatus.granted &&
        oneresult == PermissionStatus.granted &&
        tworesult == PermissionStatus.granted) {
      return true;
    } else {
      return false;
    }
  }
}