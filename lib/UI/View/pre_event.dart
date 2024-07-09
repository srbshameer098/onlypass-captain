import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PreEvent extends StatefulWidget {
  final String text;
  final String img;

  const PreEvent({super.key, required this.text, required this.img});

  @override
  State<PreEvent> createState() => _PreEventState();
}

class _PreEventState extends State<PreEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        forceMaterialTransparency: true,
       title:  Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           GestureDetector(
             onTap: () {
               Navigator.pop(context);
             },
             child: Container(
               width: 38.w,
               height: 38.h,
               decoration: ShapeDecoration(
                 color: Color(0xFF282828),
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.r)),
               ),
               child: Icon(Icons.arrow_back_ios_rounded,color: Colors.white,size: 16,),
             ),
           ),

           Row(
             children: [
               GestureDetector(
                 onTap: () {
                   Navigator.pop(context);
                 },
                 child: Container(
                   width: 38.w,
                   height: 38.h,
                   decoration: ShapeDecoration(
                     color: Color(0xFF282828),
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.r)),
                   ),
                   child: Icon(Icons.share,color: Colors.white,size: 16,),
                 ),
               ),
               SizedBox(width: 16,),
               GestureDetector(
                 onTap: () {
                   Navigator.pop(context);
                 },
                 child: Container(
                   width: 38.w,
                   height: 38.h,
                   decoration: ShapeDecoration(
                     color: Color(0xFF282828),
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.r)),
                   ),
                   child: Icon(CupertinoIcons.square_pencil,color: Colors.white,size: 16,),
                 ),
               ),
             ],
           ),
         ],
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
                SizedBox(
                  height: 280.h,
                  width: double.infinity,
                  child: Image.asset(
                    widget.img,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 25.w, vertical: 32.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.text,
                        style:  TextStyle(
                          color: Color(0xFFFEFEFE),
                          fontSize: 18.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                       SizedBox(
                        height: 16.h,
                      ),
                       Text(
                        'This class is great for beginners or those who want a more relaxing practice. It focuses on is stretching and strengthening the body.',
                        style: TextStyle(
                          color: const Color(0xFF6F6F70),
                          fontSize: 16.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                       SizedBox(
                        height: 32.h,
                      ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Date and time',
                            style: TextStyle(
                              color: Color(0xFFA3A3A3),
                              fontSize: 14.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                          Text(
                            'view schedule',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xFFA3A3A3),
                              fontSize: 14.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                       Row(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_month_outlined,
                                color: Color(0xFFA3A3A3),
                                size: 20,
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Text(
                                '22- 07- 2023, Saturday',
                                style: TextStyle(
                                  color: Color(0xFF6F6F70),
                                  fontSize: 14.sp,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                           SizedBox(
                            width: 24,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.access_time,
                                  color: Color(0xFFA3A3A3),
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 15.w,
                                ),
                                Text(
                                  '10.30 AM',
                                  style: TextStyle(
                                    color: Color(0xFF6F6F70),
                                    fontSize: 14.sp,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_month_outlined,
                                color: Color(0xFFA3A3A3),
                                size: 20,
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Text(
                                '22- 07- 2023, Saturday',
                                style: TextStyle(
                                  color: Color(0xFF6F6F70),
                                  fontSize: 14.sp,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 24.w,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.access_time,
                                  color: Color(0xFFA3A3A3),
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 15.w,
                                ),
                                Text(
                                  '12.30 AM',
                                  style: TextStyle(
                                    color: Color(0xFF6F6F70),
                                    fontSize: 14.sp,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Location',
                            style: TextStyle(
                              color: Color(0xFFA3A3A3),
                              fontSize: 14.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                          Text(
                            'See on map',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xFFA3A3A3),
                              fontSize: 14.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                       children: [
                         Icon(Icons.location_on_outlined,color: Color(0xFF6F6F70),size: 20,),
                         SizedBox(
                           width: 15.w,
                         ),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Text(
                               'gymFit Club - Yoga Hall',
                               style: TextStyle(
                                 color: Color(0xFF6F6F70),
                                 fontSize: 14.sp,
                                 fontFamily: 'Montserrat',
                                 fontWeight: FontWeight.w500,
                               ),
                             ),
                             Text(
                               'thazhthangadi Road, areekode -  673639',
                               style: TextStyle(
                                 color: Color(0xFF6F6F70),
                                 fontSize: 14.sp,
                                 fontFamily: 'Montserrat',
                                 fontWeight: FontWeight.w400,
                               ),
                             )
                           ],
                         )
                       ],
                     ),
                      const SizedBox(
                        height: 32,
                      ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Entry tickets',
                            style: TextStyle(
                              color: Color(0xFFA3A3A3),
                              fontSize: 14.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                          Text(
                            'multiple options',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xFFA3A3A3),
                              fontSize: 14.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
