import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socially/views/screens/route_Scr/chat_scr.dart';
import 'package:socially/views/screens/route_Scr/home_scr.dart';
import 'package:socially/views/screens/route_Scr/profile_scr.dart';
import 'package:socially/views/screens/route_Scr/search_scr.dart';

class Routes extends StatefulWidget {
  final int pageIndex;
  const Routes({super.key, this.pageIndex = 0});

  @override
  State<Routes> createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  late int selectedIndex = 0;
  PageController pageController = PageController();

  bool isVisible = true;

  bool isAddedTapped = false;

  @override
  void initState() {
    super.initState();

    selectedIndex = widget.pageIndex;
    pageController = PageController(initialPage: widget.pageIndex);
  }

  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  Widget buildCreatePostMenu() {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      curve: Curves.elasticOut,
      bottom: isAddedTapped ? 100.h : -250.h,
      left: 20.w,
      right: 20.w,
      child: Container(
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: const Color(0xff1e1e1e),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: const Color(0xff5c768d)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(
                Icons.image,
                size: 16.w,
                color: const Color(0xff5c768d),
              ),
              title: Text(
                'Add Post',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Campton',
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.event_rounded,
                size: 16.w,
                color: const Color(0xff5c768d),
              ),
              title: Text(
                'Share Event',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Campton',
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.diversity_1_rounded,
                size: 16.w,
                color: const Color(0xff5c768d),
              ),
              title: Text(
                'Invite Friends',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Campton',
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xff1e1e1e),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 8.h),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(24.r),
          child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
            ),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.fastLinearToSlowEaseIn,
              height: isVisible ? kBottomNavigationBarHeight + 20.h : 0,
              alignment: Alignment.center,
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,

                enableFeedback: false,
                backgroundColor: Color(0xff1e1e1e).withValues(alpha: 0.70),
                elevation: 3,
                iconSize: 20.w,
                currentIndex: selectedIndex > 4 ? 0 : selectedIndex,
                onTap: onTapped,
                selectedItemColor: Color(0xff5c768d),
                unselectedItemColor: Colors.grey.shade200,
                selectedLabelStyle: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Campton',
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Campton',
                ),
                items: [
                  BottomNavigationBarItem(
                    icon: navSvgIcon(
                      activeIcon: Icons.home_outlined,
                      inactiveIcon: Icons.home_rounded,
                      index: 0,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: navSvgIcon(
                      activeIcon: Icons.search_outlined,
                      inactiveIcon: Icons.search_rounded,
                      index: 1,
                    ),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: navSvgIcon(
                      activeIcon: Icons.chat_bubble_outline_rounded,
                      inactiveIcon: Icons.chat_bubble_outlined,
                      index: 2,
                    ),
                    label: 'Chat',
                  ),
                  BottomNavigationBarItem(
                    icon: navSvgIcon(
                      activeIcon: Icons.person_4_outlined,
                      inactiveIcon: Icons.person_4_rounded,
                      index: 3,
                    ),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: [
              HomeScr(hideNavBar: hideNav, showNavBar: showNav),
              SearchScr(),
              ChatScr(),
              ProfileScr(),
            ],
          ),
          if (isAddedTapped)
            GestureDetector(
              onTap: () {
                setState(() {
                  isAddedTapped = false;
                });
              },
              child: Container(color: Colors.black54),
            ),

          buildCreatePostMenu(),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: AnimatedScale(
          scale: isVisible ? 1.h : 0,
          duration: Duration(milliseconds: 300),
          curve: Curves.fastLinearToSlowEaseIn,
          child: FloatingActionButton(
            backgroundColor: Color(0xff5c768d),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.r),
            ),
            onPressed: () {
              setState(() {
                isAddedTapped = !isAddedTapped;
              });
            },
            child: isAddedTapped
                ? Icon(Icons.close_rounded, color: Colors.white)
                : Icon(Icons.add, color: Color(0xff1e1e1e)),
          ),
        ),
      ),

      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  void hideNav() {
    setState(() {
      isVisible = false;
    });
  }

  void showNav() {
    setState(() {
      isVisible = true;
    });
  }

  Widget navSvgIcon({
    required IconData activeIcon,
    required IconData inactiveIcon,
    required int index,
  }) {
    final bool isActive = selectedIndex == index;

    return Icon(isActive ? inactiveIcon : activeIcon);
  }
}
