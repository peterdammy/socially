import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socially/views/widgets/custom_switch.dart';
import 'package:socially/views/widgets/touch_opacity.dart';

class SettingsScr extends StatefulWidget {
  const SettingsScr({super.key});

  @override
  State<SettingsScr> createState() => _SettingsScrState();
}

class _SettingsScrState extends State<SettingsScr> {
  bool isEnabled = false;
  bool isActivated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1e1e1e),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: AppBar(
          backgroundColor: Color(0xff1e1e1e),
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: Text(
            'Settings',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xff5c768d),
              fontFamily: 'Campton',
              height: 1.1.h,
            ),
          ),
          leading: Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: TouchOpacity(
              onTap: () {
                Navigator.pop(context);
              },
              child: SizedBox(
                height: 20.h,
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 20.w,
                  color: Color(0xff5c768d),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView(
          children: [
            Container(
              height: 70.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff5c768d).withValues(alpha: 0.20),
                    offset: Offset(2, 2),
                    spreadRadius: 2.r,
                  ),
                ],
                color: Color(0xff1e1e1e),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Allow notifications',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white,
                      fontFamily: 'Campton',
                      fontWeight: FontWeight.w400,
                      height: 1.1.h,
                    ),
                  ),
                  CustomSwitch(
                    value: isEnabled,
                    onChanged: (val) {
                      setState(() {
                        isEnabled = val;
                      });
                    },
                  ),
                ],
              ),
            ),
            16.verticalSpace,
            Container(
              height: 70.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff5c768d).withValues(alpha: 0.20),
                    offset: Offset(2, 2),
                    spreadRadius: 2.r,
                  ),
                ],
                color: Color(0xff1e1e1e),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Face ID',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white,
                      fontFamily: 'Campton',
                      fontWeight: FontWeight.w400,
                      height: 1.1.h,
                    ),
                  ),
                  CustomSwitch(
                    value: isActivated,
                    onChanged: (val) {
                      setState(() {
                        isActivated = val;
                      });
                    },
                  ),
                ],
              ),
            ),
            16.verticalSpace,
            Container(
              height: 70.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff5c768d).withValues(alpha: 0.20),
                    offset: Offset(2, 2),
                    spreadRadius: 2.r,
                  ),
                ],
                color: Color(0xff1e1e1e),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Allow notifications',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white,
                      fontFamily: 'Campton',
                      fontWeight: FontWeight.w400,
                      height: 1.1.h,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 20.w,
                      color: Color(0xff5c768d),
                    ),
                  ),
                ],
              ),
            ),
            16.verticalSpace,
            Container(
              height: 70.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff5c768d).withValues(alpha: 0.20),
                    offset: Offset(2, 2),
                    spreadRadius: 2.r,
                  ),
                ],
                color: Color(0xff1e1e1e),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Privacy & Help Center',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white,
                      fontFamily: 'Campton',
                      fontWeight: FontWeight.w400,
                      height: 1.1.h,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 20.w,
                      color: Color(0xff5c768d),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
