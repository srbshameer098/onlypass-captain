import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TP3 extends StatefulWidget {
  const TP3({super.key});

  @override
  State<TP3> createState() => _TP3State();
}

class _TP3State extends State<TP3> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Test page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Test page',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
            Text('Test page',
              style: GoogleFonts.montserrat(
                  fontSize: 24
              ),
            ),
            Text('Test page',
              style: TextStyle(
                  fontSize: 24.sp
              ),
            ),

          ],
        ),
      ),
    );
  }
}
