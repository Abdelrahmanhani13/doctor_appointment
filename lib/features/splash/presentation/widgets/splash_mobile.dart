import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';

class SplashMobile extends StatelessWidget {
  const SplashMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff4E8CF7), Color(0xff1A69F0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(flex: 3),

              /// Logo
              Expanded(
                flex: 4,
                child: Center(
                  child: SizedBox(
                    width: size.width * 0.35,
                    child: SvgPicture.asset('assets/images/logo.svg'),
                  ),
                ),
              ),

              /// Loader
              const Expanded(
                flex: 2,
                child: Center(
                  child: SpinKitFadingCircle(color: Colors.white, size: 50),
                ),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
