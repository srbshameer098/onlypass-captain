import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'View/home.dart';
import 'View/message_page.dart';
import 'View/scan_page.dart';


class S1 extends StatefulWidget {
  const S1({super.key});

  @override
  State<S1> createState() => _S1State();
}

int _currentIndex = 1;

final List<Widget?> _pages = [
  const ScanPage(),
  const Home(),
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
                      fontSize: _currentIndex == itemIndex ? 12.sp : 11.sp,
                      fontWeight: _currentIndex == itemIndex
                          ? FontWeight.w600
                          : FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          options: CarouselOptions(
            initialPage: 1,
            autoPlay: false,            viewportFraction: 0.285,

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
