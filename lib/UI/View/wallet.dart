// wallet.dart
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'members.dart';

// app_colors.dart
class AppColors {
  static const Color background = Color(0xFF191919);
  static const Color cardBackground = Color(0xFF282828);
  static const Color balanceColor = Color(0xFF37F840);
  static const Color transferButtonBackground = Color(0xFF313132);
  static const Color transferTextColor = Color(0xFFA3A3A3);
}

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  final NumberFormat _formatter = NumberFormat('#,##,000.00');


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          leading: _buildBackButton(),
          backgroundColor: AppColors.background,
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Wallet',
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [_buildMenuButton()],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBody(),
            SizedBox(
              height: 40.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25.w,
              ),
              child: Text(
                'History',
                style: GoogleFonts.montserrat(
                  color: Color(0xFF818181),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),

            ///-----------Tab Bar  -------------------///

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w,vertical: 24.h),
              child: ButtonsTabBar(
                buttonMargin: EdgeInsets.only(right: 32),
                splashColor: Colors.white,
                height: 30.h,
                elevation: 0,
                contentPadding:
                EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.w),
                radius: 0,
                borderWidth: 0.9,
                borderColor: Color(0xFF282828),
                unselectedBorderColor: Color(0xFF4D4D4D),
                backgroundColor: Colors.white,
                unselectedBackgroundColor: Colors.transparent,
                labelStyle: GoogleFonts.montserrat(
                    color: Color(0xFF191919),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    height: 0),
                unselectedLabelStyle: GoogleFonts.montserrat(
                    color: Color(0xFF818181),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    height: 0),
                tabs: [
                  Tab(
                    height: 30.h,
                    text: 'All',
                  ),
                  Tab(
                    height: 30.h,
                    text: 'Onlypass',
                  ),
                  Tab(
                    height: 30.h,
                    text: 'Offline',
                  ),
                ],
              ),
            ),

            Expanded(
              child: TabBarView(children: [
                Container(
                  height: 100.h * members.length,
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: ListView.separated(
                    itemCount: members.length,
                    itemBuilder: (context, index) {
                      final messages = members[index];
                      return ListTile(
                        leading: Container(
                          width: 44.w,
                          height: 44.h,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/icons/account.png"),
                              fit: BoxFit.fill,
                            ),
                            shape: OvalBorder(),
                          ),
                        ),
                        title: Text(messages['member']!,
                            style: TextStyle(color: Colors.white)),
                        subtitle: Text('${messages['Description']!} ${messages['amount']!}'),
                        trailing: Text(
                          messages['amount']!,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: messages['status'] == 'Due'
                                ? Color(0xffFF4D4D)
                                : messages['status'] == 'Expiring'
                                ? Color(0xffF1BE0A)
                                : Color(0xff00FF00),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      height: 20.h,
                      child: Divider(color: Color(0xFF282828),),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Center(
                    child: Text(
                      "No more data available",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        color: Color(0xFF818181),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Center(
                    child: Text(
                      "No more data available",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        color: Color(0xFF818181),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return GestureDetector(
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
    );
  }

  Widget _buildMenuButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 5.w),
      child: Center(
        child: Image.asset(
          'assets/icons/fi-rr-menu-dots-vertical.png',
          height: 24.h,
          width: 26.w,
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        _buildWalletCard(),
      ],
    );
  }

  Widget _buildWalletCard() {
    return Padding(
      padding: EdgeInsets.all(20.0.w),
      child: Container(
        width: double.infinity,
        height: 169.h,
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(3.r),
        ),
        child: Stack(
          children: [
            _buildWalletIcon(),
            _buildWalletInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildWalletIcon() {
    return Positioned(
      top: -8.h,
      left: 293.w,
      child: Transform.rotate(
        angle: -0.44,
        child: Opacity(
          opacity: 0.3,
          child: ClipRRect(
            child: Image.asset(
              'assets/icons/Wallet.png',
              width: 100.w,
              height: 100.h,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWalletInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildAvailableBalanceText(),
        _buildBalanceRow(),
        SizedBox(
          width: 20.w,
        ),
        _buildTransferButton(),
      ],
    );
  }

  Widget _buildAvailableBalanceText() {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, top: 20.h),
      child: Text(
        'Available Balance',
        style: GoogleFonts.montserrat(
          color: Colors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildBalanceRow() {
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '₹ ',
              style: TextStyle(
                color: AppColors.balanceColor,
                fontSize: 40.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: _formatter.format(5350.35).split('.')[0],
              style: GoogleFonts.montserrat(
                color: AppColors.balanceColor,
                fontSize: 40.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.32,
              ),
            ),
            TextSpan(
              text: '.${_formatter.format(5350.35).split('.')[1]}',
              style: GoogleFonts.montserrat(
                color: AppColors.balanceColor,
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.32,
                // baselineOffset: BaselineOffset.subscript,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransferButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 12),
      width: double.infinity,
      height: 52.h,
      decoration: BoxDecoration(
        color: AppColors.transferButtonBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(3.r),
          bottomRight: Radius.circular(3.r),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTransferText(),
          _buildTransferButtonContent(),
        ],
      ),
    );
  }

  Widget _buildTransferText() {
    return Row(
      children: [
        SizedBox(width: 6.w,),
        Text(
          'Transferrable amount',
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            color: AppColors.transferTextColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            letterSpacing: -0.32,
          ),
        ),
        SizedBox(
          width: 4.w,
        ),
        Text(
          _formatter.format(5000.00),
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            height: 0.11.h,
            letterSpacing: -0.32,
          ),
        ),
      ],
    );
  }
  Widget _buildTransferButtonContent() {
    return Container(
      height: 32.h,
      padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 6.h),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.30.w,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: Color(0x7FFEFEFF),
          ),
          borderRadius: BorderRadius.circular(1),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x33000000),
            blurRadius: 24,
            offset: Offset(0, 4),
            spreadRadius: -1,
          )
        ],
      ),
      child: Center(
        child: Text(
          'Transfer now',
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            color: Color(0xFF191919),
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            height: 0.11.h,
            letterSpacing: -0.32,
          ),
        ),
      ),
    );
  }
}
// final members = [
//   {
//     'member': 'Divya Mohanan',
//     'Description': 'Access granted for Onlypass member',
//     'amount': '750',
//     'status': 'Due',
//     'date': '24/05/24',
//   },
//   {
//     'member': 'Sharon Varghese',
//     'Description': 'Access granted for Onlypass member',
//     'amount': '4000.50',
//     'status': 'Expiring',
//     'date': '20/05/24',
//   },
//   {
//     'member': 'Akhilesh Chandran',
//     'Description': 'Access granted for Onlypass member',
//     'amount': '750.00',
//     'status': 'Due',
//     'date': '15/05/24',
//   },
//   {
//     'member': 'GymFit Club',
//     'Description': 'Access granted for Onlypass member',
//     'amount': '7000.00',
//     'status': 'Due',
//     'date': '10/05/24',
//   },
//   {
//     'member': 'Divya Mohanan',
//     'Description': 'Access granted for Onlypass member',
//     'amount': '600.26',
//     'status': 'Due',
//     'date': '24/05/24',
//   },
//   {
//     'member': 'Sharon Varghese',
//     'Description': 'Access granted for Onlypass member',
//     'amount': '7000',
//     'status': 'Expiring',
//     'date': '20/05/24',
//   },
//   {
//     'member': 'Akhilesh Chandran',
//     'Description': 'Access granted for Onlypass member',
//     'amount': '750.00',
//     'status': 'Due',
//     'date': '15/05/24',
//   },
//   {
//     'member': 'GymFit Club',
//     'Description': 'Access granted for Onlypass member',
//     'amount': '7000.00',
//     'status': 'Due',
//     'date': '10/05/24',
//   },
//
//   // Add the rest of the transactions here...
// ];