import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socially/views/widgets/touch_opacity.dart';

class ChatDetailScr extends StatefulWidget {
  const ChatDetailScr({super.key});

  @override
  State<ChatDetailScr> createState() => _ChatDetailScrState();
}

class _ChatDetailScrState extends State<ChatDetailScr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1e1e1e),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
                    child: Icon(
                      Icons.more_vert,
                      size: 25.w,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
            expandedHeight: 110.h,
            pinned: true,
            floating: true,
            snap: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12.r),
                    bottomRight: Radius.circular(12.r),
                  ),
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage('assets/images/img4.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
