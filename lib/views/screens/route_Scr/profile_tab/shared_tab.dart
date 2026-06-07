import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SharedTab extends StatefulWidget {
  const SharedTab({super.key});

  @override
  State<SharedTab> createState() => _SharedTabState();
}

class _SharedTabState extends State<SharedTab> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(top: 12.h),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12.h,
        crossAxisSpacing: 6.w,
        childAspectRatio: 0.75.sp,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          height: 300.h,
          width: 120.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Colors.grey.shade400,
          ),
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.asset('assets/images/img3.png', fit: BoxFit.cover),
              ),
              Positioned(
                bottom: 0.h,
                left: 0,
                right: 0,
                child: Container(
                  height: 40.h,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Color(0xff5c768d),
                        width: 1.w,
                        strokeAlign: BorderSide.strokeAlignOutside,
                      ),
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12.r),
                      bottomRight: Radius.circular(12.r),
                    ),
                    color: Colors.white.withValues(alpha: 0.6),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              'A lonely night at my crib,who wants to come over for a party',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff1e1e1e),
                                fontFamily: 'Campton',
                                height: 1.1.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
