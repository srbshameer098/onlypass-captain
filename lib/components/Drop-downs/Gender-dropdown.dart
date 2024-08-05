import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GenderDropdown extends StatelessWidget {
  final String selectedGender;
  final ValueChanged onChanged;

  GenderDropdown({required this.selectedGender, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 14.h),
      child: DropdownButton<String>(
        style: const TextStyle(
          color: Color(0xffffffff),
          fontSize: 16,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
        ),
        dropdownColor: Color(0xFF282828),
        iconEnabledColor: Color(0xFFFEFEFE),
        underline: SizedBox(),
        icon: SvgPicture.asset(
          'assets/icons/down arrow.svg',
          width: 7.17.w,
          height: 7.17.h,
        ),
        isExpanded: true,
        value: selectedGender,
        onChanged: onChanged,
        items: <String>['Male', 'Female']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
