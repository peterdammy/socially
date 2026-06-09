import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socially/auth/repo/auth_process.dart';
import 'package:socially/views/screens/auth_Scr/signup_screen.dart';
import 'package:socially/views/screens/routes.dart';
import 'package:socially/views/widgets/socialtxtf.dart';
import 'package:socially/views/widgets/touch_opacity.dart';

class SigninScreen extends ConsumerStatefulWidget {
  const SigninScreen({super.key});

  @override
  ConsumerState<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends ConsumerState<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x201e1e1e),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              50.verticalSpace,
              Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff5c768d),
                  fontFamily: 'Campton',
                  height: 1.1.h,
                ),
              ),
              10.verticalSpace,
              Text(
                'Welcome back to the social world',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.grey.shade600,
                  fontFamily: 'Campton',
                  fontWeight: FontWeight.w400,
                  height: 1.1.h,
                ),
              ),
              20.verticalSpace,
              Text(
                'Username',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.grey.shade600,
                  fontFamily: 'Campton',
                  fontWeight: FontWeight.w400,
                  height: 1.1.h,
                ),
              ),
              12.verticalSpace,
              Socialtxtf(pfxIcon: Icons.alternate_email, hntTxt: '@peterdammy'),
              20.verticalSpace,
              Text(
                'Enter your password',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.grey.shade600,
                  fontFamily: 'Campton',
                  fontWeight: FontWeight.w400,
                  height: 1.1.h,
                ),
              ),
              12.verticalSpace,
              Socialtxtf(
                pfxIcon: Icons.lock_rounded,
                hntTxt: 'Password',
                sfxIcon: Icons.visibility_rounded,
              ),
              40.verticalSpace,
              TouchOpacity(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Routes()),
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
                      'Continue',
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
              60.verticalSpace,
              Align(
                alignment: Alignment.center,
                child: TouchOpacity(
                  child: Icon(
                    Icons.fingerprint_rounded,
                    color: Color(0xff5c768d),
                    size: 50.w,
                  ),
                ),
              ),
              60.verticalSpace,
              SizedBox(
                height: 20.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: Divider(color: Color(0xff5c768d))),
                    6.horizontalSpace,
                    Text(
                      'Or continue with',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey.shade600,
                        fontFamily: 'Campton',
                        fontWeight: FontWeight.w400,
                        height: 1.1.h,
                      ),
                    ),
                    6.horizontalSpace,
                    Expanded(child: Divider(color: Color(0xff5c768d))),
                  ],
                ),
              ),
              20.verticalSpace,
              SizedBox(
                height: 60.h,
                width: 373.w,
                child: Stack(
                  children: [
                    Positioned(
                      top: 10.h,
                      bottom: 10.h,
                      child: TouchOpacity(
                        onTap: () {
                          ref.read(authServiceProvider).signInWithGoogle();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Routes(pageIndex: 0),
                            ),
                          );
                        },
                        child: Container(
                          height: 40.h,
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12.r),
                              bottomRight: Radius.circular(12.r),
                              topLeft: Radius.circular(12.r),
                              bottomLeft: Radius.circular(12.r),
                            ),
                            border: Border.all(
                              color: Color(0xff5c768d),
                              width: 2.w,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              60.horizontalSpace,
                              Text(
                                'Google',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.grey.shade600,
                                  fontFamily: 'Campton',
                                  fontWeight: FontWeight.w400,
                                  height: 1.1.h,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      child: Container(
                        height: 60.h,
                        width: 60.h,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80.r),
                          color: Color(0xff5c768d),
                          border: Border.all(
                            color: Color(0xff5c768d),
                            width: 2.w,
                            strokeAlign: BorderSide.strokeAlignOutside,
                          ),
                        ),
                        child: Image.asset(
                          'assets/images/google.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              20.verticalSpace,
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupScreen()),
                  );
                },
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'New user?',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade600,
                      fontFamily: 'Campton',
                    ),
                    children: [
                      TextSpan(
                        text: ' Sign up',
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
