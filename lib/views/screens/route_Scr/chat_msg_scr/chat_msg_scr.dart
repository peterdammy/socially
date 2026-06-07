import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socially/views/screens/route_Scr/chat_msg_scr/chat_detail_scr.dart';
import 'package:socially/views/widgets/socialtxtf.dart';
import 'package:socially/views/widgets/touch_opacity.dart';

class ChatMsgScr extends StatefulWidget {
  const ChatMsgScr({super.key});

  @override
  State<ChatMsgScr> createState() => _ChatMsgScrState();
}

class _ChatMsgScrState extends State<ChatMsgScr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1e1e1e),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: AppBar(
          backgroundColor: Color(0xff1e1e1e),
          centerTitle: false,
          leadingWidth: 65.w,
          leading: Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 18.sp,
                    color: Colors.white,
                  ),
                ),
                4.horizontalSpace,
                Center(
                  child: TouchOpacity(
                    child: Container(
                      height: 30.h,
                      width: 30.h,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: Color(0xff5c768d),
                        border: Border.all(
                          color: Color(0xff5c768d),
                          width: 2.w,
                          strokeAlign: BorderSide.strokeAlignOutside,
                        ),
                      ),
                      child: Image.asset(
                        'assets/images/avatar.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          title: TouchOpacity(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatDetailScr()),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'OmoTee',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff5c768d),
                    fontFamily: 'Campton',
                    height: 1.1.h,
                  ),
                ),
                Text(
                  'Madrid, Spain',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white,
                    fontFamily: 'Campton',
                    fontWeight: FontWeight.w500,
                    height: 1.1.h,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: TouchOpacity(
                child: SizedBox(
                  height: 30.h,
                  child: Icon(Icons.more_vert, size: 25.w, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          6.verticalSpace,
          SizedBox(
            width: double.infinity,
            child: Divider(color: Colors.white, height: 1.h, thickness: 1.sp),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: ListView(
                reverse: true,
                children: [
                  4.verticalSpace,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.5,
                      padding: EdgeInsets.all(10.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: Color(0xff5c768d),
                          width: 2.w,
                          strokeAlign: BorderSide.strokeAlignOutside,
                        ),
                        color: Color(0xff1e1e1e),
                      ),
                      child: Text(
                        'Wassup when you go soft launch the app go App Store for download',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff5c768d),
                          fontFamily: 'Campton',
                          height: 1.1.h,
                        ),
                      ),
                    ),
                  ),
                  10.verticalSpace,
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.5,
                      padding: EdgeInsets.all(10.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: Colors.white,
                          width: 2.w,
                          strokeAlign: BorderSide.strokeAlignOutside,
                        ),
                        color: Color(0xff5c768d),
                      ),
                      child: Text(
                        'I dan finish the auth part, wetin dey next?',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff1e1e1e),
                          fontFamily: 'Campton',
                          height: 1.1.h,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Divider(color: Colors.white, height: 1.h, thickness: 1.sp),
          ),
          10.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.add_rounded, size: 20.sp, color: Colors.white),
                12.horizontalSpace,
                SizedBox(
                  width: 300.w,
                  child: Socialtxtf(
                    hntTxt: 'Enter text...',
                    sfxIcon: Icons.send_rounded,
                  ),
                ),
                12.horizontalSpace,
                Icon(Icons.mic_rounded, size: 20.sp, color: Colors.white),
              ],
            ),
          ),
          16.verticalSpace,
        ],
      ),
    );
  }
}
