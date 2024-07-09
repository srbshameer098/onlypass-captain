import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OpeningHours extends StatefulWidget {
  const OpeningHours({Key? key}) : super(key: key);

  @override
  State<OpeningHours> createState() => _OpeningHoursState();
}

class _OpeningHoursState extends State<OpeningHours> {
  bool _sundayOpen = false;
  bool _mondayOpen = false;
  bool _tuesdayOpen = false;
  bool _sundayClose = false;
  final _formKey = GlobalKey<FormState>();

  List<String> img_name = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",

  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 13.w,vertical: 8.h
      ),
      width: double.infinity.w,
      height: 600.h,
      decoration: BoxDecoration(
        color: Color(0xFF191919),
        border: Border.fromBorderSide(
          BorderSide(color: Color(0xFF111416)),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: 48,
                height: 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Color(0xff000000))),
            SizedBox(
              height: 8.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 32.w,
                    height: 32.h,
                    decoration: ShapeDecoration(
                      color: Color(0xFF282828),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.r)),
                    ),
                    child: Icon(Icons.arrow_back_ios_rounded,color: Colors.white,size: 16,),
                  ),
                ),
                Text(
                  'Opening hours',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  width: 32.w,
                  height: 32.h,
                ),
              ],
            ),

            SizedBox(
              height: 32.h,
            ),
            Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: 30.h),
                  child: Row(
                    children: [
                      SizedBox(width: 173.w,
                        child: Text(
                          'Morning',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 13.w,
                      ),
                      SizedBox(width:173.w,
                        child: Text(
                          'Evening',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: 24.h),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          /// List 1 Morning  ///

                          SizedBox(
                            height: 1150,
                            width: 190,
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(
                                    parent: NeverScrollableScrollPhysics()),
                                itemCount: 7,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xFF282828),
                                          // border: Border.all(
                                          //     width: .5, color: Color(0xff6f6f70))
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 70,
                                                child: Text(
                                                  img_name[index],
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Text(
                                                'Open',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              SwitchScreen(),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: .5,
                                                color: Color(0xffffffff))),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 5),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 70,
                                                child: Text(
                                                  '06:00 PM',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 73,
                                              ),
                                              Icon(
                                                Icons.access_time_outlined,
                                                color: Colors.white,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: .5,
                                                color: Color(0xffffffff))),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 5),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 70,
                                                child: Text(
                                                  '12:00 AM',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 73,
                                              ),
                                              Icon(
                                                Icons.access_time_outlined,
                                                color: Colors.white,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 24,
                                      )
                                    ],
                                  );
                                }),
                          ),

                          SizedBox(
                            width: 13,
                          ),

                          /// List 2 Evening  ///

                          SizedBox(
                            height: 1150,
                            width: 190,
                            child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(
                                    parent: NeverScrollableScrollPhysics()),
                                itemCount: 7,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xFF282828),
                                          // border: Border.all(
                                          //     width: .5, color: Color(0xff6f6f70))
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 70,
                                                child: Text(
                                                  img_name[index],
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Text(
                                                'Open',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              SizedBox(width: 4),
                                              SwitchScreen(),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: .5,
                                                color: Color(0xffffffff))),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 5),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 70,
                                                child: Text(
                                                  '06:00 PM',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 73,
                                              ),
                                              Icon(
                                                Icons.access_time_outlined,
                                                color: Colors.white,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: .5,
                                                color: Color(0xffffffff))),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 5),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 70,
                                                child: Text(
                                                  '12:00 AM',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 73,
                                              ),
                                              Icon(
                                                Icons.access_time_outlined,
                                                color: Colors.white,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 24,
                                      )
                                    ],
                                  );
                                }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SwitchScreen extends StatefulWidget {
  @override
  SwitchClass createState() => new SwitchClass();
}

class SwitchClass extends State {
  bool isSwitched = true;
  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Transform.scale(
          scale: 0.7,
          child: Switch(
            onChanged: toggleSwitch,
            value: isSwitched,
            activeColor: Colors.white,
            inactiveThumbColor: Color(0xff282828),
            autofocus: isSwitched,
            activeTrackColor: Color(0xff48ff00),
            // inactiveThumbColor: Colors.white,
            inactiveTrackColor: Color(0xffff0101),
          )),
    ]);
  }
}
