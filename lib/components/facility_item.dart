import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class FacilityItem extends StatelessWidget {
  final String icon;
  final String text;

  const FacilityItem({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        CircleAvatar(
          backgroundColor: const Color(0xFF272727),
          radius: 35.r,
          child: Image.asset(
            icon,
            height: 28.h,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          text,
          style: GoogleFonts.montserrat(
            color: const Color(0xfffefefe),
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}