import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';

class SplashTablet extends StatelessWidget {
  const SplashTablet({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff4E8CF7), Color(0xff1A69F0)],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: width * 0.4, // نسبة من الشاشة
            child: SvgPicture.asset(
              'assets/images/logo.svg',
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: width * 0.05),
          const SpinKitFadingCircle(color: Colors.white, size: 55),
        ],
      ),
    );
  }
}
