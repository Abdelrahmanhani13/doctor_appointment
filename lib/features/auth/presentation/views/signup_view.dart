import 'package:doctor_appointment/core/utils/app_styles.dart';
import 'package:doctor_appointment/core/utils/go_router.dart';
import 'package:doctor_appointment/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:doctor_appointment/features/on_boarding_view/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight:
                  MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h), // 37 → 24
                  Text(
                    'Create your\nnew account',
                    style: AppStyles.styleSemiBold24,
                  ),
                  SizedBox(height: 8.h), // 15 → 8
                  Text(
                    'Create an account to start looking for the doctor you want.',
                    style: AppStyles.styleRegular14,
                  ),
                  SizedBox(height: 24.h), // 48 → 24

                  Text('Full Name', style: AppStyles.styleMedium14),
                  SizedBox(height: 8.h),
                  CustomTextFormField(
                    hintText: 'Enter your Full Name',
                    textInputType: TextInputType.name,
                  ),
                  SizedBox(height: 16.h),

                  Text('Email', style: AppStyles.styleMedium14),
                  SizedBox(height: 8.h),
                  CustomTextFormField(
                    hintText: 'Enter your Email',
                    textInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 16.h),

                  Text('Phone Number', style: AppStyles.styleMedium14),
                  SizedBox(height: 8.h),
                  CustomTextFormField(
                    hintText: '+216',
                    textInputType: TextInputType.phone,
                  ),
                  SizedBox(height: 16.h),

                  Text('Password', style: AppStyles.styleMedium14),
                  SizedBox(height: 8.h),
                  CustomTextFormField(
                    hintText: 'Enter your Password',
                    textInputType: TextInputType.visiblePassword,
                    isPassword: true,
                  ),
                  SizedBox(height: 16.h),

                  Text('Confirm Password', style: AppStyles.styleMedium14),
                  SizedBox(height: 8.h),
                  CustomTextFormField(
                    hintText: 'Confirm your Password',
                    textInputType: TextInputType.visiblePassword,
                    isPassword: true,
                  ),
                  SizedBox(height: 20.h),
                  CustomButton(
                    height: 49.h,
                    width: 328.w,
                    text: 'Sign Up',
                    onPressed: () {},
                    buttonColor: const Color(0xff236DEC),
                    textStyle: AppStyles.styleSemiBold16,
                    circleSize: 10.r,
                  ),
                  SizedBox(height: 20.h),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 16.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account? ',
                            style: AppStyles.styleRegular14.copyWith(
                              color: const Color(0xFF949D9E),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.go(AppRouter.kLoginView);
                            },
                            child: Text(
                              'Login',
                              style: AppStyles.styleMedium14.copyWith(
                                color: const Color(0xFF1A73E8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
