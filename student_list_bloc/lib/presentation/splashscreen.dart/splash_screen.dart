import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_list_bloc/core/color/color.dart';
import 'dart:async';

import 'package:student_list_bloc/presentation/home/screen_home.dart';


// class MyWidget extends StatefulWidget {
//   const MyWidget({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _MyWidgetState createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   @override
//   void initState() {
   
//     super.initState();
//   }
//   @override
 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             const Text(
//               'STUDENT MANAGEMENT \n Thanks for choosing this Application \n This is the application for storing datas of students ',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 17,
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             OpenContainer(
//               closedBuilder: (_, openContainer) {
//                 return const SizedBox(
//                   height: 100,
//                   width: 100,
//                   child: Center(
//                     child: Text(
//                       'Launch App',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//               openColor: Colors.white,
//               closedElevation: 20,
//               closedShape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20)),
//               transitionDuration: const Duration(milliseconds: 700),
//               openBuilder: (_, closeContainer) {
//                 return SecondPage();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
///
/////
//////
// //////
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';



class Screensplash extends StatelessWidget {
  const Screensplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    splash_navigator(context);

    return Scaffold(
      backgroundColor: backgroundcolor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 100,),
              Text(" STUDENT \n MANAGEMENT",
                  style: GoogleFonts.montserrat(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      )),
              SizedBox(
                width: 150.w,
                height: 150.h,
                child: Lottie.asset("assests/images/splash-loading.json"),
              ),
              SizedBox(
                  width: 350.w,
                  height: 350.h,
                  child: Lottie.network("https://assets3.lottiefiles.com/packages/lf20_89gkjupo.json")),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Future<void> splash_navigator(context) async {
  await Future.delayed(const Duration(seconds: 6));
Navigator.push(context, MaterialPageRoute(builder: (context){
  return ScreenHome();

}));
}