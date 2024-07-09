import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomRadioButton extends StatefulWidget {
  final String text;
  final bool isSelected;
  final Function onSelect;
  final TextStyle fontStyle;
  final String description;

  const CustomRadioButton({super.key,
    required this.text,
    required this.isSelected,
    required this.onSelect,
    required this.fontStyle,
    required this.description,
  });

  @override
  _CustomRadioButtonState createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onSelect(widget.text),
      child: Container(
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: widget.isSelected ? Color(0xFFFEFEFE) : Color(0xFF282828),
          borderRadius: BorderRadius.circular(1.0.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.isSelected
                    ? Container(
                        width: 12.w,
                        height: 12.h,
                        decoration: ShapeDecoration(
                          shape: OvalBorder(
                            side: BorderSide(
                                width: 3.w, color: Color(0xFF00FF00)),
                          ),
                        ),
                      )
                    : Icon(
                        Icons.circle_outlined,
                        color: Color(0xFFFEFEFE),
                        size: 12.sp,
                      ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  widget.text,
                  style: widget.fontStyle,
                  // style: GoogleFonts.montserrat(
                  //   fontSize: 14.sp,
                  //   color: widget.isSelected ? Colors.black : Colors.grey,
                  // ),
                ),
              ],
            ),
            Container(

              child: widget.description.isEmpty ?
                  SizedBox():
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Text(
                  widget.description,
                  style: GoogleFonts.montserrat(
                    color: widget.isSelected ? Color(0xFF818181) : Color(0xFFD9D9D9),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
