
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../UI/View/home.dart';
import '../../Utils/utils.dart';

bool loading = false;
final verificationCodeController = TextEditingController();

void showCustomBottomSheet(BuildContext context) {
  showModalBottomSheet(
    isDismissible: false,
    enableDrag: false,
    isScrollControlled: true,useRootNavigator: true,
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, void Function(void Function()) setState) {
          return AnimatedPadding(
            padding: MediaQuery.of(context).viewInsets,
            duration: const Duration(milliseconds: 0),
            child: Container(
              padding: EdgeInsets.all(28.5),
              height: 340.h,
              width: double.infinity,
              color: Colors.grey[900],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enter OTP received',
                    style: TextStyle(
                      color: const Color(0xFFE4E4E4),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 16.h,),
                  Text(
                    'A six digit verification code has been sent to the registered phone number ending with 1234',
                    style: GoogleFonts.montserrat(
                      color: const Color(0xFF6F6F70),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: OtpTextField(
                      // styles: [TextStyle(fontSize: 20.sp)],
                      autoFocus: true,
            
                      clearText: true,
                      alignment: FractionalOffset.topCenter,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      fieldWidth: 45.w,
                      fieldHeight: 45.h,
                      borderWidth: 1,
                      borderRadius: BorderRadius.circular(0),
                      focusedBorderColor: Colors.grey,
                      textStyle: GoogleFonts.montserrat(color: Colors.white,fontSize: 20.sp,),contentPadding: const EdgeInsets.all(10),
                      fillColor: const Color(0xFF282828),
                      filled: true,
                      keyboardType: TextInputType.phone,
                      cursorColor: Colors.white,
                      numberOfFields: 6,
                      enabledBorderColor: Colors.transparent,
                      showFieldAsBox: true,
                      onCodeChanged: (String code) {},
                      onSubmit: (String verificationCodes) {
                        verificationCodeController.text = verificationCodes;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Didn’t receive the code?  ',
                            style: TextStyle(
                              color: Color(0xFFA3A3A3),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Resend',
                              style: GoogleFonts.montserrat(
                                color: Color(0xFFFEFEFE),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
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
                        setState(() {
                          loading = true;
                        });
            
                        try {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (_) => Home(otpBottomSheet: false, welcomeSheet: false, profilebottomsheet: true, adminformBottomSheet: false, Newbusineessbottomsheet: false, )),
                                (Route<dynamic> route) => false,
                          );
                          // await auth.signInWithCredential(credential);
                          // Navigate to the next screen on success
                        } catch (e) {
                          setState(() {
                            loading = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              action: SnackBarAction(
                                label: 'Try again',
                                textColor: Colors.green,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              content: const Text(
                                'Login failed',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.grey[900],
                            ),
                          );
                          Utils().toastMessage(e.toString());
                        }
                      },
                      child: Container(
                        width: 376.w,
                        height: 48.h,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1.r),
                          ),
                        ),
                        child: Center(
                          child: loading
                              ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.black,
                            ),
                          )
                              : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Verify',
                                style: GoogleFonts.montserrat(
                                  color: const Color(0xFF191919),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 12.w),
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
          );
        },
      );
    },
  );
}
