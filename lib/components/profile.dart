import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData.dark(),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Profile'),
//         ),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () => _showProfileBottomSheet(context),
//             child: Text('Show Profile BottomSheet'),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _showProfileBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.black,
//       builder: (BuildContext context) {
//         return ProfileBottomSheet();
//       },
//     );
//   }
// }

class ProfileBottomSheet extends StatelessWidget {
  const ProfileBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 08.0.h),
      width: double.infinity.w,
      height: 628.h,
      decoration: BoxDecoration(color: Color(0xFF191919)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0.w),
              child: Center(
                child: Container(
                  width: 44.w,
                  height: 3.h,
                  decoration: ShapeDecoration(
                    color: Color(0xFF464646),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded,color: Color(0xFFFEFEFE),size: 16,),
                  onPressed: () => Navigator.pop(context),
                ),
                const Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.more_vert,color: Color(0xFFFEFEFE),),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Container(
              width: 96.w,
              height: 96.h,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icons/logo.png'),
                  fit: BoxFit.fill,
                ),
                shape: OvalBorder(),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0.w),
              child: Text(
                'Shafeek Ahmed',
                style: TextStyle(
                  color: Color(0xFFFDFDFD),
                  fontSize: 16.sp,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: ShapeDecoration(
                        color: Color(0xFF272727),
                        shape: OvalBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.call_outlined,color: Color(0xFFFEFEFE),),
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Call',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: const ShapeDecoration(
                        color: Color(0xFF272727),
                        shape: OvalBorder(),
                      ),
                      child: IconButton(
                        icon: Image.asset('assets/icons/messageW.png',height: 20,width: 20,),
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Message',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: ShapeDecoration(
                        color: Color(0xFF272727),
                        shape: OvalBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.email_outlined,color: Color(0xFFFEFEFE),),
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Email',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Member activities',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ChoiceChip(
                  label: Text('All'),
                  selected: true,
                ),
                ChoiceChip(
                  label: Text('Attendance'),
                  selected: false,
                ),
                ChoiceChip(
                  label: Text('Payments'),
                  selected: false,
                ),
              ],
            ),
            SizedBox(height: 16),
            MemberActivityCard(
              date: 'Feb 14',
              day: 'Wed',
              checkIn: '07:32 pm',
              checkOut: '08:45 pm',
              spend: '01:13 Hrs.',
            ),
            MemberActivityCard(
              date: 'Feb 14',
              day: 'Wed',
              item: '3 Months Membership',
              amount: '1899.00',
            ),
          ],
        ),
      ),
    );
  }
}

class MemberActivityCard extends StatelessWidget {
  final String date;
  final String day;
  final String? checkIn;
  final String? checkOut;
  final String? spend;
  final String? item;
  final String? amount;

  MemberActivityCard({
    required this.date,
    required this.day,
    this.checkIn,
    this.checkOut,
    this.spend,
    this.item,
    this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[850],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      date,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(day),
                  ],
                ),
                Spacer(),
                if (checkIn != null && checkOut != null && spend != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Check-in: $checkIn'),
                      Text('Check-out: $checkOut'),
                      Text('Spend: $spend'),
                    ],
                  ),
                if (item != null && amount != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Item: $item'),
                      Text('Amount: \$${amount}'),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
