import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled7/Bloc/Event_Creation/event_bloc.dart';
import 'package:untitled7/UI/View/pre_event.dart';
import 'package:untitled7/UI/View/wallet.dart';


import '../../components/facility_item.dart';
import '../../event_pages.dart';
import 'account.dart';
import 'enquiry.dart';
import 'members.dart';

class Home extends StatefulWidget {

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<String> icons = [
    'assets/icons/history.png',
    'assets/icons/members.png',
    'assets/icons/Enquiries.png',
    'assets/icons/Wallet.png',
  ];
  List<String> texts = [
    'Account',
    'Members',
    'Enquiries',
    'Wallet',
  ];
  int _currentIndex = 0;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showModalBottomSheet(context);
    });
  }
  int? selectedValue;

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(

      decoration: BoxDecoration(
        color: Color(0xFF191919),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Welcome to Onlypass Captain App',
              style: TextStyle(
                color: Color(0xFFE4E4E4),
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "We couldn't find any account registered with the phone number. Select one of the below.",
              style: TextStyle(
                color: Color(0xFF6F6F6F),
                fontSize: 14,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
              ),
            ),
        SizedBox(height: 32.h,),
        GestureDetector(
          onTap:  () {
      setState(() {
      selectedValue = 1;
      });
      },
          child: Container(
            width: 334,
            height: 95,
            decoration: ShapeDecoration(
              color: Color(0xFFFEFEFE),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
            ),child:
          Padding(
            padding:  EdgeInsets.only(left: 0.w,top: 6.h),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Radio(
                      value: 0,
                      groupValue: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      activeColor: Colors.green,
                    ),
                    Text(
                      'I am a staff of a registered business',
                      style: TextStyle(
                        color: Color(0xFF191919),
                        fontSize: 13.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,

                      ),
                    ),
                  ],
                ),



                Padding(
                  padding:  EdgeInsets.only(left: 20.w,top: 0.h),
                  child: Text(
                    'Select your business from registered list of businesses with a name or code.',
                    style: TextStyle(
                      color: Color(0xFF818181),
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,

                    ),
                  ),
                ),
              ],
            ),
          ),
          ),
        ),
            SizedBox(height: 24.h,),
            GestureDetector(
              onTap: (){

                selectedValue = 2;
              },
              child: Container(
                width: 334,
                height: 74,
                decoration: ShapeDecoration(
                  color: Color(0xFF282828),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
                ),child: Padding(
                  padding:  EdgeInsets.only(left: 24.w,top: 0.h),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Row(
                        children: [
                          Radio(
                            value: 0,
                            groupValue: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value;
                              });
                            },
                            activeColor: Colors.green,
                          ),
                          Text(
                          'I am a new user.',
                          style: TextStyle(
                            color: Color(0xFFFEFEFE),
                            fontSize: 14.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,

                          ),
                                      ),
                        ],
                      ),
                      // SizedBox(height: 12.h,),

                      Text(
                        'I would like to register my business.',
                        style: TextStyle(
                          color: Color(0xFF6F6F70),
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                          height: 0.08,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Add more widgets here if needed
          ],
        ),
      ),
    );

      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFF191919),
        appBar: AppBar(
          toolbarHeight: 75.h,
          automaticallyImplyLeading: false,
          forceMaterialTransparency: true,

          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/CaptainLogoOnly.png',
                height: 30.h,
                width: 30.w,
              ),
              Container(
                width: 207,
                height: 40,
                decoration: ShapeDecoration(
                  color:  Color(0x10FEFEFE),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 0.30, color: Color(0x26B2B2B2)),
                    borderRadius: BorderRadius.circular(140),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 14.r,
                        backgroundColor: const Color(0xFF202020),
                        child: Image.asset(
                          'assets/icons/performance.png',
                          height: 14.h,
                          width: 14.w,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'See your performance',
                        style: GoogleFonts.montserrat(
                          color: Color(0xfffefefe),
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  _showModalBottomSheet(context);
                },
                child: Image.asset(
                  'assets/icons/account.png',
                  height: 24.h,
                  width: 24.w,
                ),
              ),
            ],
          ),

          centerTitle: true,
          backgroundColor: Colors.black,
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 5),
            child: Container(
              width: double.infinity,
              height: 1.h,
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
          height: 1.h,
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Container(
                          width: 44,
                          height: 3,
                          decoration: ShapeDecoration(
                            color: Color(0xFF464646),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 25.h, vertical: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Quick view notification',
                                style: GoogleFonts.montserrat(
                                  color: const Color(0xFF818181),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0.w),
                                child: CircleAvatar(
                                  radius: 10.r,
                                  backgroundColor: const Color(0xFF00FF00),
                                  child: Text(
                                    '9+',
                                    style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize: 10.sp,
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
                              color: const Color(0xFFFEFEFE),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                              decorationThickness: 1.w,
                            ),
                          )
                        ],
                      ),
                    ),
                    CarouselSlider.builder(
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                          Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          width: 376.w,
                          height: 64.h,
                          decoration: BoxDecoration(
                              color: const Color(0xFFFEFEFE),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(1.r))),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 40.w,
                                  height: 40.h,
                                  decoration: ShapeDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/images/imgLog.png"),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: OvalBorder(
                                      side: BorderSide(
                                          width: 0.30.w,
                                          color: const Color(0xFF191919)),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Jayaram Ravi',
                                      style: TextStyle(
                                        color: const Color(0xFF191919),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      '3 Months plan',
                                      style: GoogleFonts.montserrat(
                                        color: const Color(0xFF9B9B9B),
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '₹ ' '5,799 .00',
                                      style: GoogleFonts.montserrat(
                                        color: const Color(0xFF191919),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      'DUE YESTERDAY',
                                      style: GoogleFonts.montserrat(
                                        color: const Color(0xFFE83507),
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
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
                        clipBehavior: Clip.none,
                        enableInfiniteScroll: false,
                        aspectRatio: 400 / 64,
                        height: 88.h,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0.w),
                      child: Center(
                        child: DotsIndicator(
                          dotsCount: 5,
                          position: _currentIndex,
                          decorator: const DotsDecorator(
                            activeColor: Colors.white,
                            color: Color(0xFF5D5D5D),
                            spacing: EdgeInsets.all(2),
                            activeSize: Size(10, 8),
                            size: Size(9, 4),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        'Manage your facility',
                        style: GoogleFonts.montserrat(
                          color: const Color(0xFF818181),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.h, vertical: 30.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => Account()));
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
                      height: 1.h,
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
                      height: 40.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Create & edit classes/events ',
                            style: GoogleFonts.montserrat(
                              color: const Color(0xFF818181),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      // builder: (_) => const CreateEvent()));
                                      builder: (_) => const EventPages()));
                            },
                            child: Text(
                              'add new',
                              style: GoogleFonts.montserrat(
                                  color: const Color(0xFFFEFEFE),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Color(0xfffefefe),
                                  decorationThickness: 1.w),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 8.h),

                    ///-----------Tab Bar  -------------------///
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 25.w, vertical: 24.h),
                      child: ButtonsTabBar(
                        buttonMargin: EdgeInsets.only(right: 32),
                        splashColor: Colors.white,
                        height: 30,
                        elevation: 0,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 6.w),
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
                            height: 30,
                            text: 'Upcoming (${3})',
                          ),
                          Tab(
                            height: 30,
                            text: 'Regular (${2})',
                          ),
                          Tab(
                            height: 30,
                            text: 'Past (${5})',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 300.h,
                      child: TabBarView(children: [
                        ///-----------Tab 1  -------------------///
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.h, horizontal: 16),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const PreEvent(
                                            text:
                                                'Yoga class with Arun Master and team.',
                                            img: "assets/images/img1.png",
                                          )));
                            },
                            child: SizedBox(
                              height: 270.h,
                              child: BlocBuilder<EventBloc, EventState>(
                                builder: (context, state) {
                                  if (state is EventBloCLoading) {
                                    return const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    );
                                  }
                                  if (state is EventBloCError) {
                                    return const Center(
                                      child: Text('something else !!'),
                                    );
                                  }
                                  if (state is EventBLoCLoaded) {
                                    // data = BlocProvider.of.<EventBloc>(context).eventModel;
                                  }
                                  return ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 3,
                                    itemBuilder: (context, position) {
                                      return Column(
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                width: 152.w,
                                                height: 194.h,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                        "assets/images/img1.png",
                                                      ),
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                              Positioned(
                                                  top: 163.h,
                                                  child: Container(
                                                    width: 152.w,
                                                    height: 31.h,
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        begin: Alignment(
                                                            -0.00, 1.00),
                                                        end: Alignment(0, -1),
                                                        colors: [
                                                          Color(0x91191919),
                                                          Colors.black
                                                              .withOpacity(
                                                                  0.35),
                                                          Color(0x00191919)
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                              Positioned(
                                                left: 101.w,
                                                top: 12.h,
                                                child: Container(
                                                  width: 52.w,
                                                  height: 16.h,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: Colors.black),
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
                                                  '17 booked',
                                                  style: GoogleFonts.montserrat(
                                                    color:
                                                        const Color(0xFFFEFEFE),
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 4.w),
                                            child: SizedBox(
                                              width: 153.w,
                                              child: Text(
                                                'Yoga class with Arun Master and team.',
                                                style: GoogleFonts.montserrat(
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
                                                    'Fri, Dec 23',
                                                    style: GoogleFonts.inter(
                                                      color: const Color(
                                                          0xFF818181),
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 4,
                                                  ),
                                                  Text(
                                                    '8:30am - 9:30am',
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
                                          )
                                        ],
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(
                                        width: 23.w,
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),

                        ///-----------Tab 2  -------------------///
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
