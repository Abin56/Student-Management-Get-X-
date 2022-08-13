import 'dart:developer';
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:student_list_bloc/GetX/getx.dart';
import 'package:student_list_bloc/core/color/color.dart';
import 'package:student_list_bloc/core/color/const/const.dart';
import 'package:student_list_bloc/database/database.dart';
import 'package:student_list_bloc/main.dart';
import 'package:student_list_bloc/presentation/addstudent/widget/showbottom.dart';
import 'package:student_list_bloc/presentation/home/screen_home.dart';
 GlobalKey<FormState> formkey = GlobalKey();

class ScreenAddStudent extends StatelessWidget {
  ScreenAddStudent({
    Key? key,
  }) : super(key: key);
  final namecontroller = TextEditingController();
  final batchcontroller = TextEditingController();
  final domaincontroller = TextEditingController();
  final phonenumbercontroller = TextEditingController();
  final homecontroller = Get.put(StudentDataX());
  

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Scaffold(
        // backgroundColor: Color(0xff7a9bee),
        backgroundColor: backgroundcolor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 120,
                      ),
                      Text(
                        "Add Student",
                        style: GoogleFonts.montserrat(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: 130,
                    child: Container(
                      height: 1000,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: kwhite, borderRadius: BorderRadius.circular(30)),
                    )),
                Positioned(
                  top: 100,
                  left: 100,
                  child: Column(
                    children: [
                      Container(
                        height: 160,
                        width: 160,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(120)),
                            border: Border.all(
                                color: Color.fromARGB(255, 25, 205, 202))),
                        child: CircleAvatar(
                            child: homecontroller.pickedImage == null
                                ? Lottie.network(
                                    'https://assets3.lottiefiles.com/packages/lf20_gsiJ2w.json',
                                  )
                                :CircleAvatar(
                                  radius: double.infinity,
                                    backgroundImage: FileImage(
                                      File(homecontroller.pickedImage!),
                                    ),
                                  ),
                            // FileImage(File(homecontroller.pickedImage!)),
    
                            ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          getBottomsheet(context);
                        },
                        icon: Icon(Icons.add_a_photo),
                        label: Text('Add photo'),
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(kwhite),
                          backgroundColor:
                              MaterialStateProperty.all(backgroundcolor),
                          shape: MaterialStateProperty
                              .all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side: const BorderSide(
                                      color: Color.fromARGB(255, 25, 205, 202)))),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  left: -1,
                  right: -1,
                  bottom: -30,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: kwhite,
                      height: MediaQuery.of(context).size.height - 300,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          TextFormField(
                             autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: namecontroller,
                            decoration: const InputDecoration(
                              hintText: 'Student Name',
                              icon: Icon(Icons.account_circle_outlined),
                              border: OutlineInputBorder(),
                              
                            ),
                            validator: (value){
                              if(value==null){
                                return 'Invalid Name is empty';

                              }else if(getplaylistsatus(namepath: value)){
                                return 'Alreay exist';

                              }

                            },
                          ),
                          kheight,
                          kheight,
                          TextFormField(
                            controller: batchcontroller,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: const InputDecoration(
                              hintText: 'Batch',
                              icon: Icon(Icons.hotel_class_outlined),
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          kheight,
                          TextFormField(
                            controller: domaincontroller,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: const InputDecoration(
                              hintText: 'Domain',
                              icon: Icon(Icons.developer_board),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          kheight,
                          TextFormField(
                            controller: phonenumbercontroller,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: const InputDecoration(
                              hintText: 'Mobile Number',
                              icon: Icon(Icons.phone_android_sharp),
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          kheight,
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: SizedBox(
                              height: 50,
                              width: 180,
                              child: TextButton.icon(
                                onPressed: () {
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //     builder: (context) => on));\
                               
                                           onAddingDatas();
                                           Get.offAll(ScreenHome());

                                  
                                  

                                Get.offAll(ScreenHome());
                                },
                                icon: Icon(Icons.person_add),
                                label: Text("Add Student",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700)),
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all(kwhite),
                                  backgroundColor:
                                      MaterialStateProperty.all(backgroundcolor),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          side: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 25, 205, 202)))),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onAddingDatas() async {
    final _name = namecontroller.text.trim();
    final _batch = batchcontroller.text.trim();
    final _domain = domaincontroller.text.trim();
    final _phonenumber = phonenumbercontroller.text.trim();

    if (_name.isEmpty ||
        _batch.isEmpty ||
        _domain.isEmpty ||
        _phonenumber.isEmpty) {
      return;
    } else {
      final _addAllDatastodatabase = DBStudentList(
        name: _name,
        batch: _batch,
        domain: _domain,
        mobilenumber: _phonenumber,
        image: homecontroller.pickedImage==null
        ?'assests/images/studentimage.png'
        :homecontroller.pickedImage.toString(),
      );

      //  addStudentlist(_addAllDatastodatabase);
      homecontroller.addStudent(_addAllDatastodatabase);
      homecontroller.clearPicked();
    }
  }
}
getplaylistsatus({required namepath}) {
  List<DBStudentList> name = studentdataDB.values.toList();
  List<DBStudentList> result = name
      .where((checking) => checking.name == namepath)
      .toList();
  if (result.isEmpty) {
    return false;
  } else {
    return true;
  }
}