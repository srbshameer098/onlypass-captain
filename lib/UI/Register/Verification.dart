import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Bloc/LogIn/log_in_bloc.dart';
import '../../Utils/utils.dart';
import '../View/home.dart';

class Verification extends StatefulWidget {
  final String phoneNum;

  const Verification({
    super.key,
    required this.phoneNum,
  });

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  bool loading = false;
  final auth = FirebaseAuth.instance;
  final verificationCodeController = TextEditingController();
  String f ='';
  String c ='';
  String a ='';
  String fi ='';
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: 0.h,
                    child: Image.asset(
                      'assets/images/imgLog.png',
                      width: 430.w,
                      height: 880.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 86.h,
                    child: Image.asset(
                      'assets/images/captianLogo.png',
                      alignment: Alignment.center,
                      width: 143.w,
                      height: 164.8.h,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(28.5),
              height: 343.h,
              width: double.infinity,
              color: Colors.grey[900],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enter OTP received',
                    style: GoogleFonts.montserrat(
                      color: const Color(0xFFE4E4E4),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'A verification code has been sent to +91 ${widget.phoneNum}',
                    style: GoogleFonts.montserrat(
                      color: const Color(0xFF6F6F70),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: OtpTextField(
                      clearText: true,
                      alignment: FractionalOffset.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      fieldWidth: 48.w,
                      fieldHeight: 48.h,
                      borderWidth: 1,
                      borderRadius: BorderRadius.circular(0),
                      focusedBorderColor: Colors.grey,
                      textStyle: GoogleFonts.montserrat(color: Colors.white),
                      fillColor: Color(0xFF282828),
                      filled: true,
                      keyboardType: TextInputType.number,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Enter phone number again',
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
                    child: BlocListener<LogInBloc, LogInState>(
                      listener: (context, state) {
                        if (state is LoginblocLoading) {
                          setState(() {
                            loading = true;
                          });
                        }

                        if (state is LoginblocLoaded) {

                          String tokens = state.response.acsToken.toString();
                          String facility = state.response.facilityCode.toString();
                          String customer = state.response.customerCode.toString();
                          String facilityid =state.response.facilityId.toString();
                          userinfo(tokens, customer, facility, facilityid);
                          print('Login successful. Token: $tokens');
                          setState(() {
                            loading = false;

                          });
                        }

                        if (state is LoginblocError) {
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
                              content: Text(
                                'Login failed',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.grey[900],
                            ),
                          );
                          Utils().toastMessage(e.toString());
                        }
                      },
                      child: GestureDetector(
                        onTap: () async {
                          setState(() {
                            loading = true;
                          });

                          try {
                            context.read<LogInBloc>().add(FetchLogin(
                              phoneNumber: widget.phoneNum.toString(),
                            ));
                            // Fetch the customerCode from SharedPreferences

                            final SharedPreferences prefs = await SharedPreferences.getInstance();
                            final customerCode = prefs.getString('customerCode');
                            final facilityCode = prefs.getString('facilityCode');
                            final accessToken = prefs.getString('accessToken');
                            final facilityid = prefs.getString('facilityId');

                            bool facilityId =  true ;
                            bool customerId =  false;
                            f = facilityCode.toString();
                            c = customerCode.toString();
                            a = accessToken.toString();
                            fi = facilityid.toString();
                            if (f == 'true'){
                              facilityId = true;
                            }else{
                              facilityId = false;
                            }
                            if (c == 'true'){
                              customerId = true;
                            }else{
                              customerId = false;
                            }
                            // print(prefs.getString("facilityCode"));
                            // print(prefs.getString('accessToken'));
                            print('${f},8888888888888888888888888888888888888888888888888');
                            print('${c},8888888888888888888888888888888888888888888888888');
                            print('${a},8888888888888888888888888888888888888888888888888');
                            print('${fi},8888888888888888888888888888888888888888888888888');
                            if (facilityId ==true  && customerId ==true ) {
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (_) => const Home(
                                    otpBottomSheet: false,
                                    welcomeSheet: false,
                                    profilebottomsheet: false,
                                    adminformBottomSheet: false,
                                    Newbusineessbottomsheet: false,
                                  ),
                                ),
                                    (Route<dynamic> route) => false,
                              );
                            } else if (facilityId == true && !customerId == false) {
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (_) => const Home(
                                    otpBottomSheet: false,
                                    welcomeSheet: false,
                                    profilebottomsheet: false,
                                    adminformBottomSheet: true,
                                    Newbusineessbottomsheet: false,
                                  ),
                                ),
                                    (Route<dynamic> route) => false,
                              );
                            } else {
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (_) => const Home(
                                    otpBottomSheet: false,
                                    welcomeSheet: true,
                                    profilebottomsheet: false,
                                    adminformBottomSheet: false,
                                    Newbusineessbottomsheet: false,
                                  ),
                                ),
                                    (Route<dynamic> route) => false,
                              );
                            }
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
                                content: Text(
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void userinfo(String tokens, String customer, String facility,String facilityid) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Save the values to SharedPreferences
    await prefs.setString('accessToken', tokens);
    await prefs.setString('customerCode', customer);
    await prefs.setString('facilityCode', facility);
    prefs.setString('facilityId', facilityid);
  }

}