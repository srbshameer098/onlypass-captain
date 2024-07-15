import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled7/UI/View/home.dart';
import 'package:untitled7/UI/View/wallet.dart';

import '../../components/Bottom Sheets/Staff-login OTP.dart';

class Facilities_Search extends StatefulWidget {
  const Facilities_Search({super.key});

  @override
  State<Facilities_Search> createState() => _Facilities_SearchState();
}


class _Facilities_SearchState extends State<Facilities_Search> {
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
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Color(0xFF191919),
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Select your business',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 30.w),
            child: Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 40.h),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Search Container  ///

              Container(
                width: double.infinity,
                height: 48.h,
                padding: EdgeInsets.all(2),
                decoration: ShapeDecoration(
                  color: Color(0xFF282828),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1.r)),
                ),
                child: TextField(
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.search,
                  cursorColor: Colors.white,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: Color(0xFF6F6F70),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        height: 0.08.h,
                        letterSpacing: -0.32,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 28.sp,
                      )),
                ),
              ),
        SizedBox(height: 32.h,),
              Text(
                'Search results',
                style: TextStyle(
                  color: Color(0xFF818181),
                  fontSize: 14.sp,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,

                ),
              ),
        ///  list Column ///
              Column(
                children: [
        SizedBox(height:24.h ,),
                  SizedBox(
                    height: 70.h * 4.h,
                    child: GestureDetector(
                      onTap: (){


                        Navigator.push(context, MaterialPageRoute(builder: (_)=>  Home(otpBottomSheet: true, welcomeSheet: false, profilebottomsheet: false, adminformBottomSheet: false, Newbusineessbottomsheet: false, )));

                      },
                      child: ListView.separated(
                        physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
                          itemCount: 4,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              leading: Container(
                                width: 44.w,
                                height: 44.h,
                                decoration: ShapeDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/icons/logo.png'),
                                    fit: BoxFit.fill,
                                  ),
                                  shape: OvalBorder(),
                                ),
                              ),
                              title: Text('Fitness Mate, Aluva',
                                  style: TextStyle(
                                    color: Color(0xFFFEFEFE),
                                    fontSize: 14.sp,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w400,

                                  ),),
                              subtitle:  Text(
                                'A047523',
                                style: TextStyle(
                                  color: Color(0xFF818181),
                                  fontSize: 12.sp,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,

                                ),
                              ),




                            );

                          }, separatorBuilder: (context, index) => Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        height: 16.h,
                        child: const Divider(color: Color(0xFF282828),),
                      ),),
                    ),

                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 16.w),
                    child: const Divider(color: Color(0xFF282828),),
                  ),
              SizedBox(height: 12.h,),
                  Center(
                    child: Text(
                      'No more data available',
                      style: TextStyle(
                        color: const Color(0xFF818181),
                        fontSize: 14.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,

                      ),
                    ),
                  ),

                ],
              ),





            ],
          ),
        ),
      ),
    );
  }
}
