import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_list_bloc/GetX/getx.dart';
import 'package:student_list_bloc/core/color/color.dart';
import 'package:student_list_bloc/database/database.dart';
import 'package:student_list_bloc/presentation/addstudent/scree_addstudent.dart';
import 'package:student_list_bloc/presentation/home/screen_home.dart';
import 'package:student_list_bloc/presentation/updation/screenupdate.dart';

import '../../core/color/const/const.dart';


// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  final homecontroller = Get.put(StudentDataX());
  DBStudentList dataList;
  int index;
  ProfileScreen({Key? key, required this.dataList, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Color.fromARGB(255, 25, 205, 202)
        backgroundColor: const Color.fromARGB(213, 3, 3, 3),
        body: SafeArea(
          child: ListView(
            children: [
              Row(
                children: [
                  const SizedBox(height: 160),
                  Text(
                    'Student',
                    style: GoogleFonts.montserrat(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  kwidth,
                  Text(
                    'Details',
                    style: GoogleFonts.montserrat(
                        color: Colors.amber,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                height: 694.h,
                width: 500.w,
                decoration: const BoxDecoration(
                    color: kwhite,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(100))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 100,
                      backgroundImage: FileImage(File(dataList.image!)),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text( 
                      "Name :    ${dataList.name}",
                      style: GoogleFonts.montserrat(
                          color: backgroundcolor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Domain :  ${dataList.domain}",
                      style: GoogleFonts.montserrat(
                          color: backgroundcolor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Batch :   ${dataList.batch}",
                      style: GoogleFonts.montserrat(
                          color: backgroundcolor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Phone number:  ${dataList.mobilenumber}",
                      style: GoogleFonts.montserrat(
                          color: backgroundcolor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (builder) {
                            //       return ScreenUpdation(index: index);
                            //     },
                            //   ),
                            // );
                            // Navigator.pop(context);
                            Get.to(ScreenUpdation(index: index));
                          },
                          icon: const Icon(Icons.update),
                          label: Text("UpDate   ",
                              style: GoogleFonts.montserrat(
                                  color: Colors.green,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700)),
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all(kwhite),
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
                        TextButton.icon(
                          onPressed: () async{
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                              
                            //     builder: (builder) {
                            //       return ScreenHome();
                            //     },
                            //   ),
                            // );
                          //    Navigator.of(context).
                          // pushReplacement(
                          
                          //   MaterialPageRoute(
                          //     builder: (context) => ScreenHome(),
                          //   ),
                          // );
                      await  Get.offAll(ScreenHome());
                          },
                          icon: const Icon(Icons.home),
                          label: Text("Home ",
                              style: GoogleFonts.montserrat(
                                  color: Colors.amber,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700)),
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all(kwhite),
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
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
