

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:student_list_bloc/core/color/color.dart';
import 'package:student_list_bloc/presentation/home/screen_home.dart';

import '../../GetX/getx.dart';
import '../../core/color/const/const.dart';
import '../../database/database.dart';
import '../addstudent/widget/showbottom.dart';
  final nameeditcontroller = TextEditingController();
final batcheditcontroller = TextEditingController();
final domaineditcontroller = TextEditingController();
final phoneeditcontroller = TextEditingController();
List<DBStudentList> dataList = homecontroller.list.value.toList();
 late int index;


final homecontroller = Get.put(StudentDataX());

class ScreenUpdation extends StatelessWidget {

  int index;
   ScreenUpdation({Key? key,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 5, 57, 0),
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
                      "Update Details",
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
                        child:homecontroller.pickedImage==null
                        ?
                         Lottie.network(
                          'https://assets3.lottiefiles.com/packages/lf20_gsiJ2w.json',
                          fit: BoxFit.cover,
                        )
                        :CircleAvatar(
                          radius: double.infinity,
                          backgroundImage: FileImage(File(homecontroller.pickedImage!)),
                          // child: Image.file(
                          //   File(homecontroller.pickedImage!),
                          //   fit: BoxFit.cover,
                          // ),
                        )
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
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 22, 66, 1)),
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
                          controller: nameeditcontroller,
                          decoration: const InputDecoration(
                            hintText: '',
                            icon: Icon(Icons.account_circle_outlined),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        kheight,
                        kheight,
                        TextFormField(
                          controller: batcheditcontroller,
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
                          controller: domaineditcontroller,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                            hintText: 'Domain',
                            icon: Icon(Icons.developer_board),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        kheight,
                        TextFormField(
                          controller: phoneeditcontroller,
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
                            width: 150,
                            child: TextButton.icon( 
                              onPressed: () {
                                onUpdateDatas(index);
                                  Get.offAll(ScreenHome());
                                  
                              },
                              icon: Icon(Icons.construction_rounded),
                              label: Text("Update",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700)),
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all(kwhite),
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(255, 16, 70, 0)),
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
    );
    ;
  }
}

Future<void> onUpdateDatas(int index) async {
  
  final _editname = nameeditcontroller.text.trim();
  final _editbatch = batcheditcontroller.text.trim();
  final _editdomain = domaineditcontroller.text.trim();
  final _editphone = phoneeditcontroller.text.trim();
  if (_editname.isEmpty ||
      _editbatch.isEmpty ||
      _editdomain.isEmpty ||
      _editphone.isEmpty) {
    return;
  } else {
    final _editStudentlist = DBStudentList(
        name: _editname,
        batch: _editbatch,
        domain: _editdomain,
        mobilenumber: _editphone,
        image: homecontroller.pickedImage.toString());
        homecontroller.getupdate(_editStudentlist, index);
        homecontroller.clearPicked();

        
  }

  
}
