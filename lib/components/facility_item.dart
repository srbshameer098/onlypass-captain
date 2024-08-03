import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';
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
          radius: 34.r,
          child: SvgPicture.asset(icon,
            width:28.w,height:28.h,
           ),
    // Image.asset(
          //   icon,
          //   height: 28.h,
          //   width: 28.w,
          // ),
        ),
        SizedBox(
          height: 12.h,
        ),
        Text(
          text,
          style: GoogleFonts.montserrat(
            color: const Color(0xFFE4E4E4),
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}