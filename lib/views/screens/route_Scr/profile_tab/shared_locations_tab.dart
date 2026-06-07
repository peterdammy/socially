import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SharedLocationsTab extends StatefulWidget {
  const SharedLocationsTab({super.key});

  @override
  State<SharedLocationsTab> createState() => _SharedLocationsTabState();
}

class _SharedLocationsTabState extends State<SharedLocationsTab> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(top: 12.h),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12.h,
        crossAxisSpacing: 6.w,
        childAspectRatio: 1.4.sp,
      ),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          clipBehavior: Clip.hardEdge,
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
                    color: Colors.white.withValues(alpha: 0.7),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              'Manchester, England, UK',
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
                          4.horizontalSpace,
                          Icon(
                            Icons.location_on_rounded,
                            size: 12.w,
                            color: Color(0xff1e1e1e),
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
