import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled7/BloC/Event_Creation/event_bloc.dart';

class EventConfirm extends StatefulWidget {
  final String name;
  final String category;
  final bool type;
  final String startDateAndTime;
  final String endDateAndTime;

  const EventConfirm({
    super.key,
    required this.name,
    required this.category,
    required this.type,
    required this.startDateAndTime,
    required this.endDateAndTime,
  });

  @override
  State<EventConfirm> createState() => _EventConfirmState();
}

class _EventConfirmState extends State<EventConfirm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF191919),
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
          'Create an event or class',
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
            child: Center(
                child: Image.asset(
                  'assets/icons/fi-rr-menu-dots-vertical.png',
                  height: 24.h,
                  width: 26.w,
                )),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 25.w,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 40.h),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: ShapeDecoration(
                    color: Color(0xFF282828),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image_outlined,
                        color: Colors.white,
                        size: 24,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                          Text(
                            'Add images',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              color: Color(0xFFFEFEFE),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.grid_view_outlined,
                    color: Color(0xFF818181),
                    size: 12,
                  ),
                  SizedBox(
                    width: 8.h,
                  ),
                  Text(
                    'Event name',
                    style: GoogleFonts.montserrat(
                      color: Color(0xFF818181),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.h, bottom: 32.h),
                child: Text(
                  'Yoga with Arun Master & team - Beginner level',
                  style: GoogleFonts.montserrat(
                    color: Color(0xFFFEFEFE),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.grid_view_outlined,
                              color: Color(0xFF818181),
                              size: 12,
                            ),
                            SizedBox(
                              width: 8.h,
                            ),
                            Text(
                              'Event category',
                              style: GoogleFonts.montserrat(
                                color: Color(0xFF818181),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 12.h, bottom: 32.h),
                          child: Text(
                            'Yoga',
                            style: GoogleFonts.montserrat(
                              color: Color(0xFFFEFEFE),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            RotatedBox(
                              quarterTurns: 1, // rotate 90 degrees
                              child: Icon(
                                Icons.confirmation_num_outlined,
                                color: Color(0xFF818181),
                                size: 12,
                              ),
                            ),
                            SizedBox(
                              width: 8.h,
                            ),
                            Text(
                              'Entry type',
                              style: GoogleFonts.montserrat(
                                color: Color(0xFF818181),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 12.h, bottom: 32.h),
                          child: Text(
                            'Paid',
                            style: GoogleFonts.montserrat(
                              color: Color(0xFFFEFEFE),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month_rounded,
                              color: Color(0xFF818181),
                              size: 12,
                            ),
                            SizedBox(
                              width: 8.h,
                            ),
                            Text(
                              'Start date and time',
                              style: GoogleFonts.montserrat(
                                color: Color(0xFF818181),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 12.h, bottom: 32.h),
                          child: Text(
                            '13/07/2024 Sat  3.30 pm',
                            style: GoogleFonts.montserrat(
                              color: Color(0xFFFEFEFE),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month_rounded,
                              color: Color(0xFF818181),
                              size: 12,
                            ),
                            SizedBox(
                              width: 8.h,
                            ),
                            Text(
                              'End date and time',
                              style: GoogleFonts.montserrat(
                                color: Color(0xFF818181),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 12.h, bottom: 32.h),
                          child: Text(
                            '13/07/2024 Sat  4.00 pm',
                            style: GoogleFonts.montserrat(
                              color: Color(0xFFFEFEFE),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Color(0xFF818181),
                    size: 12,
                  ),
                  SizedBox(
                    width: 8.h,
                  ),
                  Text(
                    'Venue address',
                    style: GoogleFonts.montserrat(
                      color: Color(0xFF818181),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.h, bottom: 32.h),
                child: Text(
                  'Gym Fit Club, 3rd Floor - GCDA Building, Kalloor, Ernakulam, Kerala - 678 052',
                  style: GoogleFonts.montserrat(
                    color: Color(0xFFFEFEFE),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h, bottom: 40.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 48,
                          decoration: ShapeDecoration(
                            color: Color(0xFF282828),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(1)),
                          ),
                          child: Center(
                            child: Text(
                              'Cancel',
                              style: GoogleFonts.poppins(
                                color: Color(0xFF818181),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    Expanded(
                      child: BlocProvider(
                        create: (context) => EventBloc(),
                        child: Builder(
                          builder: (context) {
                            return GestureDetector(
                              onTap: () {
                                BlocProvider.of<EventBloc>(context).add(
                                  FetchEvent(
                                    name:widget.name,
                                    facility: '661e35c10e43c36ac5d468d0',
                                    description: 'Join our intense bootcamp workout!',
                                    image: '',
                                    eventLeader: 'Coach Alex',
                                    startDate: widget.startDateAndTime,
                                    endDate: widget.startDateAndTime,
                                    fee: widget.type,
                                    amount: '25',
                                    availableSlot: '20',
                                    repeatEndDate: '2024-08-15',
                                    repetDays: ["Monday", "Wednesday", "Friday"],
                                    eventAddress: '123 Fitness Street, City',
                                    eventLat_Long: '40.7128, -74.0060',
                                    id: '661e35c10e43c36ac5d468d0',
                                    createdAt: '2024-07-10T10:00:00Z',
                                    updatedAt: '2024-07-15T15:30:00Z',
                                    v: '1',
                                  ),
                                );
                                if (kDebugMode) {
                                  print('hi #############################    ############    ######################   #########');
                                }
                              },
                              child: Container(
                                height: 48,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFFEFEFE),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(1),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Confirm',
                                    style: GoogleFonts.poppins(
                                      color: Color(0xFF191919),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}