import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled7/components/profile.dart';
class BottomSheetDetails1 extends StatefulWidget {
  const BottomSheetDetails1({super.key});

  @override
  State<BottomSheetDetails1> createState() => _BottomSheetDetails1State();
}

class _BottomSheetDetails1State extends State<BottomSheetDetails1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.w,vertical: 08.0.h),
      width: double.infinity.w,
      height: 628.h,
      decoration: BoxDecoration(color: Color(0xFF191919)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.all(8.0.w),
            child: Center(
              child: Container(
                width: 44.w,
                height: 3.h,
                decoration: ShapeDecoration(
                  color: Color(0xFF464646),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h,),
          Container(
            width: 96.w,
            height: 96.h,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/logo.png'),
                fit: BoxFit.fill,
              ),
              shape: OvalBorder(),
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(16.0.w),
            child: Text(
              'Jerin Varghese',
              style: GoogleFonts.montserrat(
                color: const Color(0xFFFDFDFD),
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          GestureDetector(
            onTap: (){

              showModalBottomSheet(isScrollControlled: true,context: context, builder:(BuildContext){
                return ProfileBottomSheet();
              });

            },
            child: Container(
              width: 95.w,
              height: 24.h,
              decoration: ShapeDecoration(
                color: Color(0xFF282828),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.r)),
              ),
              child: Center(
                child: Text(
                  'View profile',
                  style: GoogleFonts.montserrat(
                    color: Color(0xFFA3A3A3),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 40.h,),
          Container(
            padding: EdgeInsets.all(24.w),
            width: double.infinity.w,
            height: 138.h,
            decoration: ShapeDecoration(
              color: Color(0xFF282828),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.r)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.sentiment_satisfied_rounded,color: Color(0xFF00FF00),size: 16.sp,),
                    SizedBox(width: 12.w,),
                    Row(
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'He',
                                style: GoogleFonts.montserrat(
                                  color: Color(0xFF00FF00),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: ' ',
                                style: TextStyle(
                                  color: Color(0xFF00FF00),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: 'has a valid membership',
                                style: GoogleFonts.montserrat(
                                  color: Color(0xFF00FF00),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 3.w,
                      height: 46.h,
                      decoration: BoxDecoration(color: Color(0xFF00FF00)),
                    ),
                    SizedBox(width: 16.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Access date and time',
                          style: GoogleFonts.montserrat(
                            color: Color(0xFF818181),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 6.h,),
                        Row(
                          children: [
                            Text(
                              '22 - 02 - 2023',
                              style: GoogleFonts.montserrat(
                                color: Color(0xFEFEFEFE),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(width: 16.w,),
                            Text(
                              '10 : 26 am',
                              style: GoogleFonts.montserrat(
                                color: Color(0xFEFEFEFE),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        )

                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 103.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: ShapeDecoration(
                    color: Color(0xFF282828),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.r)),
                  ),
                  width: 176.w,
                  height: 48.h,
                  child: Center(
                    child: Text(
                      'Close',
                      style: GoogleFonts.poppins(
                        color: Color(0xFF818181),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 24.w,),
              GestureDetector(
                onTap: (){

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(

                        title: Text('Alert Dialog Title'),
                        content: Text('This is the content of the alert dialog.'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                  // Navigator.pop(context);
                  AlertDialog(
                    title: const Text('AlertDialog Title'),
                    content: const SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text('This is a demo alert dialog.'),
                          Text('Would you like to approve of this message?'),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Approve'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );

                },
                child: Container(
                  decoration: ShapeDecoration(
                    color: Color(0xFFFEFEFE),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.r)),
                  ),
                  width: 176.w,
                  height: 48.h,
                  child: Center(
                    child: Text(
                      'Mark attendance',
                      style: GoogleFonts.poppins(
                        color: Color(0xFF191919),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
