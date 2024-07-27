import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled7/UI/s1.dart';

import '../../UI/View/home.dart';
import '../../Utils/utils.dart';
import '../Drop-downs/Gender-dropdown.dart';
import '../Drop-downs/Staff-rules_dropdown.dart';


String _selectedGender = 'Male';
String _selectedJobRole = 'Trainer';
bool loading = false;
final verificationCodeController = TextEditingController();
final emailController = TextEditingController();
final phoneNumberController = TextEditingController();
final nameController = TextEditingController();

Future<void> staff_customer_id_BottomSheet(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? phoneNumber = prefs.getString('phone_number');
  showModalBottomSheet(
    isDismissible: false,
    enableDrag: false,
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder:
            (BuildContext context, void Function(void Function()) setState) {
          return Container(
            padding:  EdgeInsets.symmetric(horizontal:28.w,vertical: 37.h),
            height: 629.h,
            width: double.infinity,
            color: const Color(0xff191919),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child:
                        SvgPicture.asset('assets/icons/back arrow.svg',
                          width:7.76.w,height: 16.h,
                        )
                    ),
                    SizedBox(width: 77.24.w),
                    Text(
                      'Profile information',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width:69.w,),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child:  SvgPicture.asset('assets/icons/Exit.svg',
              width:17.w,height: 17.h,
              )

                    ),
                  ],
                ),
                SizedBox(
                  height: 34.h,
                ),
                Text(
                  'Phone number',
                  style: TextStyle(
                    color: Color(0xFFE4E4E4),
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
                  height: 48.h,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF282828),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1)),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Opacity(
                          opacity: 0.10,
                          child: Image.asset(
                            'assets/icons/indflag.png',
                            height: 16.sp,
                          ),
                        ),
                        Opacity(
                          opacity: 0.10,
                          child:  Text(
                            '+91',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.6,
                            ),
                          ),
                        ),
                        const Opacity(
                          opacity: 0.10,
                          child: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.grey,
                          ),
                        ),
                        VerticalDivider(
                          color: const Color(0xFF191919),
                          width: 1.5.w,
                          thickness: 2,
                          indent: 8.h,
                          endIndent: 8.h,
                        ),
                        SizedBox(width: 5.w),
                        SizedBox(
                          height: 20.h,
                          width: 150.w,
                          child: Opacity(
                            opacity: 0.10,
                            child: Text(
                              phoneNumber ?? 'No number',
                              style: TextStyle(
                                color: const Color(0xFFFEFEFE),
                                fontSize: 14.sp,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,

                                letterSpacing: 1.40,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Verified',
                          style: TextStyle(
                            color: const Color(0xFF37F840),
                            fontSize: 12.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            height: 0,
                            letterSpacing: 1.20,
                          ),
                        ),
                        SvgPicture.asset('assets/icons/Tick.svg',
                          width:8.w,height: 8.h,
                        )
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
                        text: 'Full name',
                        style: TextStyle(
                          color: const Color(0xFFE4E4E4),
                          fontSize: 14.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,

                        ),
                      ),
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          color: const Color(0xFFFF001E),
                          fontSize: 14.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,

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
                            controller: nameController,

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
                                color: const Color(0xFF818181),
                                fontSize: 14.sp,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,

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
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Gender',
                            style: TextStyle(
                              color: const Color(0xFFE4E4E4),
                              fontSize: 14.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: '*',
                            style: TextStyle(
                              color: const Color(0xFFFF001E),
                              fontSize: 14.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 125.w),
                    Text(
                      'User role',
                      style: TextStyle(
                        color: const Color(0xFFE4E4E4),
                        fontSize: 14.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    Container(
                        width: 156.w,
                        height: 48.h,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF282828),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.r)),
                        ),
                        child: Center(
                            child: GenderDropdown(
                                selectedGender: _selectedGender,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedGender = newValue;
                                  });
                                }))
                    ),
                    SizedBox(width: 22.w),
                    Container(
                      width: 156.w,
                      height: 48.h,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF282828),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1)),
                      ),
                      child: Center(
                          child: JobRoleDropdown(
                            selectedJobRole: _selectedJobRole,
                            onChanged: ( newValue) {
                              setState(() {
                                _selectedJobRole = newValue;
                              });
                            }))
                    ),
                  ],
                ),
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  'Email address',
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
                  height: 48.h,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF282828),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.r)),
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
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,

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
                              hintText: 'Enter your email address (optional)',
                              hintStyle: TextStyle(
                                color: const Color(0xFF818181),
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
                  height: 40.h,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => S1()),
                          (Route<dynamic> route) => false,
                    );
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
                        'Save & go to home page',
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
