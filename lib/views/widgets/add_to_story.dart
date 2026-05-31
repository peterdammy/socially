import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socially/views/widgets/touch_opacity.dart';

void addToStory(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(top: 90.h),
          child: Container(
            height: 400.h,
            width: 320.w,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: Color(0xff1e1e1e).withValues(alpha: 0.90),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TouchOpacity(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    size: 24.sp,
                    color: Colors.grey.shade500,
                  ),
                ),
                16.verticalSpace,
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      mainAxisSpacing: 6.h,
                      crossAxisSpacing: 6.w,
                      childAspectRatio: 0.75.sp,
                    ),
                    itemCount: 30,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: Colors.grey.shade400,
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          child: Image.asset(
                            'assets/images/img3.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                2.verticalSpace,
                Divider(color: Colors.grey.shade500, height: 2.h, thickness: 1),
                16.verticalSpace,
              ],
            ),
          ),
        ),
      );
    },
  );
}
