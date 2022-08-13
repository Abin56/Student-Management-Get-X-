// ignore_for_file: unused_local_variable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:student_list_bloc/GetX/getx.dart';
import 'package:student_list_bloc/core/color/color.dart';
import 'package:student_list_bloc/core/color/const/const.dart';
import 'package:student_list_bloc/presentation/updation/screenupdate.dart';
import 'package:student_list_bloc/widget/camera_gallery.dart';

import '../scree_addstudent.dart';

getBottomsheet(context) {
  final homeController = Get.put(StudentDataX());
  return showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          height: 150.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        homeController.getGallery();
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.photo_size_select_actual_outlined,
                        size: 45,
                      )),
                  const SizedBox(
                    width: 2,
                  ),
                  IconButton(
                      onPressed: () {
                      homeController.getCamera();
                       Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.photo_camera_outlined,
                        size: 45,
                      )),
                ],
              ),
              kheight,
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text(
                      "Gallery",
                      style: TextStyle(color: backgroundcolor, fontSize: 15),
                    ),
                    kwidth,
                    Text(
                      "Camera",
                      style: TextStyle(color: backgroundcolor, fontSize: 15),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      });
}

getpoplist({context, required int index}) {
  final homecontroller = Get.put(StudentDataX());

  return PopupMenuButton(
    color: const Color.fromARGB(255, 0, 0, 0),
    itemBuilder: (context) {
      return [
        PopupMenuItem(
            child: TextButton.icon(
                onPressed: () {
                   Navigator.of(context).push(MaterialPageRoute(builder: (builder){
                return  ScreenUpdation(index:index);

              },
            
              ),
              );
              // Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.green,
                ),
                label: const Text("Edit", style: TextStyle(color: kwhite)))),
        PopupMenuItem(
          
          value: 'delete',
          child: TextButton.icon(
            onPressed: () {
        homecontroller.getdelete(index);
        Navigator.pop(context);
             
              //delete
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            label: const Text(
              "Delete",
              style: TextStyle(color: kwhite),
            ),
          ),
        )
      ];
    },
    onSelected: (value) {
      if (value == 'delete') {
        log("message");
        homecontroller.getdelete(index);
      }
    },
  );
}
