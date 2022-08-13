import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/color/color.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  var goingpage;
  FloatingActionButtonWidget({
    required this.title,
    required this.icon,
    required this.goingpage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, bottom: 0),
      child: SizedBox(
        width: 240.w,
        height: 60.h,
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: ((context) => goingpage)));
          },
          icon: Icon(icon),
          label: Text(
            title,
            style: GoogleFonts.montserrat(),
          ),
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(kwhite),
            backgroundColor: MaterialStateProperty.all(backgroundcolor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 25, 205, 202)))),
          ),
        ),
      ),
    );
  }
}
