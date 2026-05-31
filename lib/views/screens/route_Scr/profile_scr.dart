import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socially/views/screens/route_Scr/profile_tab/received_tab.dart';
import 'package:socially/views/screens/route_Scr/profile_tab/shared_locations_tab.dart';
import 'package:socially/views/screens/route_Scr/profile_tab/shared_tab.dart';
import 'package:socially/views/screens/route_Scr/settings_scr/settings_scr.dart';
import 'package:socially/views/widgets/touch_opacity.dart';

class ProfileScr extends StatefulWidget {
  const ProfileScr({super.key});

  @override
  State<ProfileScr> createState() => _ProfileScrState();
}

class _ProfileScrState extends State<ProfileScr> {
  final scrollController = ScrollController();

  bool isOpaque = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.offset >= 30) {
        setState(() {
          isOpaque = true;
        });
      } else {
        setState(() {
          isOpaque = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color(0xff1e1e1e),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          animateColor: true,
          backgroundColor: isOpaque ? Color(0xff1e1e1e) : Colors.transparent,
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: Text(
            'Profile',
            style: TextStyle(
              fontSize: 24.sp,
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsScr()),
                  );
                },
                child: Icon(
                  Icons.settings_rounded,
                  size: 24.sp,
                  color: Color(0xff5c768d),
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: scrollController,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: ScreenUtil().screenHeight * 0.15,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.r),
                        bottomRight: Radius.circular(30.r),
                      ),
                    ),
                    child: Image.asset(
                      'assets/images/img3.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  70.verticalSpace,
                  Positioned(
                    top: ScreenUtil().screenHeight * 0.10,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: 100.h,
                            width: 100.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.r),
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
                          12.horizontalSpace,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Peter Dammy',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff5c768d),
                                    fontFamily: 'Campton',
                                    height: 1.1.h,
                                  ),
                                ),
                                2.verticalSpace,
                                Text(
                                  '@peterdammy',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey.shade500,
                                    fontFamily: 'Campton',
                                    fontWeight: FontWeight.w500,
                                    height: 1.1.h,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TouchOpacity(
                            child: Container(
                              height: 30.h,
                              width: 70.w,
                              padding: EdgeInsets.all(8.sp),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(
                                  color: Color(0xff5c768d),
                                  width: 1.w,
                                  strokeAlign: BorderSide.strokeAlignOutside,
                                ),
                                color: Colors.transparent,
                              ),
                              child: Center(
                                child: Text(
                                  'Edit',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey.shade500,
                                    fontFamily: 'Campton',
                                    fontWeight: FontWeight.w500,
                                    height: 1.1.h,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  24.verticalSpace,
                  Text(
                    'Hey Guys!!!, Dammy here. i am flutter software dev and an explorer of only four states',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey.shade500,
                      fontFamily: 'Campton',
                      fontWeight: FontWeight.w500,
                      height: 1.1.h,
                    ),
                  ),
                  24.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            '1k',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.grey.shade500,
                              fontFamily: 'Campton',
                              fontWeight: FontWeight.w600,
                              height: 1.1.h,
                            ),
                          ),
                          4.verticalSpace,
                          Text(
                            'Social connections',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey.shade500,
                              fontFamily: 'Campton',
                              fontWeight: FontWeight.w400,
                              height: 1.1.h,
                            ),
                          ),
                        ],
                      ),
                      110.horizontalSpace,
                      Column(
                        children: [
                          Text(
                            '2k',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.grey.shade500,
                              fontFamily: 'Campton',
                              fontWeight: FontWeight.w600,
                              height: 1.1.h,
                            ),
                          ),
                          4.verticalSpace,
                          Text(
                            'Socials',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey.shade500,
                              fontFamily: 'Campton',
                              fontWeight: FontWeight.w400,
                              height: 1.1.h,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  24.verticalSpace,
                  TabBar(
                    isScrollable: true,
                    indicatorWeight: 3.0.w,
                    dividerColor: Colors.transparent,
                    tabAlignment: TabAlignment.start,
                    indicatorSize: TabBarIndicatorSize.label,
                    unselectedLabelStyle: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey.shade500,
                      fontFamily: 'Campton',
                      fontWeight: FontWeight.w400,
                      height: 1.1.h,
                    ),
                    labelStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff5c768d),
                      fontFamily: 'Campton',
                      height: 1.1.h,
                    ),
                    tabs: [
                      Tab(text: 'Shared'),
                      Tab(text: 'Accepted'),
                      Tab(text: 'Social Locations'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 6.w, bottom: 105.h),
                          child: SharedTab(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 6.w, bottom: 105.h),
                          child: ReceivedTab(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 105.h),
                          child: SharedLocationsTab(),
                        ),
                      ],
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
