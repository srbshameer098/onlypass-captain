import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class GenderDropdown extends StatelessWidget {
  final String selectedGender;
  final ValueChanged onChanged;

  GenderDropdown({required this.selectedGender, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 11.w,vertical: 14.h),
      child: DropdownButton<String>(
        style: const TextStyle(
          color: Color(0xffffffff),
          fontSize: 16,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
        ),
        iconEnabledColor:Color(0xFFFEFEFE) ,
        underline: SizedBox(),
        dropdownColor:Color(0xFF282828) ,
        icon: Icon(Icons.keyboard_arrow_down_outlined),
        isExpanded: true,
        value: selectedGender,
        onChanged: onChanged,
        items: <String>['Male', 'Female'].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}