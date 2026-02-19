import 'dart:async';
import 'package:doctor_appointment/core/utils/go_router.dart';
import 'package:doctor_appointment/core/utils/responsive/adaptive_layout.dart';
import 'package:doctor_appointment/features/splash/presentation/widgets/splash_desktop.dart';
import 'package:doctor_appointment/features/splash/presentation/widgets/splash_mobile.dart';
import 'package:doctor_appointment/features/splash/presentation/widgets/splash_tablet.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      context.go(AppRouter.kOnBoardingView);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AdaptiveLayout(
        mobile: SplashMobile(),
        tablet: SplashTablet(),
        desktop: SplashDesktop(),
      ),
    );
  }
}
