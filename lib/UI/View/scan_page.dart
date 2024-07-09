import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../components/Bottom Sheets/bottomsheet.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanState();
}

class _ScanState extends State<ScanPage> {
  Barcode? result;
  QRViewController? controller;
  final TextEditingController _textController = TextEditingController();

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      // appBar: _buildAppBar(),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 1.h,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(1.00, 0.00),
            end: Alignment(-1, 0),
            colors: [
              Color(0x00191919),
              Color(0xFF737373),
              Color(0x00191919)
            ],
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Stack(
              alignment: Alignment.center,
              children: [
                _buildQrView(context),
                Positioned(
                  top: 510.h,
                  child: _buildFlashButton(),
                ),
              ],
            ),
          ),
          _buildSearchBar(),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: _buildBackButton(),
      actions: [_buildMenuButton()],
    );
  }

  Widget _buildBackButton() {
    return Padding(
      padding: EdgeInsets.all(8.0.w),
      child: Container(
        width: 37.59.w,
        height: 37.59.h,
        decoration: ShapeDecoration(
          color: const Color(0xFF282828),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.r),
          ),
        ),
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildMenuButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 5.w),
      child: Center(
        child: Image.asset(
          'assets/icons/fi-rr-menu-dots-vertical.png',
          height: 24.h,
          width: 26.w,
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400.w ||
            MediaQuery.of(context).size.height < 400.h)
        ? 310.0.w
        : 205.0.w;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewControllerCreated,
      overlay: QrScannerOverlayShape(
        overlayColor: const Color.fromRGBO(0, 0, 0, 80),
        borderColor: const Color(0xFF00FF00),
        borderRadius: 0.3.r,
        borderLength: 40.w,
        borderWidth: 5.w,
        cutOutSize: scanArea,
      ),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewControllerCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });

    // Flag to track if a QR code is being processed
    bool isProcessingQR = false;

    controller.scannedDataStream.listen((scanData) async {
      if (isProcessingQR) return; // Prevent multiple bottom sheets

      isProcessingQR = true;

      try {
        // Pause the camera to avoid redundant scans
        await controller.pauseCamera();

        setState(() {
          result = scanData;
        });

        // Show modal bottom sheet with proper dismissal handling
        await showModalBottomSheet(
          context: context,
          isDismissible: true,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return BottomSheetDetails();
          },
        );
        // await showModalBottomSheet(
        //   context: context,
        //   isDismissible: true,
        //   isScrollControlled: true,
        //   builder: (BuildContext context) {
        //     return BottomSheetDetails1();
        //   },
        // );
      } finally {
        // Ensure camera resumes even on exceptions
        isProcessingQR = false;
        await controller.resumeCamera();
      }
    });
  }


  Widget _buildFlashButton() {
    return GestureDetector(
      onTap: () async {
        await controller?.toggleFlash();
        setState(() {});
      },
      child: Opacity(
        opacity: 0.7,
        child: CircleAvatar(
          radius: 24.r,
          backgroundColor: const Color(0xFF303030),
          child: Center(
            child: Image.asset(
              'assets/icons/image-flash.png',
              height: 24.h,
              width: 24.w,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 100.h,
      width: 430.w,
      color: const Color(0xFF282828),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 29.h),
          child: Container(
            width: 390.31.w,
            height: 54.81.h,
            decoration: ShapeDecoration(
              color: const Color(0xFF191919),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            child: Center(
              child: TextFormField(
                textInputAction: TextInputAction.search,
                style: GoogleFonts.montserrat(
                  color: const Color(0xFFE3E3E3),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
                cursorColor: Colors.white,
                controller: _textController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: (_textController.text.isEmpty)
                      ? SizedBox(
                          width: 10.w,
                        )
                      : IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: const Color(0xff888888),
                            size: 20.w,
                          ),
                          onPressed: () {
                            _textController.clear();
                          },
                        ),
                  hintText: 'Type Code number',
                  prefix: SizedBox(
                    width: 15.w,
                  ),
                  hintStyle: GoogleFonts.montserrat(
                    color: const Color(0xFF888888),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
