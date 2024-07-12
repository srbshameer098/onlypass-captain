//
// import 'package:flutter/material.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:step_progress_indicator/step_progress_indicator.dart';
//
// import '../../Utils/utils.dart';
// import 'Staff login - Facilities Search.dart';
//
// int? selectedValue = 1;
// void _handleRadioValueChange(int? value) {
//   setState(() {
//     selectedValue = value ?? 1;
//   });
// }
// final PageController _pageController = PageController();
// int currentPage = 0; // Track current page index
//
// void showCustomBottomSheet(BuildContext context) {
//   showModalBottomSheet(
//     isDismissible: false,
//     enableDrag: true,
//     isScrollControlled: true,
//     context: context,
//     builder: (BuildContext context) {
//       return StatefulBuilder(
//         builder: (BuildContext context, void Function(void Function()) setState) {
//           return Container(
//             height: 534.h,
//             decoration: BoxDecoration(
//               color: Color(0xFF191919),
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(2.r),
//                 topRight: Radius.circular(2.r),
//               ),
//             ),
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 32.h),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Welcome to Onlypass Captain App',
//                     style: TextStyle(
//                       color: Color(0xFFE4E4E4),
//                       fontSize: 16.sp,
//                       fontFamily: 'Montserrat',
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   SizedBox(height: 16.h),
//                   Text(
//                     "We couldn't find any account registered with the phone number. Select one of the below.",
//                     style: TextStyle(
//                       color: Color(0xFF6F6F6F),
//                       fontSize: 14.sp,
//                       fontFamily: 'Montserrat',
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                   SizedBox(height: 32.h),
//                   GestureDetector(
//                     onTap: () {
//                       setModalState(() {
//                         selectedValue = 1;
//                       });
//                       setState(() {
//                         selectedValue = 1;
//                       });
//                     },
//                     child: Container(
//                       width: 334.w,
//                       height: 95.h,
//                       decoration: ShapeDecoration(
//                         color: selectedValue == 1 ? Color(0xFFFEFEFE) : Color(0xFF282828),
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//
//                           Row(
//                             children: [
//                               SizedBox(width: 10.w,),
//
//                               Radio(
//
//                                 value: 1,
//                                 groupValue: selectedValue,
//                                 onChanged: (value) {
//                                   setModalState(() {
//                                     _handleRadioValueChange(value);
//                                   });
//                                   setState(() {
//                                     _handleRadioValueChange(value);
//                                   });
//                                 },
//                                 activeColor: Colors.green,
//                               ),
//                               Text(
//                                 'I am a staff of a registered business',
//                                 style: TextStyle(
//                                   color: selectedValue == 1 ?Color(0xFF191919):Color(0xFFFEFEFE),
//                                   fontSize: 13.sp,
//                                   fontFamily: 'Montserrat',
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(left: 24.w,),
//                             child: Text(
//                               'Select your business from registered list of businesses with a name or code.',
//                               style: TextStyle(
//                                 color: Color(0xFF818181),
//                                 fontSize: 14,
//                                 fontFamily: 'Montserrat',
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 24.h),
//                   GestureDetector(
//                     onTap: () {
//                       setModalState(() {
//                         selectedValue = 2;
//                       });
//                       setState(() {
//                         selectedValue = 2;
//                       });
//                     },
//                     child: Container(
//                       width: 334.w,
//                       height: 74.h,
//                       decoration: ShapeDecoration(
//                         color: selectedValue == 2 ? Color(0xFFFEFEFE) : Color(0xFF282828),
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//
//                           Row(
//                             children: [
//                               SizedBox(width: 10.w,),
//
//                               Radio(
//                                 value: 2,
//                                 groupValue: selectedValue,
//                                 onChanged: (value) {
//                                   setModalState(() {
//                                     _handleRadioValueChange(value);
//                                   });
//                                   setState(() {
//                                     _handleRadioValueChange(value);
//                                   });
//                                 },
//                                 activeColor: Colors.green,
//                               ),
//                               Text(
//                                 'I am a new user.',
//                                 style: TextStyle(
//                                   color:selectedValue == 1 ? Color(0xFFFEFEFE):Color(0xFF191919),
//                                   fontSize: 14.sp,
//                                   fontFamily: 'Montserrat',
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(left: 24.w),
//                             child: Text(
//                               'I would like to register my business.',
//                               style: TextStyle(
//                                 color: Color(0xFF6F6F70),
//                                 fontSize: 14,
//                                 fontFamily: 'Montserrat',
//                                 fontWeight: FontWeight.w400,
//                                 height: 0.08,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 32.h),
//                   Text(
//                     'Use another phone number',
//                     style: TextStyle(
//                       color: Color(0xFFFEFEFE),
//                       fontSize: 14.sp,
//                       fontFamily: 'Montserrat',
//                       fontWeight: FontWeight.w600,
//                       decoration: TextDecoration.underline,
//                       decorationColor: const Color(0xFFFEFEFE),
//                       height: 0,
//                       letterSpacing: 0.28,
//                     ),
//                   ),
//
//
//
//                   SizedBox(height: 38.h,),
//
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       CircularStepProgressIndicator(
//
//                         totalSteps: 100,
//                         currentStep: 50 + currentPage * 50,
//                         stepSize: 0,
//                         selectedColor: Color(0xFF37F840),
//                         unselectedColor: Colors.transparent,
//                         width: 70.w,
//                         height: 70.h,
//                         selectedStepSize: 1,
//                         // roundedCap: (_, __) => true,
//                         child: GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               if (currentPage < 2) {
//                                 currentPage += 1;
//                                 _pageController.jumpToPage(
//                                   currentPage,
//                                   // duration: Duration(milliseconds: 300),
//                                   // curve: Curves.easeInOut,
//                                 );
//                               } else if (currentPage == 2) {
//                                 // Navigator.of(context).pushAndRemoveUntil(
//                                 //   MaterialPageRoute(builder: (_) => const EventConfirm()),
//                                 //       (Route<dynamic> route) => false,);
//                                 Navigator.push(context, MaterialPageRoute(builder: (_)=> Facilities_Search()));
//                               }
//                             });
//                           },
//                           child: CircleAvatar(
//                             backgroundColor: Colors.transparent,
//                             radius: 30.r,
//                             child: CircleAvatar(
//                               backgroundColor: Color(0xFFFEFEFE),
//                               radius: 30.r,
//                               child: Center(child: Icon(Icons.east)),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   // Add more widgets here if needed
//                 ],
//               ),
//             ),
//           );
//         },
//       );
//     },
//   );
// }
//
