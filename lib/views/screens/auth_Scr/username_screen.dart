import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socially/views/screens/auth_Scr/interest_screen.dart';
import 'package:socially/views/widgets/socialtxtf.dart';
import 'package:socially/views/widgets/touch_opacity.dart';

class UsernameScreen extends StatefulWidget {
  const UsernameScreen({super.key});

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x201e1e1e),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            50.verticalSpace,
            Text(
              'Create Profile',
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
              'What\'s your profile to the world?',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.grey.shade600,
                fontFamily: 'Campton',
                fontWeight: FontWeight.w400,
                height: 1.1.h,
              ),
            ),
            20.verticalSpace,
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: 100.h,
                width: 100.h,
                child: Stack(
                  children: [
                    Container(
                      height: 100.h,
                      width: 100.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r),
                        border: Border.all(
                          width: 3.w,
                          color: Colors.grey.shade600,
                        ),
                        color: Colors.transparent,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.person_2_outlined,
                          size: 80.w,
                          color: Color(0xff5c768d),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: TouchOpacity(
                        child: Container(
                          height: 20.h,
                          width: 20.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all(
                              width: 3.w,
                              color: Colors.grey.shade600,
                            ),
                            color: Colors.transparent,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add_a_photo_rounded,
                              size: 10.w,
                              color: Color(0xff5c768d),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            20.verticalSpace,
            Text(
              'Display Name',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.grey.shade600,
                fontFamily: 'Campton',
                fontWeight: FontWeight.w400,
                height: 1.1.h,
              ),
            ),
            12.verticalSpace,
            Socialtxtf(pfxIcon: Icons.person_4_rounded, hntTxt: 'Peter Dammy'),
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
            40.verticalSpace,
            TouchOpacity(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InterestScreen()),
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
          ],
        ),
      ),
    );
  }
}
