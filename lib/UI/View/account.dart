import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled7/UI/View/wallet.dart';

import 'package:untitled7/components/Bottom%20Sheets/adv.settings_account.dart';

import '../../components/Bottom Sheets/membership_plan_sheet.dart';
import '../../components/Bottom Sheets/opening_hours.dart';
import 'members.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

int _currentIndex = 0;

Map<String, dynamic> _information = {
  'Facility name': 'GymFit Fitness Club',
  'Gender': 'Male, Female',
  'Email address': 'gymfitclub@gmail.com',
  'Website': 'www.gymfitclub.in',
};
List info = ['Facility name', 'Gender', 'Email address', 'Website'];

bool _isSelected1 = true;
bool _isSelected2 = false;

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.only(left: 25.w, top: 10.h, bottom: 10.h),
            child: Container(
              width: 37.59.w,
              height: 37.59.h,
              decoration: ShapeDecoration(
                color: AppColors.cardBackground,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ),
        backgroundColor: AppColors.background.withOpacity(0.0),
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        forceMaterialTransparency: false,
        title: Text(
          'Business Profile',
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0, -1),
                end: Alignment(0, 1),
                colors: [Color(0xFF1F1F1F), Color(0xFF191919)],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Opacity(
                      opacity: 0.5,
                      child: CarouselSlider.builder(
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            Container(
                          width: double.infinity,
                          height: 280.h,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                "assets/images/imgym.png",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          // child: BackdropFilter(
                          //   filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          //   child: Container(
                          //     decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
                          //   ),
                          // ),
                        ),
                        options: CarouselOptions(
                          viewportFraction: 1.0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                          enlargeCenterPage: false,
                          enableInfiniteScroll: true,
                          aspectRatio: 400 / 64,
                          height: 280.h,
                        ),
                      ),
                    ),
                    // Container(
                    //   width: double.infinity.w,
                    //   height: 280.h,
                    //   decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
                    // ),
                    Positioned(
                      left: 195.w,
                      // right: 195.w,
                      top: 265.h,
                      child: Center(
                        child: DotsIndicator(
                          dotsCount: 3,
                          position: _currentIndex,
                          decorator: DotsDecorator(
                            activeColor: Colors.white,
                            color: Color(0xFF5D5D5D),
                            spacing: EdgeInsets.all(2.w),
                            activeSize: Size(10, 8),
                            size: Size(9, 4),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 40.h, bottom: 32.h, left: 25.w, right: 25.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 72.w,
                        height: 72.h,
                        decoration: ShapeDecoration(
                          color: Color(0xFF272727),
                          shape: OvalBorder(
                            side: BorderSide(width: 1.w, color: Color(0xFFE4E4E4)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 24.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'GymFit Fitnesss Club',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Fitness Club  ',
                                  style: GoogleFonts.montserrat(
                                    color: Color(0xFF6F6F70),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: '|  ',
                                  style: GoogleFonts.montserrat(
                                    color: Color(0xFF6F6F70),
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Male, Female',
                                  style: GoogleFonts.montserrat(
                                    color: Color(0xFF6F6F70),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
                  child: Container(
                    width: double.infinity,
                    height: 86.h,
                    decoration: BoxDecoration(color: Color(0xFF282828)),
                    padding: EdgeInsets.all(14.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Ratings & reviews',
                              style: GoogleFonts.montserrat(
                                color: Color(0xFF6F6F70),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: 260.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '4.3',
                                    style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 81.43.w,
                                    height: 14.h,
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: 15.w,
                                          height: 14.h,
                                          decoration: ShapeDecoration(
                                            color: Color(0xFF00FF00),
                                            shape: StarBorder(
                                              points: 5,
                                              innerRadiusRatio: 0.49,
                                              pointRounding: 0,
                                              valleyRounding: 0,
                                              rotation: 0,
                                              squash: 0,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 16.07.w,
                                          top: 0.h,
                                          child: Container(
                                            width: 16.15.w,
                                            height: 14.h,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFF00FF00),
                                              shape: StarBorder(
                                                points: 5,
                                                innerRadiusRatio: 0.49,
                                                pointRounding: 0,
                                                valleyRounding: 0,
                                                rotation: 0,
                                                squash: 0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 50.36.w,
                                          top: 0.h,
                                          child: Container(
                                            width: 15.w,
                                            height: 14.h,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFF00FF00),
                                              shape: StarBorder(
                                                points: 5,
                                                innerRadiusRatio: 0.49,
                                                pointRounding: 0,
                                                valleyRounding: 0,
                                                rotation: 0,
                                                squash: 0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 33.21.w,
                                          top: 0.h,
                                          child: Container(
                                            width: 16.15.w,
                                            height: 14.h,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFF00FF00),
                                              shape: StarBorder(
                                                points: 5,
                                                innerRadiusRatio: 0.49,
                                                pointRounding: 0,
                                                valleyRounding: 0,
                                                rotation: 0,
                                                squash: 0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 66.43.w,
                                          top: 0.h,
                                          child: Container(
                                            width: 15.w,
                                            height: 14.h,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFFE4E4E4),
                                              shape: StarBorder(
                                                points: 5,
                                                innerRadiusRatio: 0.49,
                                                pointRounding: 0,
                                                valleyRounding: 0,
                                                rotation: 0,
                                                squash: 0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    'Based 53 reviews',
                                    style: GoogleFonts.montserrat(
                                      color: Color(0xFF6F6F70),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                            size: 18.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => const Members()));
                          },
                          child: Container(
                            width: 180.w,
                            height: 86.h,
                            decoration:
                                const BoxDecoration(color: Color(0xFF282828)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 13.w, vertical: 14.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Members',
                                  style: GoogleFonts.montserrat(
                                    color: Color(0xFF6F6F70),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '259',
                                      style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    Text(
                                      '(56 active)',
                                      style: GoogleFonts.montserrat(
                                        color: Color(0xFFFEFEFE),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => const Wallet()));
                          },
                          child: Container(
                            width: 180.w,
                            height: 86.h,
                            decoration: BoxDecoration(color: Color(0xFF282828)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 13.w, vertical: 14.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Wallet',
                                  style: GoogleFonts.montserrat(
                                    color: Color(0xFF6F6F70),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '₹ 5350 .',
                                      style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    Text(
                                      '35',
                                      style: GoogleFonts.montserrat(
                                        color: Color(0xFFFEFEFE),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(25.w),
                  child: Text(
                    'Basic information',
                    style: GoogleFonts.montserrat(
                      color: Color(0xFFA3A3A3),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InfoKey(keyText: 'Facility name'),
                            SizedBox(
                              height: 16.h,
                            ),
                            InfoKey(keyText: 'Gender'),
                            SizedBox(
                              height: 16.h,
                            ),
                            InfoKey(keyText: 'Email address'),
                            SizedBox(
                              height: 16.h,
                            ),
                            InfoKey(keyText: 'Website'),
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
                            InfoValue(ValueText: 'GymFit Fitness Club'),
                            SizedBox(
                              height: 16.h,
                            ),
                            InfoValue(ValueText: 'Male, Female'),
                            SizedBox(
                              height: 16.h,
                            ),
                            InfoValue(ValueText: 'gymfitclub@gmail.com'),
                            SizedBox(
                              height: 16.h,
                            ),
                            InfoValue(ValueText: 'www.gymfitclub.in'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 24.h),
                  child: Text(
                    'Contact person',
                    style: GoogleFonts.montserrat(
                      color: Color(0xFFA3A3A3),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InfoKey(keyText: 'Name'),
                            SizedBox(
                              height: 16.h,
                            ),
                            InfoKey(keyText: 'Phone number')
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
                            InfoValue(ValueText: 'Bijoy Krishna'),
                            SizedBox(
                              height: 16.h,
                            ),
                            InfoValue(ValueText: '+91 9895 00 8900'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                GymFitSettingsList()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InfoKey extends StatelessWidget {
  final String keyText;

  const InfoKey({required this.keyText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          keyText,
          style: GoogleFonts.montserrat(
            color: Color(0xFF6F6F70),
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class InfoValue extends StatelessWidget {
  final String valueText;

  const InfoValue({required String ValueText}) : valueText = ValueText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          valueText,
          style: GoogleFonts.montserrat(
            color: Color(0xFFFEFEFE),
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class GymFitSettingsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: (){
              showModalBottomSheet(
                context: context,
                isDismissible: false,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return const AdvancedSettingsBottomSheet();
                },
              );
            },
            child: SettingsItem(
              icon: Icons.settings,
              title: 'Advanced settings',
              subtitle: 'Location and payment details',
            ),
          ),
          GestureDetector(
            onTap: (){
              showModalBottomSheet(
                context: context,
                isDismissible: true,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return const OpeningHours();
                },
              );
            },
            child: SettingsItem(
              icon: Icons.access_time,
              title: 'Opening hours',
              subtitle: 'Manage your business timings',
            ),
          ),
          GestureDetector(
            onTap: (){
              showModalBottomSheet(
                context: context,
                isDismissible: false,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return const MembershipPlanBottomSheet();
                },
              );
            },
            child: SettingsItem(
              icon: Icons.assignment,
              title: 'Membership plans',
              subtitle: 'Manage your packages and prices',
            ),
          ),
          GestureDetector(
            onTap: (){
              showModalBottomSheet(
                context: context,
                isDismissible: false,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return const MembershipPlanBottomSheet();
                },
              );
            },
            child: SettingsItem(
              icon: Icons.fitness_center,
              title: 'Amenities & equipment',
              subtitle: 'Manage amenities or equipment list',
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const SettingsItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Card(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.w, color: Color(0xFF282828)),
          borderRadius: BorderRadius.circular(0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Row(
            children: [
              Icon(
                icon,
                color: Color(0xFFE4E4E4),
                size: 25.sp,
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.montserrat(
                        color: Color(0xFFE4E4E4),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      subtitle,
                      style: GoogleFonts.montserrat(
                        color: Color(0xFF6F6F70),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Color(0xFFE4E4E4),
                size: 18.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
