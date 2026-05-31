import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socially/views/screens/route_Scr/notif_scr.dart';
import 'package:socially/views/widgets/post_content.dart';
import 'package:socially/views/widgets/profile_settings_dialog.dart';
import 'package:socially/views/widgets/sgsted_friends.dart';
import 'package:socially/views/widgets/story_widg.dart';
import 'package:socially/views/widgets/touch_opacity.dart';

class HomeScr extends StatefulWidget {
  final VoidCallback showNavBar;
  final VoidCallback hideNavBar;
  const HomeScr({
    super.key,
    required this.showNavBar,
    required this.hideNavBar,
  });

  @override
  State<HomeScr> createState() => _HomeScrState();
}

class _HomeScrState extends State<HomeScr> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        widget.showNavBar();
      } else {
        widget.hideNavBar();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    scrollController.removeListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        widget.showNavBar();
      } else {
        widget.hideNavBar();
      }
    });
  }

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
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Text(
                '@peterdammy',
                textAlign: TextAlign.center,
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
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: TouchOpacity(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotifScr()),
                  );
                },
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100.h,
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, top: 10.h),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  StoryWidg(yourStory: true),
                  16.horizontalSpace,
                  StoryWidg(
                    yourStory: false,
                    storyChild: 'assets/images/avatar.png',
                    storyTitle: 'Joseph',
                  ),
                  16.horizontalSpace,
                  StoryWidg(
                    yourStory: false,
                    storyChild: 'assets/images/fourth.png',
                    storyTitle: 'Chydex',
                  ),
                  16.horizontalSpace,
                  StoryWidg(
                    yourStory: false,
                    storyChild: 'assets/images/splash.png',
                    storyTitle: 'Subomi',
                  ),
                  12.horizontalSpace,
                ],
              ),
            ),
          ),
          20.verticalSpace,
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ListView(
                controller: scrollController,
                children: [
                  PostContent(
                    profilePic: 'assets/images/avatar.png',
                    profileName: 'Peter Dammy',
                    postDate: '16 min ago',
                    postLocation: 'Manchester, England',
                    hasImage: true,
                    postText:
                        'Today marks the launching of the socially app, soar through what the world has to offer to you',
                    postImage: 'assets/images/onb.PNG',
                  ),
                  20.verticalSpace,
                  PostContent(
                    profilePic: 'assets/images/avatar.png',
                    profileName: 'devCoolJoe',
                    postDate: '2 hours ago',
                    postLocation: 'Illinois, Chicago',
                    postText:
                        'Name is devCoolJoe, front-end developer and back-end developer. I deliver all projects with precise skills',
                    hasImage: false,
                  ),
                  20.verticalSpace,
                  PostContent(
                    profilePic: 'assets/images/avatar.png',
                    profileName: 'Peter Dammy',
                    postDate: '3 hours ago',
                    postLocation: 'Manchester, UK',
                    hasImage: true,
                    postImage: 'assets/images/fourth.png',
                  ),
                  20.verticalSpace,
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      left: 10.w,
                      top: 10.h,
                      bottom: 10.h,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(width: 2.w, color: Color(0xff5c768d)),
                      borderRadius: BorderRadius.circular(12.r),
                      color: Color(0xff1e1e1e),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Suggested Friends',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade500,
                                fontFamily: 'Campton',
                                height: 1.1.h,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 10.w),
                              child: Icon(
                                Icons.more_horiz_rounded,
                                size: 16.w,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ],
                        ),
                        12.verticalSpace,
                        SizedBox(
                          height: 150.h,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              SgstedFriends(
                                profilePic: 'assets/images/avatar.png',
                                profileName: 'Nayteez Nathaniel Nath',
                              ),
                              12.horizontalSpace,
                              SgstedFriends(
                                profilePic: 'assets/images/avatar.png',
                                profileName: 'Peter Bambashi',
                              ),
                              12.horizontalSpace,
                              SgstedFriends(
                                profilePic: 'assets/images/avatar.png',
                                profileName: 'Mazi Goid',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  20.verticalSpace,
                  PostContent(
                    profilePic: 'assets/images/avatar.png',
                    profileName: 'Main Frosh',
                    postDate: '2 hours ago',
                    postLocation: 'Illinois, Chicago',
                    postText:
                        'Hi fellas, using this platform to announce i am an excellent writer and a well renowed author of several books',
                    hasImage: false,
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
