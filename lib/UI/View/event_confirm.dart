import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../BloC/Event_Creation/event_bloc.dart';
import '../../Repository/Model_Class/Event_model.dart';
import '../s1.dart';
import 'create_event.dart';

class EventConfirm extends StatefulWidget {
  const EventConfirm({super.key});

  @override
  State<EventConfirm> createState() => _EventConfirmState();
}

late EventModel data;

class _EventConfirmState extends State<EventConfirm> {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventBloc(),
  child: Scaffold(
      // backgroundColor: Color(0xFF1B1B1B),
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
                eventController.text,
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
                          eventCategoryController.text,
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
                          dropdownValue == ('Free') ? 'Free' : 'Paid',
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
                            fontSize: 14.sp,
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
                'Gym Fit Club, 3rd Floor - GCDA Building, Kalloor, Ernakulam, Kerala - 678 052',
                style: GoogleFonts.montserrat(
                  color: Color(0xFFFEFEFE),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            SizedBox(height: 35.h,),

            Padding(
              padding:
              EdgeInsets.only(left: 0.w, right: 0.w, top: 10.h, bottom: 40.h),
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


                  BlocListener<EventBloc, EventState>(
                    listener: (context, state) {
                      if (state is EventBloCLoading) {
                        // Handle loading state
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (_) => Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else if (state is EventBLoCLoaded) {
                        // Handle success state
                        Navigator.pop(context); // Close the dialog
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Event created successfully!'),
                          ),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CreateEvent()),
                        );
                      } else if (state is EventBloCError) {
                        // Handle failure state
                        Navigator.pop(context); // Close the dialog
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Event creation failed!'),
                          ),
                        );
                      }
                    },
                    child: Expanded(
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: Color(0xFF191919),
                                shape:
                                Border.all(color: Colors.transparent, width: 0),
                                title: Container(
                                  // width: 375,
                                  // height: 300,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 90.w, vertical: 50.h),
                                  decoration:
                                  const BoxDecoration(color: Color(0xFF191919)),
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center,
                                      children: [
                                        Container(
                                          width: 72,
                                          height: 72,
                                          decoration: ShapeDecoration(
                                            color: Color(0xFF272727),
                                            shape: OvalBorder(),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.check_rounded,
                                              color: Color(0xFF37F840),
                                              size: 50,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 12.h,
                                        ),
                                        Text(
                                          'success!',
                                          style: GoogleFonts.montserrat(
                                            color: Colors.white,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 12.h,
                                        ),
                                        SizedBox(
                                          width: 200,
                                          child: Text(
                                            'Event has been created successfully.',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.montserrat(
                                              color: Colors.white,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                          // BlocListener<EventBloc, EventState>(
                          //   listener: (context, state) {
                          //     if (state is EventBloCLoading) {
                          //       print('loading');
                          //       const Center(
                          //         child: CircularProgressIndicator(),
                          //       );
                          //     }
                          //
                          //     if (state is EventBLoCLoaded) {
                          //       BlocProvider.of<EventBloc>(context).add(FetchEvent(
                          //           name: 'name',
                          //           facility: 'facility',
                          //           description: 'description',
                          //           image: 'image',
                          //           eventLeader: 'eventLeader',
                          //           startDate: 'startDate',
                          //           endDate: 'endDate',
                          //           fee: false,
                          //           amount: 'amount',
                          //           availableSlot: 'availableSlot',
                          //           repeatEndDate: 'repeatEndDate',
                          //           repetDays: ['repetDays', 'fgd'],
                          //           eventAddress: 'eventAddress',
                          //           eventLat_Long: 'eventLat_Long',
                          //           id: 'id',
                          //           createdAt: 'createdAt',
                          //           updatedAt: 'updatedAt',
                          //           v: 'v')
                          //
                          //
                          //       );
                          //
                          //       print(
                          //           'loaded*************************************************');
                          //       Navigator.of(context).pop();
                          //     }
                          //     if (state is EventBloCError) {
                          //       Center(child: Text('Oops Something Went Wrong'));
                          //       print('error');
                          //     }
                          //     // TODO: implement listener
                          //   },);
                          BlocProvider.of<EventBloc>(context).add(FetchEvent(
                              name: 'name',
                              facility: 'facility',
                              description: 'description',
                              image: 'image',
                              eventLeader: 'eventLeader',
                              startDate: 'startDate',
                              endDate: 'endDate',
                              fee: false,
                              amount: 'amount',
                              availableSlot: 'availableSlot',
                              repeatEndDate: 'repeatEndDate',
                              repetDays: ['repetDays', 'fgd'],
                              eventAddress: 'eventAddress',
                              eventLat_Long: 'eventLat_Long',
                              id: 'id',
                              createdAt: 'createdAt',
                              updatedAt: 'updatedAt',
                              v: 'v'));

                          // print(data);
                        },
                        child: Container(
                          height: 48,
                          decoration: ShapeDecoration(
                            color: Color(0xFFFEFEFE),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(1)),
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
