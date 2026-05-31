import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socially/views/screens/auth_Scr/signin_screen.dart';
import 'package:socially/views/screens/auth_Scr/signup_screen.dart';
import 'package:socially/views/widgets/touch_opacity.dart';

class SplashScr extends StatefulWidget {
  const SplashScr({super.key});

  @override
  State<SplashScr> createState() => _SplashScrState();
}

class _SplashScrState extends State<SplashScr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1e1e1e),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              20.verticalSpace,
              Text(
                'Socially',
                style: TextStyle(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff5c768d),
                  fontFamily: 'Campton',
                ),
              ),
              20.verticalSpace,
              Text(
                'Connect with your friends and the world around you on Socially.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey.shade600,
                  fontFamily: 'Campton',
                  fontWeight: FontWeight.w400,
                ),
              ),
              14.verticalSpace,
              Container(
                height: 400.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/onb.PNG'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              40.verticalSpace,
              Text(
                'New user? sign up below and connect with the world',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade600,
                  fontFamily: 'Campton',
                ),
              ),
              14.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: TouchOpacity(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                  child: Container(
                    height: 50.h,
                    width: 373.w,
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(width: 3.w, color: Color(0xff5c768d)),
                      color: Color(0xff1e1e1e).withValues(alpha: 0.20),
                    ),
                    child: Center(
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey.shade800,
                          fontFamily: 'Campton',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              20.verticalSpace,
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SigninScreen()),
                  );
                },
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Already a user?',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade600,
                      fontFamily: 'Campton',
                    ),
                    children: [
                      TextSpan(
                        text: ' Sign in',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff5c768d),
                          fontFamily: 'Campton',
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
    );
  }
}
