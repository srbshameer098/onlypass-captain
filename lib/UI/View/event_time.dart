import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'event_location.dart';

class EventTime extends StatefulWidget {
  const EventTime({super.key});

  @override
  State<EventTime> createState() => _EventTimeState();
}

class _EventTimeState extends State<EventTime> {
  DateTime? fromDate;
  TimeOfDay? fromTime;
  DateTime? untilDate;
  TimeOfDay? untilTime;
  bool repeatOn = false;
  DateTime? endDate = DateTime(2024, 8, 17);
  List<bool> selectedDays = [true, true, true, true, false, true, false];

  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isFromDate) {
          fromDate = picked;
        } else {
          untilDate = picked;
        }
      });
    }
  }

  Future<void> _selectTime(BuildContext context, bool isFromTime) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (isFromTime) {
          fromTime = picked;
        } else {
          untilTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1B1B1B),

      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 25, top: 10, bottom: 10),
            child: Container(
              width: 37.59.w,
              height: 37.59.h,
              decoration: ShapeDecoration(
                color: const Color(0xFF282828),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.r)),
              ),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ),
        backgroundColor: Color(0xFF1B1B1B),
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Create an event',
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Center(
                child: Image.asset(
              'assets/icons/fi-rr-menu-dots-vertical.png',
              height: 24.h,
              width: 26.w,
            )),
          )
        ],
      ),
      // floatingActionButton: CircularStepProgressIndicator(
      //   totalSteps: 100,
      //   currentStep: 60,
      //   stepSize: 0,
      //   selectedColor: Color(0xFF37F840),
      //   unselectedColor: Colors.transparent,
      //   width: 85.w,
      //   height: 85.h,
      //   selectedStepSize: 5,
      //   roundedCap: (_, __) => false,
      //   child: GestureDetector(
      //     onTap: () {
      //       Navigator.push(
      //           context, MaterialPageRoute(builder: (_) => EventLocation()));
      //     },
      //     child: CircleAvatar(
      //       backgroundColor: Colors.transparent,
      //       radius: 33.r,
      //       child: CircleAvatar(
      //         backgroundColor: Color(0xFFFEFEFE),
      //         radius: 32.r,
      //         child: Center(child: Icon(Icons.east)),
      //       ),
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.h,
              ),
              Text(
                'From',
                style: GoogleFonts.montserrat(
                  color: Color(0xFFE4E4E4),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(0.w),
                        width: 180,
                        height: 48,
                        decoration: ShapeDecoration(
                          color: Color(0xFF282828),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1)),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.calendar_today,
                                color: Colors.white,
                                size: 20,
                              ),
                              onPressed: () => _selectDate(context, true),
                            ),
                            Expanded(
                              child: TextFormField(
                                readOnly: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: GoogleFonts.montserrat(
                                    color: Color(0xFF818181),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  hintText: fromDate == null
                                      ? 'Date'
                                      : DateFormat('dd/MM/yyyy')
                                          .format(fromDate!),
                                ),
                                onTap: () => _selectDate(context, true),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(0.w),
                        width: 180,
                        height: 48,
                        decoration: ShapeDecoration(
                          color: Color(0xFF282828),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1)),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.schedule_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                              onPressed: () => _selectTime(context, true),
                            ),
                            Expanded(
                              child: TextFormField(
                                readOnly: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: GoogleFonts.montserrat(
                                    color: Color(0xFF818181),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  hintText: fromTime == null
                                      ? 'Time'
                                      : fromTime!.format(context),
                                ),
                                onTap: () => _selectTime(context, true),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Until',
                style: GoogleFonts.montserrat(
                  color: Color(0xFFE4E4E4),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(0.w),
                        width: 180,
                        height: 48,
                        decoration: ShapeDecoration(
                          color: Color(0xFF282828),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1)),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.calendar_today,
                                color: Colors.white,
                                size: 20,
                              ),
                              onPressed: () => _selectDate(context, false),
                            ),
                            Expanded(
                              child: TextFormField(
                                readOnly: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: GoogleFonts.montserrat(
                                    color: Color(0xFF818181),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  hintText: untilDate == null
                                      ? 'Date'
                                      : DateFormat('dd/MM/yyyy')
                                          .format(untilDate!),
                                ),
                                onTap: () => _selectDate(context, false),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(0.w),
                        width: 180,
                        height: 48,
                        decoration: ShapeDecoration(
                          color: Color(0xFF282828),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1)),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.schedule_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                              onPressed: () => _selectTime(context, false),
                            ),
                            Expanded(
                              child: TextFormField(
                                readOnly: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: GoogleFonts.montserrat(
                                    color: Color(0xFF818181),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  hintText: untilTime == null
                                      ? 'Time'
                                      : untilTime!.format(context),
                                ),
                                onTap: () => _selectTime(context, false),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
              //   child: Text(
              //     'From',
              //     style: GoogleFonts.montserrat(
              //       color: Color(0xFFE4E4E4),
              //       fontSize: 14.sp,
              //       fontWeight: FontWeight.w600,
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 08.0.h),
              //   child: Center(
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Container(
              //           width: 180.w,
              //           height: 48.h,
              //           decoration: ShapeDecoration(
              //             color: Color(0xFFFEFEFE),
              //             shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(1.r)),
              //           ),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             crossAxisAlignment: CrossAxisAlignment.center,
              //             children: [
              //               Container(
              //                 width: 12.w,
              //                 height: 12.h,
              //                 decoration: ShapeDecoration(
              //                   shape: OvalBorder(
              //                     side: BorderSide(
              //                         width: 3.w, color: Color(0xFF00FF00)),
              //                   ),
              //                 ),
              //               ),
              //               SizedBox(
              //                 width: 8.w,
              //               ),
              //               Text(
              //                 'Create an event',
              //                 style: GoogleFonts.montserrat(
              //                   color: Color(0xFF191919),
              //                   fontSize: 12.sp,
              //                   fontWeight: FontWeight.w500,
              //                 ),
              //               )
              //             ],
              //           ),
              //         ),
              //         // SizedBox(width: 16.w,),
              //         Container(
              //           width: 180.w,
              //           height: 48.h,
              //           decoration: ShapeDecoration(
              //             color: Color(0xFF282828),
              //             shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(1)),
              //           ),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             crossAxisAlignment: CrossAxisAlignment.center,
              //             children: [
              //               Container(
              //                 width: 12.w,
              //                 height: 12.h,
              //                 decoration: ShapeDecoration(
              //                   shape: OvalBorder(
              //                     side: BorderSide(
              //                         width: 1.w, color: Color(0xFFFEFEFE)),
              //                   ),
              //                 ),
              //               ),
              //               SizedBox(
              //                 width: 8.w,
              //               ),
              //               Text(
              //                 'Create a class',
              //                 style: GoogleFonts.montserrat(
              //                   color: Color(0xFF6F6F70),
              //                   fontSize: 12.sp,
              //                   fontWeight: FontWeight.w500,
              //                 ),
              //               )
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 12.h),
              //   child: Text(
              //     'Event name',
              //     style: GoogleFonts.montserrat(
              //       color: Color(0xFFE4E4E4),
              //       fontSize: 14.sp,
              //       fontWeight: FontWeight.w600,
              //     ),
              //   ),
              // ),
              // Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 12.h),
              //     child: Container(
              //       width: double.infinity,
              //       height: 48.h,
              //       decoration: ShapeDecoration(
              //         color: Color(0xFF282828),
              //         shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(1.r)),
              //       ),
              //       child: TextFormField(
              //         style: GoogleFonts.montserrat(
              //           color: Colors.white,
              //           fontSize: 14.sp,
              //           fontWeight: FontWeight.w500,
              //         ),
              //         decoration: InputDecoration(
              //           suffix: SizedBox(
              //             width: 10.w,
              //           ),
              //           border: InputBorder.none,
              //           hintText: 'Enter what do you want to call this event',
              //           hintStyle: GoogleFonts.montserrat(
              //             color: Color(0xFF6F6F70),
              //             fontSize: 12.sp,
              //             fontWeight: FontWeight.w500,
              //           ),
              //           prefix: SizedBox(
              //             width: 16.w,
              //           ),
              //         ),
              //       ),
              //     )),
              //-----------\\

              Text(
                'Advanced settings',
                style: GoogleFonts.montserrat(
                  color: Color(0xFFE4E4E4),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(3.w),
                    width: 20.w,
                    height: 20.h,
                    child: Checkbox(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
                      checkColor: Colors.white,
                      activeColor: Color(0xFF282828),
                        value: repeatOn,
                        onChanged: (value) {
                          setState(() {
                            repeatOn = value!;
                          });
                        }),
                  ),
                  SizedBox(width: 8.sp),
                  Text(
                    'Repeat on',
                    style: GoogleFonts.montserrat(
                      color: Color(0xFFFEFEFE),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 8.sp),
                  Container(
                    width: 82,
                    height: 32,
                    decoration: ShapeDecoration(
                      color: Color(0xFF282828),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
                    ),
                    child: Center(
                      child: Text(
                        'Days',
                        style: GoogleFonts.montserrat(
                          color: Color(0x80FFFFFF),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ), SizedBox(width: 13.sp),
                  Text(
                    'Ends on',
                    style: GoogleFonts.montserrat(
                      color: Color(0xFFFEFEFE),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(0.w),
                      width: 124,
                      height: 32,
                      decoration: ShapeDecoration(
                        color: Color(0xFF282828),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          SizedBox(
                            height: 15.h,width: 70,
                          child: TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle:  GoogleFonts.montserrat(
                                color: Color(0xFFFEFEFE),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              hintText: endDate == null
                                  ? 'Select Date'
                                  : DateFormat('dd/MM/yyyy').format(endDate!),
                            ),
                            onTap: () => _selectDate(context, false),
                          ),
                        ),
                          SizedBox(width: 10),
                          GestureDetector(
                            child: Icon(Icons.calendar_today,color: Colors.grey,size: 14,),
                            onTap: () => _selectDate(context, false),
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Wrap(

                alignment: WrapAlignment.start,
                spacing: 7,
                children: List.generate(7, (index) {
                  return FilterChip(
                    shadowColor: Colors.transparent,
                    elevation: 0,
                    surfaceTintColor: Colors.transparent,
                    labelPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    showCheckmark: false,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                    backgroundColor:
                    // selectedDays[index] ? Colors.blue :
                    Color(0xFF282828),
                    label: Text(
                        ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][index]
                    ),
                    selectedColor: Colors.white,
                    selected: selectedDays[index],
                    labelStyle:
                    selectedDays[index] ? GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ) :
                    GoogleFonts.montserrat(
                      color: Color(0xFFAFAFAF),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    side: BorderSide(color: Colors.transparent),
                    onSelected: (bool selected) {
                      setState(() {
                        selectedDays[index] = selected;
                      });
                    },
                  );
                }),
              ),


              SizedBox(
                height: 100.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
