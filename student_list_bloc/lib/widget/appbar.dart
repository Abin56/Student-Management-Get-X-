import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_list_bloc/core/color/color.dart';

import '../core/color/const/const.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  const AppBarWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.black,
        decoration: BoxDecoration(
            border: Border.all(color: kwhite),
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          children: [
            kwidth,
            kwidth,
            Text(
              title,
              style: GoogleFonts.montserrat(
                  fontSize: 25, fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.group_add_outlined,
                  color: kwhite,
                  size: 27,
                )),
            kwidth,
          ],
        ),
      ),
    );
  }
}
