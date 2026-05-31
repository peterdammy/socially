import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socially/views/widgets/notif_list.dart';
import 'package:socially/views/widgets/touch_opacity.dart';

class NotifScr extends StatefulWidget {
  const NotifScr({super.key});

  @override
  State<NotifScr> createState() => _NotifScrState();
}

class _NotifScrState extends State<NotifScr> {
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
            'Notification',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xff5c768d),
              fontFamily: 'Campton',
              height: 1.1.h,
            ),
          ),
          leading: Padding(
            padding: EdgeInsets.only(left: 8.w),
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
              height: 60.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff5c768d).withValues(alpha: 0.20),
                    offset: Offset(0, 2),
                    spreadRadius: 2.r,
                  ),
                ],
                color: Color(0xff1e1e1e),
              ),
              child: NotifList(
                senderprofilePic: 'assets/images/avatar.png',
                senderprofileName: 'Socially Admin',
                senderMessage:
                    'Welcome to Socially, verify your account by creating your username and connect with people all over the world',
                timeofSenderMessage: '16:30',
                isUnread: true,
                noOfUnread: '1',
                isOnline: false,
              ),
            ),
            16.verticalSpace,
            Container(
              height: 60.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff5c768d).withValues(alpha: 0.20),
                    offset: Offset(0, 2),
                    spreadRadius: 2.r,
                  ),
                ],
                color: Color(0xff1e1e1e),
              ),
              child: NotifList(
                senderprofilePic: 'assets/images/avatar.png',
                senderprofileName: 'Socially Admin',
                senderMessage:
                    'Welcome to Socially, verify your account by creating your username and connect with people all over the world',
                timeofSenderMessage: '16:30',
                isUnread: true,
                noOfUnread: '1',
                isOnline: false,
              ),
            ),
            16.verticalSpace,
          ],
        ),
      ),
    );
  }
}
