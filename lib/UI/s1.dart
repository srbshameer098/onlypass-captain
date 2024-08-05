import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../BloC/All_Event/all_event_bloc.dart';
import '../components/Bottom Sheets/Admin customer-id form.dart';
import '../components/Bottom Sheets/New business enquiry.dart';
import '../components/Bottom Sheets/Staff customer-id form.dart';
import '../components/Bottom Sheets/Staff-login OTP.dart';
import '../components/Buttons/radio_button1.dart';
import 'View/Staff login - Facilities Search.dart';
import 'View/home.dart';
import 'View/message_page.dart';
import 'View/scan_page.dart';

class S1 extends StatefulWidget {
  final bool otpBottomSheet;
  final bool welcomeSheet;
  final bool profilebottomsheet;
  final bool adminformBottomSheet;
  final bool Newbusineessbottomsheet;

  const S1(
      {super.key,
      required this.otpBottomSheet,
      required this.welcomeSheet,
      required this.profilebottomsheet,
      required this.adminformBottomSheet,
      required this.Newbusineessbottomsheet});

  @override
  State<S1> createState() => _S1State();
}

int _currentIndex = 1;
int? selectedValue = 1;
int currentPage = 0;
bool welcome_sheet = true;

bool otp_bottom_sheet = true;
bool profile_bottom_sheet = true;
bool admin_form_BottomSheet = true;
bool New_busineess_bottom_sheet = true;

final List<Widget?> _pages = [
  const ScanPage(),
  const Home(
    otpBottomSheet: false,
    welcomeSheet: false,
    profilebottomsheet: false,
    adminformBottomSheet: false,
    Newbusineessbottomsheet: false,
  ),
  const MessagePage()
];
List<String> icons = [
  'assets/icons/scanCircle.png',
  'assets/icons/logo.png',
  'assets/icons/messageCircle.png',
];

// List<String> iconsInactive = [
//   'assets/icons/un-scanner.png',
//   'assets/icons/logo.png',
//   'assets/icons/message.png',
// ];

List<String> texts = [
  'Scan',
  'GymFit Club',
  'Messages',
];



class _S1State extends State<S1> {
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AllEventBloc>(context).add(FetchAllEvent());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (welcome_sheet == widget.welcomeSheet) {
        _showModalBottomSheet(context);
      }
      if (otp_bottom_sheet == widget.otpBottomSheet) {
        showCustomBottomSheet(context);
      }
      if (profile_bottom_sheet == widget.profilebottomsheet) {
        staff_customer_id_BottomSheet(context);
      }
      if (admin_form_BottomSheet == widget.adminformBottomSheet) {
        admin_customer_id_BottomSheet(
          context,
        );
      }
      if (New_busineess_bottom_sheet == widget.Newbusineessbottomsheet) {
        New_busineess_BottomSheet(context);
      }
    });
  }
  void _handleRadioValueChange(int? value) {
    setState(() {
      selectedValue = value ?? 1;
    });
  }
  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              height: 534.h,
              decoration: BoxDecoration(
                color: Color(0xFF191919),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(2.r),
                  topRight: Radius.circular(2.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 32.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to Onlypass Captain App',
                      style: TextStyle(
                        color: const Color(0xFFE4E4E4),
                        fontSize: 16.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      "We couldn't find any account registered with the phone number. Select one of the below.",
                      style: TextStyle(
                        color: const Color(0xFF6F6F6F),
                        fontSize: 14.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 32.h),
                    CustomRadioButton_1(
                      text: 'I am a staff of a registered business',
                      isSelected: selectedValue == 1,
                      onSelect: (value) {
                        setModalState(() {
                          selectedValue = 1;
                        });
                        setState(() {
                          selectedValue = 1;
                        });
                      },
                      fontStyle: TextStyle(
                        color: selectedValue == 1
                            ? const Color(0xFF191919)
                            : const Color(0xFFFEFEFE),
                        fontSize: 14.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                      ),
                      description:
                      'Select your business from registered list of businesses with a name or code.',
                    ),
                    SizedBox(height: 24.h),
                    CustomRadioButton_1(
                      text: 'I am a new user.',
                      isSelected: selectedValue == 2,
                      onSelect: (value) {
                        setModalState(() {
                          selectedValue = 2;
                        });
                        setState(() {
                          selectedValue = 2;
                        });
                      },
                      fontStyle: TextStyle(
                        color: selectedValue == 2
                            ? const Color(0xFF191919)
                            : const Color(0xFFFEFEFE),
                        fontSize: 14.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                      ),
                      description: 'I would like to register my business.',
                    ),
                    SizedBox(height: 32.h),
                    Text(
                      'Use another phone number',
                      style: TextStyle(
                        color: const Color(0xFFFEFEFE),
                        fontSize: 14.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        decorationColor: const Color(0xFFFEFEFE),
                        letterSpacing: 0.28,
                      ),
                    ),
                    SizedBox(height: 38.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircularStepProgressIndicator(
                          totalSteps: 100,
                          currentStep: 50 + currentPage * 50,
                          stepSize: 0,
                          selectedColor: const Color(0xFF37F840),
                          unselectedColor: Colors.transparent,
                          width: 70.w,
                          height: 70.h,
                          selectedStepSize: 3,
                          child: GestureDetector(
                            onTap: () {
                              if (selectedValue == 1) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                        const Facilities_Search()));
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const Home(
                                          otpBottomSheet: false,
                                          welcomeSheet: false,
                                          profilebottomsheet: false,
                                          adminformBottomSheet: false,
                                          Newbusineessbottomsheet: true,
                                        )));
                              }
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 30.r,
                              child: CircleAvatar(
                                backgroundColor: const Color(0xFFFEFEFE),
                                radius: 30.r,
                                child: const Center(child: Icon(Icons.east)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
  ///   bottomNavigationBar   ///

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        notchMargin: 0,
        elevation: 0,
        color: Colors.black,
        height: 115.h,
        child: CarouselSlider.builder(
          carouselController: _controller,
          itemCount: 3,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  Center(
            child: GestureDetector(
              onTap: () {
                setState(() => _currentIndex = itemIndex);
                _controller.jumpToPage(itemIndex);
                HapticFeedback.lightImpact();
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: _currentIndex == itemIndex ? 30.r : 26.r,
                    backgroundColor: _currentIndex == itemIndex
                        ? Colors.white
                        : const Color(0xFF4D4D4D),
                    child: CircleAvatar(
                      radius: _currentIndex == itemIndex ? 29.r : 25.r,
                      backgroundColor: const Color(0xFF282828),
                      child: CircleAvatar(
                        radius: _currentIndex == itemIndex ? 27.r : 22.r,
                        backgroundColor: const Color(0xFF282828),
                        backgroundImage: _currentIndex == itemIndex
                            ? AssetImage(icons[itemIndex])
                            : AssetImage(icons[itemIndex]),
                        // child: _currentIndex == itemIndex
                        //     ? SizedBox(
                        //         height: 28.h,
                        //         width: 28.h,
                        //         child: Image.asset(
                        //           icons[itemIndex],
                        //           fit: BoxFit.cover,
                        //         ),
                        //       )
                        //     : SizedBox(
                        //         height: 23.h,
                        //         width: 23.h,
                        //         child: Image.asset(
                        //           icons[itemIndex],
                        //           fit: BoxFit.cover,
                        //         ),
                        //       ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    texts[itemIndex],
                    style: GoogleFonts.montserrat(
                      color: _currentIndex == itemIndex
                          ? Colors.white
                          : const Color(0xFF818181),
                      fontSize: _currentIndex == itemIndex ? 14.sp : 14.sp,
                      fontWeight: _currentIndex == itemIndex
                          ? FontWeight.w600
                          : FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          options: CarouselOptions(
            initialPage: 1,
            autoPlay: false,
            viewportFraction: 0.3785,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
                HapticFeedback.lightImpact();
              });
            },
            enlargeCenterPage: false,
            enableInfiniteScroll: false,
          ),
        ),
      ),
    );
  }
}
