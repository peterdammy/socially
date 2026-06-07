import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socially/views/screens/auth_Scr/signup_screen.dart';
import 'package:socially/views/screens/route_Scr/settings_scr/settings_scr.dart';
import 'package:socially/views/widgets/touch_opacity.dart';

void showProfileSettings(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.only(top: 10.h, left: 60.w),
          child: Container(
            width: 300.w,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: const Color(0xff1e1e1e),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: const Color(0xff5c768d)),
            ),
            child: ListView(
              shrinkWrap: true,
              children: [
                16.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '@peterdammy',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.white,
                        fontFamily: 'Campton',
                        fontWeight: FontWeight.w500,
                        height: 1.1.h,
                      ),
                    ),
                    Icon(
                      Icons.check_box_rounded,
                      size: 20.sp,
                      color: Color(0xff5c768d),
                    ),
                    // Container(
                    //   height: 12.h,
                    //   width: 12.w,
                    //   decoration: BoxDecoration(
                    //     border: Border.all(
                    //       color: Colors.white,
                    //       width: 1.w,
                    //       strokeAlign: BorderSide.strokeAlignOutside,
                    //     ),
                    //     borderRadius: BorderRadius.circular(12.r),
                    //   ),
                    // ),
                  ],
                ),
                16.verticalSpace,
                TouchOpacity(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Add another account',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white,
                          fontFamily: 'Campton',
                          fontWeight: FontWeight.w500,
                          height: 1.1.h,
                        ),
                      ),
                      Icon(Icons.add_rounded, size: 20.sp, color: Colors.white),
                    ],
                  ),
                ),
                16.verticalSpace,
                TouchOpacity(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsScr()),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Settings',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white,
                          fontFamily: 'Campton',
                          fontWeight: FontWeight.w500,
                          height: 1.1.h,
                        ),
                      ),
                      Icon(
                        Icons.settings_rounded,
                        size: 20.sp,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                16.verticalSpace,
                Text(
                  'Log Out',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.red.shade600,
                    fontFamily: 'Campton',
                    fontWeight: FontWeight.w500,
                    height: 1.1.h,
                  ),
                ),
                16.verticalSpace,
              ],
            ),
          ),
        ),
      );
    },
  );
}
