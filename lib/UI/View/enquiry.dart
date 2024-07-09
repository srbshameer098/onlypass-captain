import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled7/UI/View/wallet.dart';

class Enquiry extends StatefulWidget {
  const Enquiry({super.key});

  @override
  State<Enquiry> createState() => _EnquiryState();
}

final filteredDue =
    enquiry.where((element) => element['status'] == 'Due').toList();
final filteredExp =
    enquiry.where((element) => element['status'] == 'Expiring').toList();

String enquiryDropdownValue = 'OPEN';
final Map<String, Color> dropdownColors = {
  'OPEN': const Color(0xFFFF001E),
  'HOLD': const Color(0xFFFFFF00),
  'CLOSED': const Color(0xFF00FF00),
};

class _EnquiryState extends State<Enquiry> {
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

          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Enquiry',
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          // actions: [_buildMenuButton()],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 40.h),
              child: Container(
                width: double.infinity,
                height: 48,
                padding: const EdgeInsets.all(2),
                decoration: ShapeDecoration(
                  color: const Color(0xFF282828),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1)),
                ),
                child: TextField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.search,
                  cursorColor: Colors.white,
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: GoogleFonts.montserrat(
                        color: const Color(0xFF6F6F70),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 0.08,
                        letterSpacing: -0.32,
                      ),
                      prefixIcon: const Icon(
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
                    'List of enquiries',
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
                      'add an enquiry',
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
                borderColor: const Color(0xFF282828),
                unselectedBorderColor: const Color(0xFF4D4D4D),
                backgroundColor: Colors.white,
                unselectedBackgroundColor: Colors.transparent,
                labelStyle: GoogleFonts.montserrat(
                  color: const Color(0xFF191919),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
                unselectedLabelStyle: GoogleFonts.montserrat(
                  color: const Color(0xFF818181),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
                tabs: [
                  Tab(
                    height: 30.h,
                    text: 'All',
                  ),
                  Tab(
                    height: 30.h,
                    text: 'Open',
                  ),
                  Tab(
                    height: 30.h,
                    text: 'Closed',
                  ),
                ],
              ),
            ),

            Expanded(
              child: TabBarView(children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 6.h),
                  child: SizedBox(
                    // height: 1.h * enquiry.length.h,
                    child: ListView.separated(
                      itemCount: enquiry.length,
                      itemBuilder: (context, index) {
                        final data = enquiry[index];
                        return Container(
                          color: const Color(0xFF202020),
                          child: Stack(
                            children: [
                              ListTile(
                                // leading: Container(
                                //   width: 4.w,
                                //   height: 115.h,
                                //   color: Colors.red,
                                // ),
                                title: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(data['member']!,
                                                style: GoogleFonts.montserrat(
                                                  color: Colors.white,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                )),
                                            SizedBox(
                                              width: 12.w,
                                            ),
                                            Container(
                                              height: 28.h,
                                              decoration: BoxDecoration(
                                                  color: dropdownColors[
                                                          enquiryDropdownValue]!
                                                      .withOpacity(0.3),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              30.r))),
                                              child: DropdownButton<String>(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 16.w,
                                                ),
                                                alignment: Alignment.center,
                                                dropdownColor: Colors.grey[850],

                                                value: enquiryDropdownValue,
                                                // This is the currently selected value
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: dropdownColors[
                                                      enquiryDropdownValue],
                                                ),
                                                iconSize: 24,
                                                elevation: 16,
                                                style: GoogleFonts.montserrat(
                                                  color: dropdownColors[
                                                      enquiryDropdownValue],
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                underline:
                                                    const SizedBox.shrink(),
                                                // Color of the text
                                                onChanged: (
                                                  String? newValue,
                                                ) {
                                                  setState(() {
                                                    enquiryDropdownValue =
                                                        newValue!;
                                                  });
                                                },
                                                items: ['OPEN', 'HOLD', 'CLOSED'].map<
                                                        DropdownMenuItem<
                                                            String>>(
                                                    (String value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    alignment: Alignment.center,
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '3 hours ago',
                                          style: GoogleFonts.montserrat(
                                            color: const Color(0xFF6F6F70),
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                    Text(
                                      data['Description']!,
                                      style: GoogleFonts.montserrat(
                                        color: const Color(0xFF818181),
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 4.w,
                                height: 112.h,
                                color: enquiryDropdownValue == ('OPEN')
                                    ? const Color(0xffFF4D4D)
                                    : enquiryDropdownValue == ('HOLD')
                                        ? const Color(0xffF1BE0A)
                                        : enquiryDropdownValue == ('CLOSED')
                                            ? const Color(0xff00FF00)
                                            : Colors.grey,
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                        height: 24.h,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 100.h * enquiry.length.h,
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: ListView.separated(
                    itemCount: filteredDue.length,
                    itemBuilder: (context, index) {
                      final data = enquiry[index];
                      return ListTile(
                        leading: Container(
                          width: 44.w,
                          height: 44.h,
                          decoration: const ShapeDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/icons/account.png"),
                              fit: BoxFit.fill,
                            ),
                            shape: OvalBorder(),
                          ),
                        ),
                        title: Text(data['member']!,
                            style: const TextStyle(color: Colors.white)),
                        subtitle: Text(
                          data['Description']!,
                          style: TextStyle(
                              color: data['status'] == 'Due'
                                  ? const Color(0xffFF4D4D)
                                  : data['status'] == 'Expiring'
                                      ? const Color(0xffF1BE0A)
                                      : Colors.grey[700]),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      height: 20.h,
                      child: const Divider(
                        color: Color(0xFF282828),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 100.h * enquiry.length.h,
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: ListView.separated(
                    itemCount: filteredExp.length,
                    itemBuilder: (context, index) {
                      final data = enquiry[index];
                      return ListTile(
                        leading: Container(
                          width: 44.w,
                          height: 44.h,
                          decoration: const ShapeDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/icons/account.png"),
                              fit: BoxFit.fill,
                            ),
                            shape: OvalBorder(),
                          ),
                        ),
                        title: Text(data['member']!,
                            style: GoogleFonts.montserrat(color: Colors.white)),
                        subtitle: Text(
                          data['Description']!,
                          style: TextStyle(
                              color: data['status'] == 'Due'
                                  ? const Color(0xffFF4D4D)
                                  : data['status'] == 'Expiring'
                                      ? const Color(0xffF1BE0A)
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
                                      color: const Color(0x7FFEFEFF),
                                    ),
                                    borderRadius: BorderRadius.circular(1),
                                  ),
                                  shadows: const [
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
                                      color: const Color(0xFF191919),
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
                                    padding: EdgeInsets.only(
                                        top: 6.h,
                                        left: 12.w,
                                        right: 12.w,
                                        bottom: 5.h),
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 0.30.w,
                                          strokeAlign:
                                              BorderSide.strokeAlignCenter,
                                          color: const Color(0x7FFEFEFF),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(1.r),
                                      ),
                                      shadows: const [
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
                                            color: const Color(0xFF191919),
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
                                      color: const Color(0xFF191916),
                                      borderRadius: BorderRadius.circular(1.r),
                                      border: Border.all(
                                        width: 1.w,
                                        color: const Color(0xFF818181),
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
                                          color: const Color(0xFFFEFEFE),
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
                      child: const Divider(
                        color: Color(0xFF282828),
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
}

final enquiry = [
  {
    'member': 'Divya Mohanan',
    'Description':
        'She is interested in joining Yoga regular class on weekends and enquired about timing and fees.',
    'amount': '750',
    'status': 'renewed',
    'date': '24/05/24',
  },
  {
    'member': 'Sharon Varghese',
    'Description':
        'She is interested in joining Yoga regular class on weekends and enquired about timing and fees.',
    'amount': '4000.50',
    'status': 'Expiring',
    'date': '20/05/24',
  },
  {
    'member': 'Akhilesh Chandran',
    'Description':
        'She is interested in joining Yoga regular class on weekends and enquired about timing and fees.',
    'amount': '750.00',
    'status': 'Due',
    'date': '15/05/24',
  },
  {
    'member': 'GymFit Club',
    'Description':
        'She is interested in joining Yoga regular class on weekends and enquired about timing and fees.',
    'amount': '7000.00',
    'status': 'renewed',
    'date': '10/05/24',
  },
  {
    'member': 'Divya Mohanan',
    'Description':
        'She is interested in joining Yoga regular class on weekends and enquired about timing and fees.',
    'amount': '600.26',
    'status': 'renewed',
    'date': '24/05/24',
  },
  {
    'member': 'Sharon Varghese',
    'Description':
        'She is interested in joining Yoga regular class on weekends and enquired about timing and fees.',
    'amount': '7000',
    'status': 'Expiring',
    'date': '20/05/24',
  },
  {
    'member': 'Akhilesh Chandran',
    'Description':
        'She is interested in joining Yoga regular class on weekends and enquired about timing and fees.',
    'amount': '750.00',
    'status': 'renewed',
    'date': '15/05/24',
  },
  {
    'member': 'GymFit Club',
    'Description':
        'She is interested in joining Yoga regular class on weekends and enquired about timing and fees.',
    'amount': '7000.00',
    'status': 'renewed',
    'date': '10/05/24',
  },

  // Add the rest of the transactions here...
];
