import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_list_bloc/GetX/getx.dart';
import 'package:student_list_bloc/core/color/color.dart';
import 'package:student_list_bloc/database/database.dart';
import 'package:student_list_bloc/main.dart';
import 'package:student_list_bloc/presentation/addstudent/profile_mode.dart';
import 'package:student_list_bloc/presentation/updation/screenupdate.dart';

var homwcontroller = Get.put(StudentDataX());




class MySearchWidget extends SearchDelegate {
  DBStudentList? dataList;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        color: Colors.grey,
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      textTheme: const TextTheme(displayMedium: TextStyle(color: kwhite)),
      hintColor: kwhite,
      appBarTheme: const AppBarTheme(
        color: Color.fromARGB(255, 62, 62, 62),
      ),
      inputDecorationTheme: searchFieldDecorationTheme ??
          const InputDecorationTheme(
            border: InputBorder.none,
          ),
    );
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: kwhite,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        "$query  is not found!!!",
        style: const TextStyle(color: kwhite),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return GetBuilder<StudentDataX>(
        init: StudentDataX(),
        builder: (controller) {
          controller.getSearchStudent(query);
          return Scaffold(
            backgroundColor: backgroundcolor,
            body: ListView.separated(
                itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: ListTile(
                        onTap: () {
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => ProfileScreen(
                          //       dataList: homecontroller.list[index],
                          //       index: index,
                              
                          //     ),
                               
                          //   ),
                          // );
                          Get.to(ProfileScreen(dataList: homwcontroller.list[index], index: index));
                        },
                        title: Text(controller.list[index].name,
                            style: const TextStyle(color: kwhite)),
                        subtitle: Text(
                          controller.list[index].batch,
                          style: const TextStyle(color: kwhite),
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: kwhite,
                  );
                },
                itemCount: controller.list.length),
          );
        });
  }
}
