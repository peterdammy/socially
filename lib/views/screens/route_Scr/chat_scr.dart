import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socially/views/widgets/chat_list.dart';
import 'package:socially/views/widgets/profile_settings_dialog.dart';
import 'package:socially/views/widgets/socialtxtf.dart';
import 'package:socially/views/widgets/touch_opacity.dart';

class ChatScr extends StatefulWidget {
  const ChatScr({super.key});

  @override
  State<ChatScr> createState() => _ChatScrState();
}

class _ChatScrState extends State<ChatScr> {
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
          leading: Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Center(
              child: TouchOpacity(
                onLongPress: () {
                  showProfileSettings(context);
                },
                child: Container(
                  height: 40.h,
                  width: 40.h,
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
          ),
          title: Text(
            '@peterdammy',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xff5c768d),
              fontFamily: 'Campton',
              height: 1.1.h,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: TouchOpacity(
                child: SizedBox(
                  height: 30.h,
                  child: Stack(
                    children: [
                      Center(
                        child: Icon(
                          Icons.notifications_rounded,
                          size: 25.w,
                          color: Color(0xff5c768d),
                        ),
                      ),
                      Positioned(
                        right: 5,
                        top: 5.h,
                        child: Container(
                          height: 8.h,
                          width: 8.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Color(0xffd97c7c),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Socialtxtf(pfxIcon: Icons.search_rounded, hntTxt: 'Search'),
          ),
          20.verticalSpace,
          SizedBox(
            width: double.infinity,
            child: Divider(
              color: Colors.grey.shade500,
              height: 1.h,
              thickness: 1.sp,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: ListView(
                children: [
                  10.verticalSpace,
                  ChatList(
                    senderprofilePic: 'assets/images/avatar.png',
                    senderprofileName: 'DevCoolJoe',
                    senderMessage:
                        'Wassup when you go soft launch the app go App Store for download',
                    timeofSenderMessage: '16:30',
                    isUnread: true,
                    noOfUnread: '23',
                    isOnline: true,
                  ),
                  24.verticalSpace,
                  ChatList(
                    senderprofilePic: 'assets/images/avatar.png',
                    senderprofileName: 'Chydex',
                    senderMessage: 'Check my profile baka!!',
                    timeofSenderMessage: '12:30',
                    isUnread: true,
                    noOfUnread: '1',
                    isOnline: true,
                  ),
                  24.verticalSpace,
                  ChatList(
                    senderprofilePic: 'assets/images/avatar.png',
                    senderprofileName: 'Main Frosh',
                    senderMessage:
                        'Wow!! nice platform man, can now share my novel links for free, yeee!!!',
                    timeofSenderMessage: '12:03',
                    ifRead: true,
                    isOnline: true,
                  ),
                  24.verticalSpace,
                  ChatList(
                    senderprofilePic: 'assets/images/avatar.png',
                    senderprofileName: 'Mr_Raiden',
                    senderMessage:
                        'Guy! When are you coming back to WebNovel, I have a story in mind',
                    timeofSenderMessage: '11:47',
                    ifRead: true,
                    isOnline: true,
                  ),
                  24.verticalSpace,
                  ChatList(
                    senderprofilePic: 'assets/images/avatar.png',
                    senderprofileName: 'Alaye',
                    senderMessage:
                        'Afar that Ghost of Tshushima make sense die',
                    timeofSenderMessage: '10:28',
                    ifRead: true,
                    isOnline: true,
                  ),
                  24.verticalSpace,
                  ChatList(
                    senderprofilePic: 'assets/images/avatar.png',
                    senderprofileName: 'Peter Bambashi',
                    senderMessage:
                        'Aw far, when you dey come Lagos back, make i flex you',
                    timeofSenderMessage: '10:02',
                    ifRead: true,
                    isOnline: false,
                  ),
                  24.verticalSpace,
                  ChatList(
                    senderprofilePic: 'assets/images/avatar.png',
                    senderprofileName: 'OmoTee',
                    senderMessage: 'NYSC 12/12 in a bit',
                    timeofSenderMessage: '09:39',
                    ifRead: true,
                    isOnline: false,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
