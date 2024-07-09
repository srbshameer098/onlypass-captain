import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:untitled7/components/radioButton.dart';

import 'event_confirm.dart';

class EventLocation extends StatefulWidget {
  const EventLocation({super.key});

  @override
  State<EventLocation> createState() => _EventLocationState();
}

bool _isSelectedAt = true;
bool _isSelectedOther = false;
String Locatoin = 'description';
class _EventLocationState extends State<EventLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1B1B1B),

      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 25, top: 10, bottom: 10),
            child: Container(
              width: 37.59.w,
              height: 37.59.h,
              decoration: ShapeDecoration(
                color: const Color(0xFF282828),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.r)),
              ),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ),
        backgroundColor: Color(0xFF1B1B1B),
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Set event location',
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),

      ),
      // floatingActionButton: CircularStepProgressIndicator(
      //   totalSteps: 100,
      //   currentStep: 100,
      //   stepSize: 0,
      //   selectedColor: Color(0xFF37F840),
      //   unselectedColor: Colors.transparent,
      //   padding: 0,
      //   width: 85,
      //   height: 85,
      //   selectedStepSize: 5,
      //   roundedCap: (_, __) => false,
      //   child: GestureDetector(
      //     onTap: (){
      //       Navigator.push(context, MaterialPageRoute(builder: (_)=> EventConfirm()));
      //     },
      //     child: CircleAvatar(
      //       backgroundColor: Colors.transparent,
      //       radius: 35,
      //       child: CircleAvatar(
      //         backgroundColor: Color(0xFFFEFEFE),
      //         radius: 34,
      //         child: Center(child: Icon(Icons.east)),
      //       ),
      //     ),
      //   ),
      // ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h,),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
            //   child: Text(
            //     'Set event location',
            //     style: GoogleFonts.montserrat(
            //       color: Color(0xFFE4E4E4),
            //       fontSize: 14,
            //       fontWeight: FontWeight.w600,
            //     ),
            //   ),
            // ),
            GestureDetector(
              onTap: (){
                  _isSelectedAt ;
                 Locatoin = 'description' ;
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                child: Container(
                  width: double.infinity,
                  color: _isSelectedAt == true ? const Color(0xFFFEFEFE) : const Color(0xFF282828),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomRadioButton(
                        text: 'At facility’s address',
                        isSelected: _isSelectedAt,
                        onSelect: (text) {
                          setState(() {
                            _isSelectedAt = true;
                            _isSelectedOther = false;
                          });
                        },
                        fontStyle: GoogleFonts.montserrat(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color:
                              _isSelectedAt == true ? Color(0xFF282828) : Color(0xFFFEFEFE),
                        ), description: 'Gym Fit Club, 3rd Floor - GCDA Building Kalloor, Ernakulam, Kerala - 678 052',

                      ),
                      // Container(
                      //   color: _isSelectedAt == true
                      //       ? Color(0xFFFEFEFE)
                      //       : Color(0xFF282828),
                      //   padding: EdgeInsets.only(
                      //       right: 25.w, left: 25.w, bottom: 16.h),
                      //   child: Text(
                      //     'Gym Fit Club, 3rd Floor - GCDA Building Kalloor, Ernakulam, Kerala - 678 052',
                      //     style: GoogleFonts.montserrat(
                      //       color: _isSelectedAt == true
                      //           ? Color(0xFF282828)
                      //           : Color(0xFFFEFEFE),
                      //       fontSize: 14.sp,
                      //       fontWeight: FontWeight.w400,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                _isSelectedOther ;
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 12.h),
                child: Container(
                  color: _isSelectedOther == true ? const Color(0xFFFEFEFE): const Color(0xFF282828),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomRadioButton(
                        text: 'Other address',
                        isSelected: _isSelectedOther,
                        onSelect: (text) {
                          setState(() {
                            _isSelectedAt = false;
                            _isSelectedOther = true;
                          });
                        },
                        fontStyle: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: _isSelectedOther == true
                              ? Colors.black
                              : Colors.white,
                        ), description: 'Search for the address or pick it from map',
                      ),
                      // Container(
                      //   color: _isSelectedOther == true
                      //       ?Color(0xFFFEFEFE)
                      //       : Color(0xFF282828),
                      //   padding: EdgeInsets.only(
                      //       right: 25.w, left: 25.w, bottom: 16.h),
                      //   child: Text(
                      //     'Search for the address or pick it from map',
                      //     style: GoogleFonts.montserrat(
                      //       color: _isSelectedOther == true
                      //           ? Color(0xFF282828)
                      //           : Color(0xFFFEFEFE),
                      //       fontSize: 14.sp,
                      //       fontWeight: FontWeight.w400,
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            ),






            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
            //   child: Container(
            //     width: 376,
            //     height: 193,
            //     child: Stack(
            //       children: [
            //         Positioned(
            //           left: 0,
            //           top: 0,
            //           child: Container(
            //             width: 376,
            //             height: 94,
            //             child: Stack(
            //               children: [
            //                 Positioned(
            //                   left: 0,
            //                   top: 0,
            //                   child: Container(
            //                     width: 376,
            //                     height: 94,
            //                     decoration: ShapeDecoration(
            //                       color: Color(0xFFFEFEFE),
            //                       shape: RoundedRectangleBorder(
            //                           borderRadius: BorderRadius.circular(1)),
            //                     ),
            //                   ),
            //                 ),
            //                 Positioned(
            //                   left: 24,
            //                   top: 16,
            //                   child: Container(
            //                     width: 329,
            //                     height: 62,
            //                     child: Stack(
            //                       children: [
            //                         Positioned(
            //                           left: 0,
            //                           top: 27,
            //                           child: SizedBox(
            //                             width: 329,
            //                             height: 35,
            //                             child: Text(
            //                               'Gym Fit Club, 3rd Floor - GCDA Building\nKalloor, Ernakulam, Kerala - 678 052',
            //                               style: TextStyle(
            //                                 color: Color(0xFF818181),
            //                                 fontSize: 14,
            //                                 fontFamily: 'Montserrat',
            //                                 fontWeight: FontWeight.w400,
            //                               ),
            //                             ),
            //                           ),
            //                         ),
            //                         Positioned(
            //                           left: 0,
            //                           top: 0,
            //                           child: Container(
            //                             width: 158,
            //                             height: 17,
            //                             child: Stack(
            //                               children: [
            //                                 Positioned(
            //                                   left: 22,
            //                                   top: 0,
            //                                   child: Text(
            //                                     'At facility’s address',
            //                                     style: TextStyle(
            //                                       color: Color(0xFF191919),
            //                                       fontSize: 14,
            //                                       fontFamily: 'Montserrat',
            //                                       fontWeight: FontWeight.w500,
            //                                       height: 0,
            //                                     ),
            //                                   ),
            //                                 ),
            //                                 Positioned(
            //                                   left: 0,
            //                                   top: 2,
            //                                   child: Container(
            //                                     width: 14,
            //                                     height: 14,
            //                                     child: Stack(
            //                                       children: [
            //                                         Positioned(
            //                                           left: 4.55,
            //                                           top: 4.43,
            //                                           child: Container(
            //                                             width: 5.25,
            //                                             height: 5.25,
            //                                             decoration:
            //                                                 ShapeDecoration(
            //                                               color:
            //                                                   Color(0xFFFEFEFE),
            //                                               shape: OvalBorder(),
            //                                             ),
            //                                           ),
            //                                         ),
            //                                         Positioned(
            //                                           left: 0,
            //                                           top: 0,
            //                                           child: Container(
            //                                             width: 14,
            //                                             height: 14,
            //                                             child: Stack(
            //                                               children: [
            //                                                 Positioned(
            //                                                   left: 0,
            //                                                   top: 0,
            //                                                   child: Container(
            //                                                     width: 14,
            //                                                     height: 14,
            //                                                     decoration:
            //                                                         ShapeDecoration(
            //                                                       shape:
            //                                                           OvalBorder(
            //                                                         side: BorderSide(
            //                                                             width:
            //                                                                 4,
            //                                                             color: Color(
            //                                                                 0xFF00FF00)),
            //                                                       ),
            //                                                     ),
            //                                                   ),
            //                                                 ),
            //                                                 Positioned(
            //                                                   left: 4.29,
            //                                                   top: 4.29,
            //                                                   child: Container(
            //                                                     width: 3.43,
            //                                                     height: 3.43,
            //                                                     decoration:
            //                                                         ShapeDecoration(
            //                                                       color: Color(
            //                                                           0xFFFEFEFE),
            //                                                       shape:
            //                                                           OvalBorder(),
            //                                                     ),
            //                                                   ),
            //                                                 ),
            //                                               ],
            //                                             ),
            //                                           ),
            //                                         ),
            //                                       ],
            //                                     ),
            //                                   ),
            //                                 ),
            //                               ],
            //                             ),
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //         Positioned(
            //           left: 0,
            //           top: 118,
            //           child: Container(
            //             width: 375,
            //             height: 75,
            //             child: Stack(
            //               children: [
            //                 Positioned(
            //                   left: 0,
            //                   top: 0,
            //                   child: Container(
            //                     width: 375,
            //                     height: 75,
            //                     decoration: ShapeDecoration(
            //                       color: Color(0xFF282828),
            //                       shape: RoundedRectangleBorder(
            //                           borderRadius: BorderRadius.circular(1)),
            //                     ),
            //                   ),
            //                 ),
            //                 Positioned(
            //                   left: 24,
            //                   top: 16,
            //                   child: Container(
            //                     width: 123,
            //                     height: 17,
            //                     child: Stack(
            //                       children: [
            //                         Positioned(
            //                           left: 22,
            //                           top: 0,
            //                           child: Text(
            //                             'Other address',
            //                             style: TextStyle(
            //                               color: Color(0xFFFEFEFE),
            //                               fontSize: 14,
            //                               fontFamily: 'Montserrat',
            //                               fontWeight: FontWeight.w500,
            //                               height: 0,
            //                             ),
            //                           ),
            //                         ),
            //                         Positioned(
            //                           left: 0,
            //                           top: 2,
            //                           child: Container(
            //                             width: 14,
            //                             height: 14,
            //                             child: Stack(
            //                               children: [
            //                                 Positioned(
            //                                   left: 0,
            //                                   top: 0,
            //                                   child: Container(
            //                                     width: 14,
            //                                     height: 14,
            //                                     decoration: ShapeDecoration(
            //                                       shape: OvalBorder(
            //                                         side: BorderSide(
            //                                             width: 1,
            //                                             color:
            //                                                 Color(0xFFFEFEFE)),
            //                                       ),
            //                                     ),
            //                                   ),
            //                                 ),
            //                                 Positioned(
            //                                   left: 3,
            //                                   top: 3,
            //                                   child: Container(
            //                                     width: 6,
            //                                     height: 6,
            //                                     decoration: ShapeDecoration(
            //                                         shape: OvalBorder()),
            //                                   ),
            //                                 ),
            //                               ],
            //                             ),
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //                 Positioned(
            //                   left: 24,
            //                   top: 43,
            //                   child: Text(
            //                     'Search for the address or pick it from map',
            //                     style: TextStyle(
            //                       color: Color(0xFFD9D9D9),
            //                       fontSize: 14,
            //                       fontFamily: 'Montserrat',
            //                       fontWeight: FontWeight.w400,
            //                     ),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
