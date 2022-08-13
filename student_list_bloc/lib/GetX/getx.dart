import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_list_bloc/database/database.dart';
import 'package:student_list_bloc/main.dart';

class StudentDataX extends GetxController {
  var list = <DBStudentList>[].obs;
  // RxString? pickedImage = ''.obs;
  String? pickedImage;
  String? pickedimagefromGallery;
  @override
  void onReady() {
    list.value.clear();
    list.value.addAll(studentdataDB.values);

    super.onReady();
    update();
  }

  addStudent(DBStudentList student) {
    studentdataDB.add(student);
    list.value.add(student);

    update();
  }

  Future<void> getdelete(int index) async {
    await studentdataDB.deleteAt(index);
    list.value.removeAt(index);
    update();
  }
  // getAllDelete(var index){
  //   studentdataDB.clear();

  // }
  getupdate(DBStudentList updatation, int index) {
    studentdataDB.putAt(index, updatation);
    list.value[index] = updatation;
    update();
  }

  getCamera() async {
    final images = await ImagePicker().pickImage(source: ImageSource.camera);
    // pickedImage = images!.path.obs;
    pickedImage = images!.path;
    update();
  }

  getGallery() async {
    final images = await ImagePicker().pickImage(source: ImageSource.gallery);
    pickedimagefromGallery = images!.path;
    update();
  }

  clearPicked() {
    pickedImage = null;
  }

  getSnakBar({required context}) async {
    return showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text("Clear All Datas"),
          content: const Text("Delete all datas"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel')),
            TextButton(
                onPressed: () async {
                  Navigator.pop(context);
                  await studentdataDB.clear();
                  list.clear();
                  update();
                },
                child: const Text('OK'))
          ],
        );
      },
    );
  }
   getSearchStudent(String query){
    list.value = studentdataDB.values
    .toList()
    .where((element) => 
    element.name.toLowerCase().contains(query.toLowerCase()))
    .toList();
    

    
    
   
  
}
@override
  void onInit() {
    var list = <DBStudentList>[].obs;
    super.onInit();
  }
  
}
