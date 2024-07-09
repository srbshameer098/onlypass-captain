import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'package:untitled7/UI/s1.dart';
import 'package:untitled7/test_pages/t_p_1.dart';

import 'UI/View/create_event.dart';
import 'UI/View/event_confirm.dart';
import 'UI/View/event_location.dart';
import 'UI/View/event_time.dart';

class EventPages extends StatefulWidget {
  const EventPages({super.key});

  @override
  _EventPagesState createState() => _EventPagesState();
}

class _EventPagesState extends State<EventPages> {
  @override
  void initState() {
    super.initState();
    eventDescriptionController.addListener(() {
      setState(() {});
    });
  }

  final PageController _pageController = PageController();
  int currentPage = 0; // Track current page index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: GestureDetector(
      //
      //     onTap: () {
      //       showDialog(
      //         barrierDismissible: false,
      //         context: context,
      //         builder: (BuildContext context) {
      //           return AlertDialog(
      //             title: const Text('Leave without saving?'),
      //             content: const Text(
      //                 'Are you sure you want to leave without saving your changes?'),
      //             actions: [
      //               TextButton(
      //                 onPressed: () => Navigator.pushReplacement(context,
      //                     MaterialPageRoute(builder: (_) => const Home())),
      //                 // Allow leaving
      //                 child: Text('Leave'),
      //               ),
      //               TextButton(
      //                 onPressed: () => Navigator.pop(context, false),
      //                 // Stay on screen
      //                 child: Text('Stay'),
      //               ),
      //             ],
      //           );
      //         },
      //       );
      //
      //       // Navigator.pop(context);
      //     },
      //     child: Padding(
      //       padding: EdgeInsets.only(left: 25.w, top: 10.h, bottom: 10.h),
      //       child: Container(
      //         width: 37.59.w,
      //         height: 37.59.h,
      //         decoration: ShapeDecoration(
      //           color: const Color(0xFF282828),
      //           shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(2.r)),
      //         ),
      //         child: Icon(
      //           Icons.arrow_back_ios_new_rounded,
      //           color: Colors.white,
      //         ),
      //       ),
      //     ),
      //   ),
      //   backgroundColor: Color(0xFF1B1B1B),
      //   automaticallyImplyLeading: false,
      //   elevation: 0,
      //   centerTitle: true,
      //   title: Text(
      //     'Create an event or class',
      //     style: GoogleFonts.montserrat(
      //       color: Colors.white,
      //       fontSize: 16.sp,
      //       fontWeight: FontWeight.w600,
      //     ),
      //   ),
      //   actions: [
      //     Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      //       child: Center(
      //           child: Image.asset(
      //             'assets/icons/fi-rr-menu-dots-vertical.png',
      //             height: 24.h,
      //             width: 26.w,
      //           )),
      //     )
      //   ],
      // ),
      floatingActionButton: CircularStepProgressIndicator(
        totalSteps: 100,
        currentStep: 35 + currentPage * 35,
        stepSize: 0,
        selectedColor: Color(0xFF37F840),
        unselectedColor: Colors.transparent,
        width: 70.w,
          height: 70.h,
        selectedStepSize: 2,
        // roundedCap: (_, __) => true,
        child: GestureDetector(
          onTap: () {
            setState(() {
              if (currentPage < 2) {
                currentPage += 1;
                _pageController.jumpToPage(
                  currentPage,
                  // duration: Duration(milliseconds: 300),
                  // curve: Curves.easeInOut,
                );
              } else if (currentPage == 2) {
                // Navigator.of(context).pushAndRemoveUntil(
                //   MaterialPageRoute(builder: (_) => const EventConfirm()),
                //       (Route<dynamic> route) => false,);
                Navigator.push(context, MaterialPageRoute(builder: (_)=> EventConfirm()));
              }
            });
          },
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 30.r,
            child: CircleAvatar(
              backgroundColor: Color(0xFFFEFEFE),
              radius: 30.r,
              child: Center(child: Icon(Icons.east)),
            ),
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index) => setState(() => currentPage = index),
        // Update current page
        children: [
          CreateEvent(),
          EventTime(),
          // EventDateTimePage(),
          EventLocation(),

        ],
      ),
    );
  }
}
