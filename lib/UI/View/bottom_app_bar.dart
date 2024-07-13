// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:untitled7/UI/View/scan_page.dart';
//
// import 'home.dart';
// import 'message_page.dart';
//
// class BottomAppBarPage extends StatefulWidget {
//   const BottomAppBarPage({super.key});
//
//   @override
//   BottomAppBarPageState createState() => BottomAppBarPageState();
// }
//
// class BottomAppBarPageState extends State<BottomAppBarPage> {
//   int _currentIndex = 1;
//
//   final List<Widget> _pages = [
//     const ScanPage(),
//     const Home(otpBottomSheet: true, welcomeSheet: false,),
//     const MessagePage(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_currentIndex],
//       bottomNavigationBar: BottomAppBar(
//         shadowColor: Colors.black,
//         surfaceTintColor: Colors.black,
//         height: 125.h,
//         color: Colors.black,
//         elevation: 0,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: <Widget>[
//             IconButton(
//               disabledColor: Colors.black,
//               focusColor: Colors.black,
//               highlightColor: Colors.black,
//               splashColor: Colors.black,
//               color: Colors.black,
//               hoverColor: Colors.black,
//               alignment: Alignment.bottomCenter,
//               icon: _currentIndex == 0
//                   ? Padding(
//                       padding: EdgeInsets.only(left: 160.w),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           CircleAvatar(
//                             radius: 30.r,
//                             backgroundColor: Colors.white,
//                           ),
//                           SizedBox(
//                             height: 8.h,
//                           ),
//                           Text(
//                             'Scan',
//                             style: GoogleFonts.montserrat(
//                               color: Colors.white,
//                               fontSize: 12.sp,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   : Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         CircleAvatar(
//                           radius: 20.r,
//                         ),
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Text(
//                           '    Scan    ',
//                           style: GoogleFonts.montserrat(
//                             color: Color(0xFF818181),
//                             fontSize: 11.sp,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ],
//                     ),
//               onPressed: () => setState(() => _currentIndex = 0),
//             ),
//             IconButton(
//               focusColor: Colors.black,
//               highlightColor: Colors.black,
//               splashColor: Colors.black,
//               color: Colors.black,
//               hoverColor: Colors.black,
//               alignment: Alignment.bottomCenter,
//               icon: _currentIndex == 1
//                   ? Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         CircleAvatar(
//                           radius: 30.r,
//                           backgroundColor: Colors.white,
//                           // backgroundImage: AssetImage(  'assets/icons/GymFit ClubSelected.png',),
//                           child: CircleAvatar(
//                             backgroundColor: Colors.black,
//                             radius: 29.r,
//                             child: Image.asset(
//                               'assets/icons/logo.png',
//                               height: 64.h,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 8.h,
//                         ),
//                         Text(
//                           'GymFit Club',
//                           style: GoogleFonts.montserrat(
//                             color: Colors.white,
//                             fontSize: 12.sp,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ],
//                     )
//                   : Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         CircleAvatar(
//                           radius: 22.r,
//                           backgroundColor: Colors.grey[800],
//                           // backgroundImage: AssetImage(  'assets/icons/GymFit ClubSelected.png',),
//                           child: CircleAvatar(
//                             backgroundColor: Colors.black,
//                             radius: 20.r,
//                             child: Image.asset(
//                               'assets/icons/logo.png',
//                               height: 44.h,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 8.h,
//                         ),
//                         Text(
//                           'GymFit Club',
//                           style: GoogleFonts.montserrat(
//                             color: Color(0xFF818181),
//                             fontSize: 11.sp,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ],
//                     ),
//               onPressed: () => setState(() => _currentIndex = 1),
//             ),
//             IconButton(
//               disabledColor: Colors.black,
//               focusColor: Colors.black,
//               highlightColor: Colors.black,
//               splashColor: Colors.black,
//               color: Colors.black,
//               hoverColor: Colors.black,
//               alignment: Alignment.bottomCenter,
//               icon: _currentIndex == 2
//                   ? Padding(
//                       padding: EdgeInsets.only(right: 160.w),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           CircleAvatar(
//                             radius: 30.r,
//                             backgroundColor: Colors.white,
//                           ),
//                           SizedBox(
//                             height: 8.h,
//                           ),
//                           Text(
//                             'Messages',
//                             style: GoogleFonts.montserrat(
//                               color: Colors.white,
//                               fontSize: 12.sp,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   : Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         CircleAvatar(
//                           radius: 20.r,
//                         ),
//                         SizedBox(
//                           height: 8.h,
//                         ),
//                         Text(
//                           'Messages',
//                           style: GoogleFonts.montserrat(
//                             color: Color(0xFF818181),
//                             fontSize: 11.sp,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ],
//                     ),
//               onPressed: () => setState(() => _currentIndex = 2),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
