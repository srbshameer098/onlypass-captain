import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled7/UI/View/wallet.dart';

class Members extends StatelessWidget {
  const Members({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.background,
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
          backgroundColor: Color(0xFF1F1F1F),
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Members',
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [_buildMenuButton()],
        ),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 25.w,vertical: 40.h),
                  child: Container(
                    width: double.infinity,
                    height: 48,
                    padding: EdgeInsets.all(2),
                    decoration: ShapeDecoration(
                      color: Color(0xFF282828),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1)),
                    ),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      textInputAction:TextInputAction.search,
                      cursorColor: Colors.white,
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                          hintStyle: GoogleFonts.montserrat(
                            color: Color(0xFF6F6F70),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 0.08,
                            letterSpacing: -0.32,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 28,
                          )),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'All members list',
                        style: GoogleFonts.montserrat(
                          color: const Color(0xFF818181),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (_) => const CreateEvent()));
                        },
                        child: Text(
                          'add new',
                          style: GoogleFonts.montserrat(
                              color: const Color(0xFFFEFEFE),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                              decorationThickness: 1.w),
                        ),
                      )
                    ],
                  ),
                ),

                ///-----------Tab Bar  -------------------///

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 24.h),
                  child: ButtonsTabBar(
                    buttonMargin: EdgeInsets.only(right: 32.w),
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
                    ),
                    unselectedLabelStyle: GoogleFonts.montserrat(
                        color: Color(0xFF818181),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,),
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
                      height: 100.h * members.length.h,
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: ListView.separated(
                        itemCount: members.length,
                        itemBuilder: (context, index) {
                          final data = members[index];
                          return ListTile(
                            leading: Container(
                              width: 44.w,
                              height: 44.h,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/icons/account.png"),
                                  fit: BoxFit.fill,
                                ),
                                shape: OvalBorder(),
                              ),
                            ),
                            title: Text(data['member']!,
                                style: TextStyle(color: Colors.white)),
                            subtitle: Text(
                              data['Description']!,
                              style: TextStyle(
                                  color: data['status'] == 'Due'
                                          ? Color(0xffFF4D4D)
                                      : data['status'] == 'Expiring'
                                          ? Color(0xffF1BE0A)
                                      : Colors.grey[700]),
                            ),
                            trailing: data['status'] == 'Due'
                                ? Container(
                                    width: 73.w,
                                    height: 32.h,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 0.30.h,
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
                                        'Renew',
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
                                  )
                                : data['status'] == 'Expiring'
                                    ? Container(
                                        width: 73.w,
                                        height: 32.h,
                                        padding:  EdgeInsets.only(
                                            top: 6.h, left: 12.w, right: 12.w, bottom: 5.h),
                                        decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                              width: 0.30.w,
                                              strokeAlign:
                                                  BorderSide.strokeAlignCenter,
                                              color: Color(0x7FFEFEFF),
                                            ),
                                            borderRadius: BorderRadius.circular(1.r),
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
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Renew',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.montserrat(
                                                color: Color(0xFF191919),
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500,
                                                height: 0.11.h,
                                                letterSpacing: -0.32,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(
                                        width: 73.w,
                                        height: 32.h,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF191916),
                                          borderRadius: BorderRadius.circular(1.r),
                                          border: Border.all(
                                            width: 1.w,
                                            color: Color(0xFF818181),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            data['status'] == 'Expiring'
                                                ? 'Renew'
                                                : data['status'] == 'Due'
                                                    ? 'Renew'
                                                    : 'Hold',
                                            style: GoogleFonts.montserrat(
                                              color: Color(0xFFFEFEFE),
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
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
                // ListView.separated(
                //   itemCount: transactionHistory.length,
                //   itemBuilder: (context, index) {
                //     final transaction = transactionHistory[index];
                //     return ListTile(
                //       leading: CircleAvatar(
                //         backgroundColor: Colors.grey[800],
                //         child: Text(transaction['member']![0],
                //             style: TextStyle(color: Colors.white54)),
                //       ),
                //       title: Text(transaction['member']!,
                //           style: TextStyle(color: Colors.white)),
                //       subtitle: Text(transaction['transaction']!),
                //       trailing: Text(
                //         transaction['amount']!,
                //         style: TextStyle(
                //           color: transaction['amount'] == 'Due'
                //               ? Color(0xffFF4D4D)
                //               : transaction['amount'] == 'Expiring'
                //                   ? Color(0xffF1BE0A)
                //                   : Color(0xff00FF00),
                //         ),
                //       ),
                //     );
                //   },
                //   separatorBuilder: (context, index) => SizedBox(
                //     height: 20,
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
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

final members = [
  {
    'member': 'Divya Mohanan',
    'Description': 'Access granted for Onlypass member',
    'amount': '750',
    'status': 'renewed',
    'date': '24/05/24',
  },
  {
    'member': 'Sharon Varghese',
    'Description': 'Access granted for Onlypass member',
    'amount': '4000.50',
    'status': 'Expiring',
    'date': '20/05/24',
  },
  {
    'member': 'Akhilesh Chandran',
    'Description': 'Access granted for Onlypass member',
    'amount': '750.00',
    'status': 'Due',
    'date': '15/05/24',
  },
  {
    'member': 'GymFit Club',
    'Description': 'Access granted for Onlypass member',
    'amount': '7000.00',
    'status': 'renewed',
    'date': '10/05/24',
  },
  {
    'member': 'Divya Mohanan',
    'Description': 'Access granted for Onlypass member',
    'amount': '600.26',
    'status': 'renewed',
    'date': '24/05/24',
  },
  {
    'member': 'Sharon Varghese',
    'Description': 'Access granted for Onlypass member',
    'amount': '7000',
    'status': 'Expiring',
    'date': '20/05/24',
  },
  {
    'member': 'Akhilesh Chandran',
    'Description': 'Access granted for Onlypass member',
    'amount': '750.00',
    'status': 'renewed',
    'date': '15/05/24',
  },
  {
    'member': 'GymFit Club',
    'Description': 'Access granted for Onlypass member',
    'amount': '7000.00',
    'status': 'renewed',
    'date': '10/05/24',
  },

  // Add the rest of the transactions here...
];
// final transactionHistory = [
//   {
//     'member': 'Divya Mohanan',
//     'transaction': 'Access granted for Onlypass member',
//     'amount': 'Due',
//   },
//   {
//     'member': 'Sharon Varghese',
//     'transaction': 'Access granted for Onlypass member',
//     'amount': 'Expiring',
//   },
//   {
//     'member': 'Akhilesh Chandran',
//     'transaction': 'Access granted for Onlypass member',
//     'amount': '750.00',
//   },
//   {
//     'member': 'GymFit Club',
//     'transaction': 'Access granted for Onlypass member',
//     'amount': '7000.00',
//   },
//   // Add the rest of the transactions here...
// ];
