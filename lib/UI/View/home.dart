import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:untitled7/Bloc/Event_Creation/event_bloc.dart';
import 'package:untitled7/UI/View/pre_event.dart';
import 'package:untitled7/UI/View/wallet.dart';

import '../../BloC/All_Event/all_event_bloc.dart';
import '../../Repository/Model_Class/All_Event_Model.dart';
import '../../components/Bottom Sheets/Admin customer-id form.dart';
import '../../components/Bottom Sheets/New business enquiry.dart';
import '../../components/Buttons/radio_button1.dart';
import '../../components/facility_item.dart';
import '../../components/Buttons/radioButton.dart';
import '../../event_pages.dart';
import '../../components/Bottom Sheets/Staff customer-id form.dart';
import 'Staff login - Facilities Search.dart';
import '../../components/Bottom Sheets/Staff-login OTP.dart';
import 'account.dart';
import 'enquiry.dart';
import 'members.dart';

class Home extends StatefulWidget {
  final bool otpBottomSheet;
  final bool welcomeSheet;
  final bool profilebottomsheet;
  final bool adminformBottomSheet;
  final bool Newbusineessbottomsheet;

  const Home({
    super.key,
    required this.otpBottomSheet,
    required this.welcomeSheet,
    required this.profilebottomsheet,
    required this.adminformBottomSheet,
    required this.Newbusineessbottomsheet,
  });

  @override
  State<Home> createState() => _HomeState();
}

late List<AllEventModel>? data;

class _HomeState extends State<Home> {
  List<String> icons = [
    'assets/icons/account.svg',
    'assets/icons/members.svg',
    'assets/icons/enquiries.svg',
    'assets/icons/wallet.svg',
  ];
  List<String> texts = [
    'Account',
    'Members',
    'Enquiries',
    'Wallet',
  ];
  int _currentIndex = 0;
  int? selectedValue = 1;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AllEventBloc>(context).add(FetchAllEvent());
  }

  final PageController _pageController = PageController();

  // int currentPage = 0; // Track current page index

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFF191919),
        appBar: AppBar(
          backgroundColor: const Color(0xff000000),
          toolbarHeight: 75.h,
          automaticallyImplyLeading: false,
          forceMaterialTransparency: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                'assets/icons/onlypass.svg',
                width: 33.87.w,
                height: 33.87.h,
              ),
              Container(
                width: 206.w,
                height: 40.h,
                decoration: ShapeDecoration(
                  color: const Color(0x19FEFEFE),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 0.50.w, color: const Color(0x26B2B2B2)),
                    borderRadius: BorderRadius.circular(140.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Row(
                    children: [
                      CircleAvatar(
                          radius: 14.r,
                          backgroundColor: const Color(0xFF282828),
                          child: SvgPicture.asset(
                            'assets/icons/performance.svg',
                            width: 16.w,
                            height: 16.h,
                          )),
                      SizedBox(
                        width: 10.w,
                      ),
                      SizedBox(width: 151.w,
                        child: Text(
                          'See your performance',
                          style: GoogleFonts.montserrat(
                              color: const Color(0xfffefefe),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.4

                          ),overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    'assets/icons/person.svg',
                    width: 24.w,
                    height: 24.h,
                  )),
            ],
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 5.sp),
            child: Container(
              width: double.infinity.w,
              height: 0.5.h,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(1.00, 0.00),
                  end: Alignment(-1, 0),
                  colors: [
                    Color(0x00191919),
                    Color(0xFF737373),
                    Color(0x00191919)
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          width: double.infinity,
          height: 0.5.h,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(1.00, 0.00),
              end: Alignment(-1, 0),
              colors: [Color(0x00191919), Color(0xFF737373), Color(0x00191919)],
            ),
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                height: 0.5.h,
                decoration: const BoxDecoration(
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 12.h),
                      child: Center(
                        child: Container(
                          width: 44.w,
                          height: 3.h,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF464646),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.r),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 29.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Quick notification',
                                style: GoogleFonts.montserrat(
                                  color: const Color(0xFF6F6F6F),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(6),
                                child: CircleAvatar(
                                  radius: 10.r,
                                  backgroundColor: const Color(0xFF00FF00),
                                  child: Text(
                                    '9',
                                    style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'view all',
                            style: GoogleFonts.montserrat(
                              color: const Color(0xFFE4E4E4),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              decorationColor: const Color(0xFFE4E4E4),
                              decorationThickness: 1.w,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    CarouselSlider.builder(
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                          Container(
                        width: 326.w,
                        height: 64.h,
                        decoration: BoxDecoration(
                            color: const Color(0xFFFEFEFE),
                            borderRadius:
                                BorderRadius.all(Radius.circular(1.r))),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 12.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: 40.w,
                                height: 40.h,
                                decoration: ShapeDecoration(
                                  image: const DecorationImage(
                                    image:
                                        AssetImage("assets/images/imgLog.png"),
                                    fit: BoxFit.fill,
                                  ),
                                  shape: CircleBorder(
                                    side: BorderSide(
                                        width: 0.30.w,
                                        color: const Color(0xFF191919)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              SizedBox(width: 107.w,

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 107.w,
                                      height: 17.h,
                                      child: Text(
                                        'Jayaram Ravi',
                                        style: TextStyle(
                                          color: const Color(0xFF191919),
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                        ),overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    SizedBox(width: 107.w,
                                      height: 17.h,
                                      child: Text(
                                        '3 Months plan',
                                        style: GoogleFonts.montserrat(
                                          color: const Color(0xFF9B9B9B),
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 27.w,
                              ),
                              SizedBox(width: 120.w,

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      height: 17.h,
                                      child: Text(
                                        '₹ ' '5,799 .00',
                                        style: GoogleFonts.montserrat(
                                          color: const Color(0xFF191919),
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                        ),overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 6.h,
                                    ),
                                    SizedBox(
                                      height: 17.h,
                                      child: Text(
                                        'DUE YESTERDAY',
                                        style: GoogleFonts.montserrat(
                                          color: const Color(0xFFE83507),
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                        ),overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      options: CarouselOptions(
                        viewportFraction: 0.9,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        enlargeCenterPage: false,
                        clipBehavior: Clip.antiAlias,
                        enableInfiniteScroll: false,
                        aspectRatio: 326 / 64,
                        height: 64.h,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Center(
                        child: DotsIndicator(
                          dotsCount: 5,
                          position: _currentIndex,
                          decorator: DotsDecorator(
                            activeColor: const Color(0xFFE4E4E4),
                            color: const Color(0xFF5D5D5D),
                            spacing: EdgeInsets.only(left: 2.w),
                            activeSize: const Size(10, 8),
                            size: const Size(9, 4),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28.w),
                      child: Text(
                        'Manage your facility',
                        style: GoogleFonts.montserrat(
                          color: const Color(0xFF6F6F6F),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 32.h,horizontal: 28.w
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const Account()));
                              },
                              child:
                                  FacilityItem(icon: icons[0], text: texts[0])),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const Members()));
                              },
                              child:
                                  FacilityItem(icon: icons[1], text: texts[1])),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const Enquiry()));
                              },
                              child:
                                  FacilityItem(icon: icons[2], text: texts[2])),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const Wallet()));
                              },
                              child:
                                  FacilityItem(icon: icons[3], text: texts[3])),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 0.5.h,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(1.00, 0.00),
                          end: Alignment(-1, 0),
                          colors: [
                            Color(0x00191919),
                            Color(0xFF737373),
                            Color(0x00191919)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(width:137.w,
                            child: Text(
                              'Classes and events',
                              style: GoogleFonts.montserrat(
                                color: const Color(0xFF6F6F6F),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(width: 135.w,),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      // builder: (_) => const CreateEvent()));
                                      builder: (_) => const EventPages()));
                            },
                            child: SizedBox(width: 62.w,
                              child: Text(
                                'add new',
                                style: GoogleFonts.montserrat(
                                    color: const Color(0xFFE4E4E4),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                    decorationColor: const Color(0xFFE4E4E4),
                                    decorationThickness: 1.w),overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 32.h),

                    ///-----------Tab Bar  -------------------///
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 28.w,
                      ),
                      child: ButtonsTabBar(
                        physics: const NeverScrollableScrollPhysics(parent: NeverScrollableScrollPhysics()),
                        buttonMargin: EdgeInsets.only(right: 30.w),
                        splashColor: const Color(0xFFFEFEFE),
                        height: 30.h,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 6.w),
                        radius: 0,
                        borderWidth: 0.9,
                        // borderColor: const Color(0xFFE11010),
                        unselectedBorderColor: const Color(0xFFA3A3A3),
                        backgroundColor: Colors.white,
                        unselectedBackgroundColor: Colors.transparent,
                        labelStyle: GoogleFonts.montserrat(
                          color: const Color(0xFF191919),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,textStyle:  const TextStyle(overflow: TextOverflow.ellipsis,)
                        ),
                        unselectedLabelStyle: GoogleFonts.montserrat(
                          color: const Color(0xFFA3A3A3),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        tabs: [
                          Tab(
                            height: 30.h,
                            text: 'Upcoming (${3})',
                          ),
                          Tab(
                            height: 30.h,
                            text: 'Regular (${2})',
                          ),
                          Tab(
                            height: 30.h,
                            text: 'Past (${5})',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    SizedBox(
                      height: 327.h,
                      child: TabBarView(children: [
                        ///-----------Tab 1  -------------------///
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 28.w),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const PreEvent(
                                            text:
                                                'Yoga class with Arun Master and team.',
                                            img: "assets/images/img1.png",
                                            description:
                                                'This class is great for beginners or those who want a more relaxing practice. It focuses on is stretching and strengthen the body.',
                                          )));
                            },
                            child: SizedBox(
                              height: 327.h,
                              child: BlocBuilder<AllEventBloc, AllEventState>(
                                builder: (context, state) {
                                  if (state is AllEventBlocLoading) {
                                    print('bloc loading ');
                                    return Shimmer.fromColors(
                                      direction: ShimmerDirection.ltr,
                                      baseColor: const Color(0xFFE7E7E7),
                                      highlightColor: const Color(0xFF9B9B9B),
                                      child: ListView.builder(
                                        physics: const NeverScrollableScrollPhysics(
                                            parent:
                                                NeverScrollableScrollPhysics()),
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (BuildContext, int) =>
                                            Padding(
                                          padding: EdgeInsets.only(right: 16.w),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 140.w,
                                                height: 185.h,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10.r))),
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Container(
                                                width: 140.w,
                                                height: 20.h,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10.r))),
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Container(
                                                width: 140.w,
                                                height: 20.h,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10.r))),
                                              ),
                                            ],
                                          ),
                                        ),
                                        itemCount: 3,
                                      ),
                                    );
                                  }
                                  if (state is AllEventBlocError) {
                                    return RefreshIndicator(
                                      onRefresh: () async {
                                        return BlocProvider.of<AllEventBloc>(
                                                context)
                                            .add(FetchAllEvent());
                                      },
                                      child: SingleChildScrollView(
                                        physics: const BouncingScrollPhysics(),
                                        child: SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .9.h,
                                            // color: Colors.red,
                                            child: const Center(
                                                child: Text(
                                              'Oops something went wrong',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ))),
                                      ),
                                    );
                                  }
                                  if (state is AllEventBlocLoaded) {
                                    data =
                                        BlocProvider.of<AllEventBloc>(context)
                                            .allEventModel;
                                  }
                                  return ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: data!.length,
                                    itemBuilder: (context, position) {
                                      return Column(
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                width: 155.w,
                                                height: 224.h,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                        "assets/images/img1.png",
                                                      ),
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                              Positioned(
                                                  top: 188.h,
                                                  child: Container(
                                                    width: 155.w,
                                                    height: 36.h,
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        begin: const Alignment(
                                                            -0.00, 1.00),
                                                        end: const Alignment(
                                                            0, -1),
                                                        colors: [
                                                          const Color(
                                                              0x91191919),
                                                          Colors.black
                                                              .withOpacity(
                                                                  0.35),
                                                          const Color(
                                                              0x00191919)
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                              Positioned(
                                                left: 95.w,
                                                top: 14.h,
                                                child: Container(
                                                  width: 60.w,
                                                  height: 20.h,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: Colors.black),
                                                  child: Center(
                                                    child: SizedBox(width:45.w,height: 15.h,
                                                      child: Text(
                                                        'Weekly',
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          color: const Color(
                                                              0xFFFEFEFE),
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),overflow: TextOverflow.ellipsis,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 12.7.w,
                                                top: 202.h,
                                                child: SizedBox(
                                                  width: 22.79.w,
                                                  height: 14.5.h,
                                                  child: SvgPicture.asset(
                                                    'assets/icons/pepole.svg',
                                                    width: 22.79.w,
                                                    height: 14.5.h,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 42.9.w,
                                                top: 200.h,
                                                child: SizedBox(width:130.w,height: 17.h,

                                                  child: Text(
                                                    '${data![position].availableSlot} bookings',
                                                    style: GoogleFonts.montserrat(
                                                      color:
                                                          const Color(0xFFFEFEFE),
                                                      fontSize: 14.sp,
                                                      fontWeight: FontWeight.w400,
                                                    ),overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 14.5.h,
                                          ),
                                          SizedBox(
                                            width: 155.w,
                                            child: Text(
                                              data![position]
                                                  .description
                                                  .toString(),
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500,
                                                height: 1.18.h,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 6.h,
                                          ),
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  SizedBox(
                                                    width: 155.w,
                                                    child: Text(
                                                      'Fri, Dec 23 8:30 am to',
                                                      style: GoogleFonts.inter(
                                                        color: const Color(
                                                            0xFF818181),
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 155.w,
                                                    child: Text(
                                                      'Fri, Dec 23 9:30 am ',
                                                      style: GoogleFonts.inter(
                                                        color: const Color(
                                                            0xFF818181),
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(
                                        width: 16.w,

                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),

                        ///-----------Tab 2  -------------------///
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.h, horizontal: 16),
                          child: GestureDetector(
                            onTap: () {
                              // data = BlocProvider.of<AllEventBloc>(context)
                              //     .allEventModel;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => PreEvent(
                                    text: data![0].name.toString(),
                                    img: "assets/images/img1.png",
                                    // img: data![0].image.toString(),
                                    description:
                                        data![0].description.toString(),
                                  ),
                                ),
                              );
                            },
                            child: SizedBox(
                              height: 270.h,
                              child: BlocBuilder<AllEventBloc, AllEventState>(
                                builder: (context, state) {
                                  if (state is AllEventBlocLoading) {
                                    if (kDebugMode) {
                                      print(
                                          'Data AllEventBlocLoading ! ! ! ! ! !! ! ! ! ! !: ${data.toString()}');
                                    }

                                    ///  Shimmer effect  ///
                                    return Shimmer.fromColors(
                                      direction: ShimmerDirection.ltr,
                                      baseColor: const Color(0xFFE7E7E7),
                                      highlightColor: const Color(0xFF9B9B9B),
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (_, __) => Padding(
                                          padding: EdgeInsets.only(right: 16.w),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 140.w,
                                                height: 185.h,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10.r))),
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Container(
                                                width: 140.w,

                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10.r))),
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Container(
                                                width: 140.w,

                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10.r))),
                                              ),
                                            ],
                                          ),
                                        ),
                                        itemCount: 3,
                                      ),
                                    );
                                  }
                                  if (state is AllEventBlocError) {
                                    print(
                                        'Data AllEventBlocError ! ! ! ! ! !! ! ! ! ! !: ${data.toString()}');
                                    return const Center(
                                      child: Text('Failed to load events'),
                                    );
                                  }
                                  if (state is AllEventBlocLoaded) {
                                    data =
                                        BlocProvider.of<AllEventBloc>(context)
                                            .allEventModel;
                                    print(
                                        'Data fetched ! ! ! ! ! !! ! ! ! ! ! AllEventBlocLoaded ! ! ! ! ! !! ! ! ! ! !: ${data.toString()}');
                                    if (data == null || data!.isEmpty) {
                                      print(
                                          'Data fetched ! ! ! ! ! !! ! ! ! ! ! EMPTY ! ! ! ! ! !! ! ! ! ! !: ${data.toString()}');
                                      return const Center(
                                        child: Text('No events available'),
                                      );
                                    }
                                    return ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: data!.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  width: 152.w,
                                                  height: 194.h,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          data![index]
                                                              .image
                                                              .toString()),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 163.h,
                                                  child: Container(
                                                    width: 152.w,
                                                    height: 31.h,
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        begin: const Alignment(
                                                            -0.00, 1.00),
                                                        end: const Alignment(
                                                            0, -1),
                                                        colors: [
                                                          const Color(
                                                              0x91191919),
                                                          Colors.black
                                                              .withOpacity(
                                                                  0.35),
                                                          const Color(
                                                              0x00191919)
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 101.w,
                                                  top: 12.h,
                                                  child: Container(
                                                    width: 52.w,
                                                    height: 16.h,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Colors.black,
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'Weekly',
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          color: const Color(
                                                              0xFFFEFEFE),
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 15.w,
                                                  top: 172.h,
                                                  child: SizedBox(
                                                    width: 16.w,
                                                    height: 16.h,
                                                    child: Image.asset(
                                                      'assets/icons/groupIcon.png',
                                                      height: 28.h,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 39.w,
                                                  top: 175.h,
                                                  child: Text(
                                                    '${data![index].availableSlot} availableSlot',
                                                    style: TextStyle(
                                                      color: const Color(
                                                          0xFFFEFEFE),
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 8.h),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 4.w),
                                              child: SizedBox(
                                                width: 153.w,
                                                child: Text(
                                                  data![index].name.toString(),
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.2.h,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 4.h),
                                              child: SizedBox(
                                                width: 153.w,
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      data![index]
                                                          .startDate
                                                          .toString(),
                                                      style: GoogleFonts.inter(
                                                        color: const Color(
                                                            0xFF818181),
                                                        fontSize: 10.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 4),
                                                    Text(
                                                      data![index]
                                                          .endDate
                                                          .toString(),
                                                      style: GoogleFonts.inter(
                                                        color: const Color(
                                                            0xFF818181),
                                                        fontSize: 10.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return SizedBox(width: 23.w);
                                      },
                                    );
                                  } else {
                                    return Container(
                                      height: 20,
                                      width: 20,
                                      color: Colors.blue,
                                    );
                                    // data = BlocProvider.of<AllEventBloc>(context).allEventModel;
                                    // print('Data fetched ! ! ! ! ! !! ! ! ! ! ! AllEventBlocLoaded ! ! ! ! ! !! ! ! ! ! !: ${data.toString()}');
                                    // if (data == null || data!.isEmpty) {
                                    //   print('Data fetched ! ! ! ! ! !! ! ! ! ! ! EMPTY ! ! ! ! ! !! ! ! ! ! !: ${data.toString()}');
                                    //   return Center(
                                    //     child: Text('No events available'),
                                    //
                                    //   );
                                    // }
                                    // return ListView.separated(
                                    //   scrollDirection: Axis.horizontal,
                                    //   itemCount: data!.length,
                                    //   itemBuilder: (context, index) {
                                    //     return Column(
                                    //       children: [
                                    //         Stack(
                                    //           children: [
                                    //             Container(
                                    //               width: 152.w,
                                    //               height: 194.h,
                                    //               decoration: BoxDecoration(
                                    //                 image: DecorationImage(
                                    //                   image: NetworkImage(
                                    //                       data![index].image.toString()),
                                    //                   fit: BoxFit.cover,
                                    //                 ),
                                    //               ),
                                    //             ),
                                    //             Positioned(
                                    //               top: 163.h,
                                    //               child: Container(
                                    //                 width: 152.w,
                                    //                 height: 31.h,
                                    //                 decoration: BoxDecoration(
                                    //                   gradient: LinearGradient(
                                    //                     begin: Alignment(
                                    //                         -0.00, 1.00),
                                    //                     end: Alignment(0, -1),
                                    //                     colors: [
                                    //                       Color(0x91191919),
                                    //                       Colors.black
                                    //                           .withOpacity(
                                    //                           0.35),
                                    //                       Color(0x00191919)
                                    //                     ],
                                    //                   ),
                                    //                 ),
                                    //               ),
                                    //             ),
                                    //             Positioned(
                                    //               left: 101.w,
                                    //               top: 12.h,
                                    //               child: Container(
                                    //                 width: 52.w,
                                    //                 height: 16.h,
                                    //                 decoration: const BoxDecoration(
                                    //                   color: Colors.black,
                                    //                 ),
                                    //                 child: Center(
                                    //                   child: Text(
                                    //                     'Weekly',
                                    //                     style: GoogleFonts
                                    //                         .montserrat(
                                    //                       color: const Color(
                                    //                           0xFFFEFEFE),
                                    //                       fontSize: 10.sp,
                                    //                       fontWeight: FontWeight
                                    //                           .w400,
                                    //                     ),
                                    //                   ),
                                    //                 ),
                                    //               ),
                                    //             ),
                                    //             Positioned(
                                    //               left: 15.w,
                                    //               top: 172.h,
                                    //               child: SizedBox(
                                    //                 width: 16.w,
                                    //                 height: 16.h,
                                    //                 child: Image.asset(
                                    //                   'assets/icons/groupIcon.png',
                                    //                   height: 28.h,
                                    //                 ),
                                    //               ),
                                    //             ),
                                    //             Positioned(
                                    //               left: 39.w,
                                    //               top: 175.h,
                                    //               child: Text(
                                    //                 '${data![index]
                                    //                     .availableSlot} availableSlot',
                                    //                 style: TextStyle(
                                    //                   color: const Color(
                                    //                       0xFFFEFEFE),
                                    //                   fontSize: 10.sp,
                                    //                   fontWeight: FontWeight
                                    //                       .w500,
                                    //                 ),
                                    //               ),
                                    //             ),
                                    //           ],
                                    //         ),
                                    //         SizedBox(height: 8),
                                    //         Padding(
                                    //           padding: EdgeInsets.symmetric(
                                    //               vertical: 4.w),
                                    //           child: SizedBox(
                                    //             width: 153.w,
                                    //             child: Text(
                                    //               data![index].name.toString(),
                                    //               style: TextStyle(
                                    //                 color: Colors.white,
                                    //                 fontSize: 12.sp,
                                    //                 fontWeight: FontWeight.w400,
                                    //                 height: 1.2.h,
                                    //               ),
                                    //             ),
                                    //           ),
                                    //         ),
                                    //         Padding(
                                    //           padding: EdgeInsets.symmetric(
                                    //               vertical: 4.h),
                                    //           child: SizedBox(
                                    //             width: 153.w,
                                    //             child: Row(
                                    //               children: [
                                    //                 Text(
                                    //                   data![index].startDate!
                                    //                       .toString(),
                                    //                   style: GoogleFonts.inter(
                                    //                     color: const Color(
                                    //                         0xFF818181),
                                    //                     fontSize: 10.sp,
                                    //                     fontWeight: FontWeight
                                    //                         .w400,
                                    //                   ),
                                    //                 ),
                                    //                 const SizedBox(width: 4),
                                    //                 Text(
                                    //                   data![index].endDate!
                                    //                       .toString(),
                                    //                   style: GoogleFonts.inter(
                                    //                     color: const Color(
                                    //                         0xFF818181),
                                    //                     fontSize: 10.sp,
                                    //                     fontWeight: FontWeight
                                    //                         .w400,
                                    //                   ),
                                    //                 ),
                                    //               ],
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       ],
                                    //     );
                                    //   },
                                    //   separatorBuilder: (BuildContext context,
                                    //       int index) {
                                    //     return SizedBox(width: 23.w);
                                    //   },
                                    // );
                                  }
                                },
                              ),
                            ),
                          ),
                        ),

                        ///-----------Tab 3  -------------------///
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

// void _showModalBottomSheet(BuildContext context) {
//   showModalBottomSheet<void>(
//     // context and builder are
//     // required properties in this widget
//     isDismissible: false,
//     context: context,
//     builder:  (context) => ModalBottomSheetDemo(),
//       // we set up a container inside which
//       // we create center column and display text
//
//       // Returning SizedBox instead of a Container
//       // return SizedBox(
//       //   height:  600.h,
//       //   child: Center(
//       //     child: Column(
//       //       mainAxisAlignment: MainAxisAlignment.end,
//       //       children:  <Widget>[
//       //         Container(
//       //           width:double.infinity,
//       //           height: 500.1.h,
//       //           decoration: ShapeDecoration(
//       //             color: Color(0xFF191919),
//       //             shape: RoundedRectangleBorder(
//       //               borderRadius: BorderRadius.only(
//       //                 topLeft: Radius.circular(2.r),
//       //                 topRight: Radius.circular(2.r),
//       //               ),
//       //             ),
//       //           ),
//       //           child: Padding(
//       //             padding:  EdgeInsets.symmetric(horizontal: 28.w,vertical: 32.h),
//       //             child: Column(
//       //               children: [
//       //                 Text(
//       //                   'Welcome to Onlypass Captain App',
//       //                   style: TextStyle(
//       //                     color: Color(0xFFE4E4E4),
//       //                     fontSize: 16.sp,
//       //                     fontFamily: 'Montserrat',
//       //                     fontWeight: FontWeight.w600,
//       //
//       //                   ),
//       //                 ),
//       //
//       //             SizedBox(height: 16.h,),
//       //             SizedBox(
//       //               width: 334.w,
//       //
//       //               child: Text(
//       //                   "We couldn't find any account registered with the phone number. Select one of the below.",
//       //               style: TextStyle(
//       //                   color: Color(0xFF6F6F6F),
//       //               fontSize: 14.sp,
//       //               fontFamily: 'Montserrat',
//       //               fontWeight: FontWeight.w400,
//       //
//       //             ),
//       //           ),
//       //         ),
//       //               ],
//       //             ),
//       //           )
//       //
//       //         ),
//       //       ],
//       //     ),
//       //   ),
//        );
//     }
//
// class ModalBottomSheetDemo {
// },
//   );
// }

//
// Future modalBottomSheetShow(BuildContext context) {
//   return showModalBottomSheet(
//     isScrollControlled: true,
//     enableDrag: false,
//
//
//     backgroundColor: Colors.transparent,
//     context: context,
//     builder: (context) => buildSheet(context),
//     isDismissible: false,
//     elevation: 0,
//   ).whenComplete(() => Home());
// }
//
// Widget buildSheet(BuildContext context) {
//   return SizedBox(height: 600,
//     child: Container(
//
//       decoration: BoxDecoration(
//         color: Color(0xFF191919),
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(16),
//           topRight: Radius.circular(16),
//         ),
//       ),
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 28, vertical: 32),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Text(
//               'Welcome to Onlypass Captain App',
//               style: TextStyle(
//                 color: Color(0xFFE4E4E4),
//                 fontSize: 16,
//                 fontFamily: 'Montserrat',
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             SizedBox(height: 16),
//             Text(
//               "We couldn't find any account registered with the phone number. Select one of the below.",
//               style: TextStyle(
//                 color: Color(0xFF6F6F6F),
//                 fontSize: 14,
//                 fontFamily: 'Montserrat',
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//         SizedBox(height: 32.h,),
//         Container(
//           width: 334,
//           height: 95,
//           decoration: ShapeDecoration(
//             color: Color(0xFFFEFEFE),
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
//           ),child:
//         Padding(
//           padding:  EdgeInsets.only(left: 20.w,top: 16.h),
//           child: Column(crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Text(
//                     'I am a staff of a registered business',
//                     style: TextStyle(
//                       color: Color(0xFF191919),
//                       fontSize: 14.sp,
//                       fontFamily: 'Montserrat',
//                       fontWeight: FontWeight.w600,
//
//                     ),
//                   ),
//                 ],
//               ),
//
//
//
//               Text(
//                 'Select your business from registered list of businesses with a name or code.',
//                 style: TextStyle(
//                   color: Color(0xFF818181),
//                   fontSize: 14,
//                   fontFamily: 'Montserrat',
//                   fontWeight: FontWeight.w400,
//
//                 ),
//               ),
//             ],
//           ),
//         ),
//         ),
//             SizedBox(height: 24.h,),
//             GestureDetector(
//               onTap: (){
//
//               },
//               child: Container(
//                 width: 334,
//                 height: 74,
//                 decoration: ShapeDecoration(
//                   color: Color(0xFF282828),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
//                 ),child: Padding(
//                   padding:  EdgeInsets.only(left: 24.w,top: 16.h),
//                   child: Column(crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                        Row(
//                         children: [
//                           Radio(
//                             value: 1,
//                             groupValue: val,
//                             onChanged: (value) {
//                               setState(() {
//                                 val = true;
//                               });
//                             },
//                             activeColor: Colors.green,
//                           ),
//                           Text(
//                           'I am a new user.',
//                           style: TextStyle(
//                             color: Color(0xFFFEFEFE),
//                             fontSize: 14.sp,
//                             fontFamily: 'Montserrat',
//                             fontWeight: FontWeight.w600,
//
//                           ),
//                                       ),
//                         ],
//                       ),
//                       SizedBox(height: 12.h,),
//
//                       Text(
//                         'I would like to register my business.',
//                         style: TextStyle(
//                           color: Color(0xFF6F6F70),
//                           fontSize: 14,
//                           fontFamily: 'Montserrat',
//                           fontWeight: FontWeight.w400,
//                           height: 0.08,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             // Add more widgets here if needed
//           ],
//         ),
//       ),
//     ),
//   );
// }
