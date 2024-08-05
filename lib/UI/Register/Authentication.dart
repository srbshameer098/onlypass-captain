import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled7/Repository/Model_Class/Login_model.dart';
import 'package:untitled7/UI/Register/Verification.dart';
import 'package:untitled7/UI/Register/verify.dart';
import 'package:untitled7/Bloc/LogIn/log_in_bloc.dart';
import 'package:untitled7/UI/View/event_confirm.dart';
import 'package:untitled7/Utils/utils.dart';

import '../../components/Bottom Sheets/Admin customer-id form.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool loading = false;
  final auth = FirebaseAuth.instance;
  final phoneNumberController = TextEditingController();

  Future<void> storePhoneNumber(String phoneNumber) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('phoneNumber', phoneNumber);
  }

  bool isValidPhoneNumber(String phoneNumber) {
    // The masked input formatter already formats the number as '#### #### ##'
    // Check if the phone number contains exactly 10 digits excluding spaces
    return phoneNumber.replaceAll(' ', '').length == 10;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191919),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: 0.h,
                  child: Image.asset(
                    'assets/images/imgLog.png',
                    width: 390.w,
                    height: 800.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 125.h,
                  child: Image.asset(
                    'assets/images/captianLogo.png',
                    alignment: Alignment.center,
                    width: 143.w,
                    height: 164.h,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            height: 340.h,
            width: double.infinity.w,
            color: const Color(0xff191919),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32.h),
                Text(
                  'Phone number for verification',
                  style: TextStyle(
                    color: const Color(0xFFE4E4E4),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width.w,
                    child: Text(
                      maxLines: 2,
                      "Enter your phone number for a quick OTP verification. We'll get you logged in right away!",
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: const Color(0xFF6F6F70),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    height: 56.h,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF282828),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.r),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/icons/indflag.png',
                          height: 16.sp,
                        ),
                        Text(
                          '+91',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.6,
                          ),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Color(0xffFFFFFF),
                        ),
                        VerticalDivider(
                          color: const Color(0xFF191919),
                          width: 1.5,
                          thickness: 1,
                          indent: 8.h,
                          endIndent: 8.h,
                        ),
                        SizedBox(width: 5.w),
                        SizedBox(

                          width: 204.w,
                          child: TextFormField(
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.phone,
                            controller: phoneNumberController,
                            inputFormatters: [
                              MaskedInputFormatter('#### #### ##'),
                            ],
                            style: TextStyle(
                              color: const Color(0xFFFEFEFE),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 4,
                            ),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintText: '0000 00 0000',
                              hintStyle: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: const Color(0xFF6F6F70),
                                fontSize: 20.sp,
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
                Padding(
                  padding: EdgeInsets.only(top: 24.h),
                  child: GestureDetector(
                    onTap: () async {
                      String formattedNumber = phoneNumberController.text.replaceAll(' ', '');
                      if (phoneNumberController.text.isEmpty) {
                        Utils().toastMessage('Enter Mobile Number');
                      } else if (!isValidPhoneNumber(formattedNumber)) {
                        Utils().toastMessage('Enter Valid Mobile Number');
                      } else {
                        setState(() {
                          loading = true;
                        });

                        // await storePhoneNumber(phoneNumberController.text);

                        // Uncomment the Firebase phone authentication lines below to use
                        //  auth.verifyPhoneNumber(
                        //   phoneNumber: '+91${formattedNumber}',
                        //   verificationCompleted: (_) {
                        //     setState(() {
                        //       loading = false;
                        //     });
                        //   },
                        //   verificationFailed: (e) {
                        //     setState(() {
                        //       loading = false;
                        //     });
                        //     Utils().toastMessage(e.toString());
                        //   },
                        //   codeSent: (String verificationId, int? token) {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => Verification(
                        //           phoneNum: formattedNumber,
                        //           verificationId: verificationId,
                        //         ),
                        //       ),
                        //     );
                        //     setState(() {
                        //       loading = false;
                        //     });
                        //   },
                        //   codeAutoRetrievalTimeout: (e) {
                        //     Utils().toastMessage(e.toString());
                        //     setState(() {
                        //       loading = false;
                        //     });
                        //   },
                        // );

                        Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Verification(
                                      phoneNum: formattedNumber,
                                      verificationId: 'verificationId',
                                    ),
                                  ),
                                );

                      }
                    },
                    child: Container(
                      height: 48.h,
                      width: MediaQuery.of(context).size.width.w,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFefefe),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1),
                        ),
                      ),
                      child: Center(
                        child: loading
                            ? const CircularProgressIndicator(
                          color: Color(0xff282828),
                        )
                            : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Continue',
                              style: GoogleFonts.montserrat(
                                color: const Color(0xFF191919),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            const Icon(Icons.east_rounded),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
