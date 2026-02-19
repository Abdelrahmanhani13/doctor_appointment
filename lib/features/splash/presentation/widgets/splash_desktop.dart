import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashDesktop extends StatelessWidget {
  const SplashDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff4E8CF7), Color(0xff1A69F0)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 700, // مهم جدًا
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SvgPicture.asset(
                      'assets/images/logo.svg',
                      width: constraints.maxWidth * 0.5,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 40),
                  const SpinKitFadingCircle(color: Colors.white, size: 60),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
