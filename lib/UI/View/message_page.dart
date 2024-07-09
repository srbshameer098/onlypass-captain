import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'members.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: true,
          backgroundColor: Color(0xff1F1F1F),
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Container(
              width: double.infinity,
              height: 48.h,
              decoration: ShapeDecoration(
                color: Color(0xFF282828),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1)),
              ),
              child: TextField(
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                    suffix: SizedBox(
                      width: 10.w,
                    ),
                    border: InputBorder.none,
                    hintText: 'Search',
                    hintStyle: GoogleFonts.montserrat(
                      color: Color(0xFF6F6F70),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    )),
              ),
            ),
          ),
        ),
        backgroundColor: Color(0xFF1B1B1B),
        bottomNavigationBar: Container(
          width: double.infinity,
          height: 1.h,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(1.00, 0.00),
              end: Alignment(-1, 0),
              colors: [Color(0x00191919), Color(0xFF737373), Color(0x00191919)],
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              //---background gradiant color---//
              width: double.infinity,
              height: 800.h,
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
                SizedBox(
                  height: 40.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 29.w,
                  ),
                  child: Text(
                    'Messages',
                    style: GoogleFonts.montserrat(
                      color: Color(0xFF818181),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 29),
                //   child: Row(
                //     children: [
                //       Container(
                //         padding: EdgeInsets.all(8.w),
                //         decoration: BoxDecoration(
                //             color: Colors.white,
                //             borderRadius:
                //                 BorderRadius.all(Radius.circular(3.r))),
                //         child: Center(
                //           child: Text(
                //             'All',
                //             style: GoogleFonts.montserrat(
                //               color: const Color(0xFF191919),
                //               fontSize: 14.sp,
                //               fontWeight: FontWeight.w400,
                //             ),
                //           ),
                //         ),
                //       ),
                //       SizedBox(width: 10.w),
                //       Container(
                //         padding: EdgeInsets.all(8.w),
                //         decoration: BoxDecoration(
                //             border: Border.all(
                //                 width: 1.w, color: const Color(0xFF4D4D4D)),
                //             borderRadius:
                //                 BorderRadius.all(Radius.circular(3.r))),
                //         child: Center(
                //           child: Text(
                //             'Bookings',
                //             style: GoogleFonts.montserrat(
                //               color: const Color(0xFF818181),
                //               fontSize: 14.sp,
                //               fontWeight: FontWeight.w400,
                //             ),
                //           ),
                //         ),
                //       ),
                //       SizedBox(width: 10.w),
                //       Container(
                //         padding: EdgeInsets.all(8.w),
                //         decoration: BoxDecoration(
                //             border: Border.all(
                //                 width: 1.w, color: const Color(0xFF4D4D4D)),
                //             borderRadius:
                //                 BorderRadius.all(Radius.circular(3.r))),
                //         child: Center(
                //           child: Text(
                //             'Onlypass',
                //             style: GoogleFonts.montserrat(
                //               color: const Color(0xFF818181),
                //               fontSize: 14.sp,
                //               fontWeight: FontWeight.w400,
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),

                ///-----------Tab Bar  -------------------///

                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 24.h),
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
                        text: 'Bookings',
                      ),
                      Tab(
                        height: 30.h,
                        text: 'Renewal',
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: TabBarView(children: [
                    Container(
                      height: 100.h * members.length.h,
                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                      child: ListView.separated(
                        itemCount: members.length,
                        itemBuilder: (context, index) {
                          final messages = members[index];
                          return ListTile(
                            leading: Stack(
                              children: [
                                Container(
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
                                Positioned(
                                    right: BorderSide.strokeAlignCenter,
                                    bottom: BorderSide.strokeAlignCenter,
                                    height: 22.h,
                                    child: Container(
                                      width: 22.w,
                                      height: 22.h,
                                      decoration: ShapeDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/onlypassIcon.png"),
                                          fit: BoxFit.fill,
                                        ),
                                        shape: OvalBorder(),
                                      ),
                                    ))
                              ],
                            ),
                            title: Text(messages['member']!,
                                style: GoogleFonts.montserrat(
                                  color: Color(0xFFFEFEFE),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                )),
                            subtitle: Text(
                              '${messages['Description']!} ${messages['amount']!}',
                              style: GoogleFonts.montserrat(
                                color: Color(0xFFA3A3A3),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            trailing: Text(
                              messages['date']!,
                              style: GoogleFonts.montserrat(
                                color: Color(0xFF545454),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          height: 20.h,
                          child: Divider(
                            color: Color(0xFF282828),
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
            )
          ],
        ),
      ),
    );
  }
}
