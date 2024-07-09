import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled7/components/profile.dart';


class MembershipPlanBottomSheet extends StatefulWidget {
  const MembershipPlanBottomSheet({super.key});

  @override
  State<MembershipPlanBottomSheet> createState() => _MembershipPlanBottomSheetState();
}

class _MembershipPlanBottomSheetState extends State<MembershipPlanBottomSheet> {
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
      child: SingleChildScrollView(
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
                  'Membership plans',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
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
                    child: Icon(CupertinoIcons.square_pencil,color: Colors.white,size: 16,),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 32.h,
            ),
            PlanItems(title: 'Admission fee', rate: '1500',),
            PlanItems(title: 'Daily access', rate: '150',),
            PlanItems(title: '1 Month plan', rate: '2500',),
            PlanItems(title: '3 Month plan', rate: '6500',),
            PlanItems(title: '6 Month plan', rate: '11000',),
            PlanItems(title: '1 Year plan', rate: '18000',),


          ],
        ),
      ),
    );
  }
}
class PlanItems extends StatelessWidget {
  final String title;
  final String rate;

  const PlanItems({
    required this.title,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Card(
        color: Color(0xFF191919),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.w, color: Color(0xFF282828)),
          borderRadius: BorderRadius.circular(0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 21.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text(
                title,
                style: GoogleFonts.montserrat(
                  color: Color(0xFFE4E4E4),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                width: 96.w,
                height: 32.h,
                decoration: ShapeDecoration(
                  color: Color(0xFF282828),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
                ),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 8.w,),
                      Text(
                        '₹',
                        style: TextStyle(
                          color: Color(0xFF818181),
                          fontSize: 14.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      SizedBox(width: 7.w,),
                      Text(
                        '$rate.00',
                        style: GoogleFonts.montserrat(
                          color: Color(0xFFE4E4E4),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}