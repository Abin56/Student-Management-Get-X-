import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_list_bloc/core/color/color.dart';
import 'package:student_list_bloc/core/color/const/const.dart';
import 'package:student_list_bloc/main.dart';
import 'package:student_list_bloc/presentation/addstudent/scree_addstudent.dart';
import 'package:student_list_bloc/presentation/home/widget/listview_container.dart';
import 'package:student_list_bloc/presentation/search/search.dart';

import '../../GetX/getx.dart';
import '../../widget/floating_widget.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({Key? key}) : super(key: key);

  final homecontroller = Get.put(StudentDataX());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Color.fromARGB(255, 25, 205, 202)
      backgroundColor: const Color.fromARGB(213, 3, 3, 3),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: MySearchWidget());
                
                   
                  },
                  icon: const Icon(
                    Icons.search,
                    color: kwhite,
                  )),
              IconButton(
                  onPressed: () {
                  homecontroller.getSnakBar(context: context);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: kwhite,
                  )),
            ],
          ),
        ),
        kwidth,
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            kwidth,
            kwidth,
            Text(
              'Student',
              style: GoogleFonts.montserrat(
                  fontSize: 30, fontWeight: FontWeight.bold),
            ),
            kwidth,
            Text(
              'List',
              style: GoogleFonts.montserrat(
                  fontSize: 30, fontWeight: FontWeight.bold),
            )
          ],
        ),
        const SizedBox(
          height: 60,
        ),
        Container(
            // padding: EdgeInsets.symmetric(vertical: 8, horizontal: 25),
            decoration: const BoxDecoration(
              color: Color.fromARGB(0, 26, 26, 26),
              borderRadius: BorderRadius.all(
                Radius.circular(60),
              ),
            ),
            height: MediaQuery.of(context).size.height * .731,
            width: double.infinity,
            child: GetBuilder<StudentDataX>(
              init: StudentDataX(),
              builder: (cont) {
                return ListView.separated(
                    itemBuilder: ((context, index) {
                      var rnd = Random();
                      var r = 1 + rnd.nextInt(5 - 1);
                      return ListviewContainer(
                        datalist: homecontroller.list[index],
                        index: index,
                        colorindex: r,
                      );
                    }),
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider();
                    },
                    itemCount: homecontroller.list.value.length);
              },
            ))
      ]),

      floatingActionButton: FloatingActionButtonWidget(
          goingpage: ScreenAddStudent(),
          icon: Icons.group_add_outlined,
          title: 'Add Students'),
    );
  }

 
}
