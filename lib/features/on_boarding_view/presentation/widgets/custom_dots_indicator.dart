import 'package:doctor_appointment/features/on_boarding_view/data/models/on_boarding_view_model.dart';
import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {
  const DotsIndicator({
    super.key,
    required this.pages,
    required int currentIndex,
  }) : _currentIndex = currentIndex;

  final List<OnBoardingViewModel> pages;
  final int _currentIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: List.generate(pages.length, (dotIndex) {
          final bool isActive = dotIndex == _currentIndex;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            height: 8,
            width: isActive ? 24 : 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: isActive
                  ? const Color(0xff0957DE)
                  : const Color(0x330957DE),
            ),
          );
        }),
      ),
    );
  }
}
