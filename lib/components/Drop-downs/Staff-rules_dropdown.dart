import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class JobRoleDropdown extends StatelessWidget {
  final String selectedJobRole;
  final ValueChanged onChanged;

  JobRoleDropdown({required this.selectedJobRole, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 11.w,vertical: 14.h),
      child: DropdownButton<String>(

        style: const TextStyle(

          overflow: TextOverflow.ellipsis,

          color: Color(0xffffffff),
          fontSize: 16,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
        ),
        iconEnabledColor:const Color(0xFFFEFEFE) ,
        underline: const SizedBox(),
        dropdownColor:const Color(0xFF282828) ,
        icon: SvgPicture.asset(
          'assets/icons/down arrow.svg',
          width: 7.17.w,
          height: 7.17.h,
        ),
        isExpanded: true,

        value: selectedJobRole,
        onChanged: onChanged,
        items: <String>[
          'Trainer',
          'Customer service',
          'Instructor/Coach',
          'Manager',
          'Security guard',
          'Nutritionist'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}