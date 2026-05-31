import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SgstedFriends extends StatefulWidget {
  final String profilePic;
  final String profileName;
  const SgstedFriends({
    super.key,
    required this.profilePic,
    required this.profileName,
  });

  @override
  State<SgstedFriends> createState() => _SgstedFriendsState();
}

class _SgstedFriendsState extends State<SgstedFriends> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 5.w),
      child: Container(
        width: 120.w,
        height: 150.h,
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: Color(0xff1e1e1e).withValues(alpha: 0.20),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 60.h,
              width: 60.h,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80.r),
                color: Color(0xff5c768d),
              ),
              child: Image.asset(widget.profilePic, fit: BoxFit.cover),
            ),
            Text(
              widget.profileName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade500,
                fontFamily: 'Campton',
                height: 1.1.h,
              ),
            ),
            Container(
              height: 25.h,
              padding: EdgeInsets.all(6.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Colors.grey.shade700,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff5c768d),
                      fontFamily: 'Campton',
                      height: 1.1.h,
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
