import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utils/utils.dart';
import '../Drop-downs/Gender-dropdown.dart';
import '../Drop-downs/Staff-rules_dropdown.dart';

String _selectedGender = 'Male';
String _selectedJobRole = 'Trainer';
bool loading = false;
final verificationCodeController = TextEditingController();
final phoneNumberController = TextEditingController();

void New_busineess_BottomSheet(BuildContext context) {
  showModalBottomSheet(
    isDismissible: false,
    enableDrag: true,
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder:
            (BuildContext context, void Function(void Function()) setState) {
          return Container(
            padding: const EdgeInsets.all(28.5),
            height: 629.h,
            width: double.infinity,
            color: const Color(0xff191919),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 10.h, bottom: 10.h, right: 89.w),
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      'Access request',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 81.w, top: 10.h, bottom: 10.h),
                        child: const Icon(
                          Icons.logout_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 32.h,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Full name',
                        style: TextStyle(
                          color: const Color(0xFFE4E4E4),
                          fontSize: 14.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          color: const Color(0xFFFF001E),
                          fontSize: 14.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  width: 334.w,
                  height: 48.h,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF282828),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1)),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 20.h,
                          width: 300.w,
                          child: TextFormField(
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.name,
                            controller: phoneNumberController,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                            ],
                            style: GoogleFonts.montserrat(
                              color: const Color(0xFFFEFEFE),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.6,
                            ),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintText: 'Enter your full name',
                              hintStyle: TextStyle(
                                color: const Color(0xFF6F6F70),
                                fontSize: 14.sp,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                 Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Business name',
                        style: TextStyle(
                          color: const Color(0xFFE4E4E4),
                          fontSize: 14.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          color: const Color(0xFFFF001E),
                          fontSize: 14.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  width: 334.w,
                  height: 48.h,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF282828),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1)),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 20.h,
                          width: 300.w,
                          child: TextFormField(
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.name,
                            controller: phoneNumberController,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                            ],
                            style: GoogleFonts.montserrat(
                              color: const Color(0xFFFEFEFE),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.6,
                            ),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintText: 'Enter your Business name',
                              hintStyle: TextStyle(
                                color: const Color(0xFF6F6F70),
                                fontSize: 14.sp,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  'Request',
                  style: TextStyle(
                    color: const Color(0xFFE4E4E4),
                    fontSize: 14.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  width: 334.w,
                  height: 96.h,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF282828),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1)),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
                    child: Row(
                      children: [
                        SizedBox(

                            width: 300.w,
                            child: TextFormField(
                              maxLines: 3,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.name,
                              controller: phoneNumberController,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                              ],
                              style: GoogleFonts.montserrat(
                                color: const Color(0xFFFEFEFE),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.6,
                              ),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                focusedBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                hintText: 'Mention other details you want to include\nin this request such as location, contact \ndetails, etc..',
                                hintStyle: TextStyle(
                                  color: const Color(0xFF6F6F70),
                                  fontSize: 14.sp,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.0,
                                ),
                              ),
                            ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 97.h,
                ),
                GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                    width: 334.w,
                    height: 48.h,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFFEFEFE),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1)),
                    ),
                    child: Center(
                      child: Text(
                        'Submit your request',
                        style: GoogleFonts.montserrat(
                          color: const Color(0xFF191919),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
