import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:student_list_bloc/GetX/getx.dart';
import 'package:student_list_bloc/core/color/color.dart';
import 'package:student_list_bloc/core/color/const/const.dart';
import 'package:student_list_bloc/database/database.dart';
import 'package:student_list_bloc/presentation/addstudent/profile_mode.dart';
import 'package:student_list_bloc/presentation/addstudent/widget/showbottom.dart';

// ignore: must_be_immutable
class ListviewContainer extends StatelessWidget {
  final homecontroller = Get.put(StudentDataX());
  // ignore: prefer_typing_uninitialized_variables
  var colorindex;
  final int index;
  DBStudentList datalist;

  ListviewContainer(
      {Key? key,
      required this.index,
      required this.colorindex,
      required this.datalist})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(datalist.image);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context){
          return ProfileScreen(dataList: homecontroller.list[index],index: index,);

        })),
        child: Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: listcolors[colorindex].first.withOpacity(0.4),
                  blurRadius: 8,
                  spreadRadius: 2,
                  offset: const Offset(4, 4)),
            ],
            gradient: LinearGradient(
              colors: listcolors[colorindex],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(22),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kheight,
              Row(children: [
                kwidth,
                datalist.image == null
                    ? const CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage('assests/images/studentimage.png'),
                      )
                    : CircleAvatar(
                        radius: 30,
                        backgroundImage: FileImage(File(datalist.image!)),
                      ),
                kwidth,
                Text(
                  datalist.name,

                  // list[index].name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                getpoplist(index: index),
              ]),
              Row(
                children: [
                  const SizedBox(
                    width: 80,
                  ),
                  Text('Domain : ${datalist.domain}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    width: 50,
                  ),
                  Text('Batch :${datalist.batch}',
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}


