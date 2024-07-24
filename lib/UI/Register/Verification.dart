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
  String f = '';
  String c = '';
  String a = '';
  String fi = '';

  @override
  void initState() {
    super.initState();
    _printSharedPreferencesValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                    height: 164.8.h,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            height: 340.h,
            width: double.infinity,
            color: Color(0xff191919),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 27.h,
                ),
                Text(
                  'Enter OTP received',
                  style: GoogleFonts.montserrat(
                    color: const Color(0xFFE4E4E4),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Stack(children: [
                  SizedBox(
                    width: 334.w,
                    child: Text(
                      'A six digit verification code has been sent to  number ',
                      style: GoogleFonts.montserrat(
                        color: const Color(0xFF6F6F70),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 65,
                    top: 21,
                    child: Row(
                      children: [
                        Text(
                          '+91 ${widget.phoneNum} ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Change',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                decoration: TextDecoration.underline,decorationColor: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child: OtpTextField(
                    clearText: true,
                    alignment: FractionalOffset.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    fieldWidth: 45.w,
                    fieldHeight: 45.h,
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
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Didn’t receive the code?  ',
                        style: TextStyle(
                          color: Color(0xFFA3A3A3),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Resend',
                          style: GoogleFonts.montserrat(
                            color: Color(0xFFFEFEFE),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24.h),
                  child: BlocListener<LogInBloc, LogInState>(
                    listener: (context, state) {
                      if (state is LoginblocLoaded) {
                        String tokens = BlocProvider.of<LogInBloc>(context)
                            .logInmodel
                            .acsToken
                            .toString();
                        String facility = BlocProvider.of<LogInBloc>(context)
                            .logInmodel
                            .facilityCode
                            .toString();
                        String customer = BlocProvider.of<LogInBloc>(context)
                            .logInmodel
                            .customerCode
                            .toString();
                        String facilityid = BlocProvider.of<LogInBloc>(context)
                            .logInmodel
                            .facilityId
                            .toString();
                        userinfo(tokens, customer, facility, facilityid);
                        print('Login successful. Token: $tokens');
                        setState(() {
                          loading = false;
                        });
                      }

                      if (state is LoginblocLoading) {
                        setState(() {
                          loading = true;
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
                                phoneNumber: widget.phoneNum.trim(),
                              ));
                          // Fetch the customerCode from SharedPreferences

                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          final customerCode = prefs.getString('customerCode');
                          final facilityCode = prefs.getString('facilityCode');
                          final accessToken = prefs.getString('accessToken');
                          final facilityid = prefs.getString('facilityId');

                          bool facilityId = true;
                          bool customerId = false;
                          f = facilityCode.toString();
                          c = customerCode.toString();
                          a = accessToken.toString();
                          fi = facilityid.toString();
                          if (f == 'true') {
                            facilityId = true;
                          } else {
                            facilityId = false;
                          }
                          if (c == 'true') {
                            customerId = true;
                          } else {
                            customerId = false;
                          }
                          print(
                              '${f},8888888888888888888888888888888888888888888888888');
                          print(
                              '${c},8888888888888888888888888888888888888888888888888');
                          print(
                              '${a},8888888888888888888888888888888888888888888888888');
                          print(
                              '${fi},8888888888888888888888888888888888888888888888888');
                          if (facilityId == true && customerId == true) {
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
                          } else if (facilityId == true &&
                              !customerId == false) {
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
                                        fontSize: 16.sp,
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
    );
  }

  void userinfo(String tokens, String customer, String facility,
      String facilityid) async {
    try {
      // Introduce a delay of 2 seconds
      await Future.delayed(Duration(seconds: 2));

      final SharedPreferences prefs = await SharedPreferences.getInstance();

      // Save the values to SharedPreferences
      await prefs.setString('accessToken', tokens);
      await prefs.setString('customerCode', customer);
      await prefs.setString('facilityCode', facility);
      await prefs.setString('facilityId', facilityid);
      await prefs.setString('phone', widget.phoneNum);

      print('Values saved to SharedPreferences');
    } catch (e) {
      print('Error saving values to SharedPreferences: $e');
    }
  }

  Future<void> _printSharedPreferencesValues() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final accessToken = prefs.getString('accessToken');
      final customerCode = prefs.getString('customerCode');
      final facilityCode = prefs.getString('facilityCode');
      final facilityId = prefs.getString('facilityId');
      final phone = prefs.getString('phone');

      print('accessToken: ${accessToken ?? 'Not found'}');
      print('customerCode: ${customerCode ?? 'Not found'}');
      print('facilityCode: ${facilityCode ?? 'Not found'}');
      print('facilityId: ${facilityId ?? 'Not found'}');
      print('phone: ${phone ?? 'Not found'}');
    } catch (e) {
      print('Error reading values from SharedPreferences: $e');
    }
  }
}
