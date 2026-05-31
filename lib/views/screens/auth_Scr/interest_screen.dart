import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socially/views/screens/routes.dart';
import 'package:socially/views/widgets/touch_opacity.dart';

class InterestScreen extends StatefulWidget {
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  final topics = [
    'Technology',
    'Sports',
    'Music',
    'Movies',
    'Gaming',
    'Travel',
    'Food',
    'Fashion',
  ];

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
              'What are your interests?',
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
              'Choose 3 or more below',
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
              child: Wrap(
                spacing: 12.w,
                runSpacing: 12.h,
                runAlignment: WrapAlignment.start,
                children: topics.map((topics) {
                  return TouchOpacity(
                    child: IntrinsicWidth(
                      child: Container(
                        height: 30.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 5.h,
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
                            Icon(
                              Icons.add,
                              size: 18.w,
                              color: Color(0xff5c768d),
                            ),
                            10.horizontalSpace,
                            Text(
                              topics,
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
                  );
                }).toList(),
              ),
            ),
            180.verticalSpace,
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
          ],
        ),
      ),
    );
  }
}
