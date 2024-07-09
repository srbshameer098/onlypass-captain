import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled7/components/profile.dart';

import '../../UI/View/account.dart';


class AdvancedSettingsBottomSheet extends StatefulWidget {
  const AdvancedSettingsBottomSheet({super.key});

  @override
  State<AdvancedSettingsBottomSheet> createState() => _AdvancedSettingsBottomSheetState();
}

class _AdvancedSettingsBottomSheetState extends State<AdvancedSettingsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.w,),
      width: double.infinity.w,
      height: 600.h,
      decoration: BoxDecoration(
        color: Color(0xFF191919),
        border: Border.fromBorderSide(
           BorderSide(color: Color(0xFF111416)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0.w),
            child: Center(
              child: Container(
                width: 44.w,
                height: 3.h,
                decoration: ShapeDecoration(
                  color: Color(0xFF000000),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 32.w,
                  height: 32.h,
                  decoration: ShapeDecoration(
                    color: Color(0xFF282828),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.r)),
                  ),
                  child: Icon(Icons.arrow_back_ios_rounded,color: Colors.white,size: 16,),
                ),
              ),
              Text(
                'Advanced settings',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 32.w,
                height: 32.h,
              ),
            ],
          ),

          SizedBox(
            height: 32.h,
          ),
          Text(
            'Location details',
            style: GoogleFonts.montserrat(
              color: Color(0xFFA3A3A3),
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric( vertical: 24.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InfoKey(keyText: 'Address'),
                      SizedBox(
                        height: 16.h,
                      ),
                      InfoKey(keyText: 'Pin Code'),
                      SizedBox(
                        height: 16.h,
                      ),
                      InfoKey(keyText: 'State'),
                      SizedBox(
                        height: 16.h,
                      ),
                      InfoKey(keyText: 'Country'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InfoValue(ValueText: 'Edarikode, Malappuram'),
                      SizedBox(
                        height: 16.h,
                      ),
                      InfoValue(ValueText: '676501'),
                      SizedBox(
                        height: 16.h,
                      ),
                      InfoValue(ValueText: 'Kerala'),
                      SizedBox(
                        height: 16.h,
                      ),
                      InfoValue(ValueText: 'India'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric( vertical: 0.h),
            child: Text(
              'Payment details',
              style: GoogleFonts.montserrat(
                color: Color(0xFFA3A3A3),
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 24.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InfoKey(keyText: 'Payment type'),
                    SizedBox(
                      height: 16.h,
                    ),
                    InfoKey(keyText: 'Account no.'),
                    SizedBox(
                      height: 16.h,
                    ),
                    InfoKey(keyText: 'IFS Code'),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InfoValue(ValueText: 'Bank account'),
                    SizedBox(
                      height: 16.h,
                    ),
                    InfoValue(ValueText: '6712 5783 1475'),
                    SizedBox(
                      height: 16.h,
                    ),
                    InfoValue(ValueText: 'FB012457'),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(
            height: 40.h,
          ),

          SizedBox(
            height: 56.h,
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Secured data, want to change? ',
                  style: GoogleFonts.montserrat(
                    color: Color(0xFF818181),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: 'Contact us',
                  style: GoogleFonts.montserrat(
                    color: Color(0xFF00FF00),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                    decorationColor: const Color(0xFF00FF00),
                    decorationThickness: 1.w,

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
