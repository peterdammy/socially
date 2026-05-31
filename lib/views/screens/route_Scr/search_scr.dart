import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:socially/views/widgets/socialtxtf.dart';
import 'package:socially/views/widgets/touch_opacity.dart';

class SearchScr extends StatefulWidget {
  const SearchScr({super.key});

  @override
  State<SearchScr> createState() => _SearchScrState();
}

class _SearchScrState extends State<SearchScr> {
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
            'Explore',
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,
            Socialtxtf(pfxIcon: Icons.search_rounded, hntTxt: 'Search'),
            20.verticalSpace,
            Expanded(
              child: MasonryGridView.builder(
                itemCount: 4,
                mainAxisSpacing: 12.w,
                crossAxisSpacing: 12.h,
                gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) => Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Image.asset(
                        'assets/images/img${index + 1}.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      left: 8.w,
                      bottom: 8.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.favorite_border_rounded,
                            size: 16.w,
                            color: Color(0xff5c768d),
                          ),
                          8.horizontalSpace,
                          Icon(
                            Icons.comment_outlined,
                            size: 16.w,
                            color: Color(0xff5c768d),
                          ),
                          8.horizontalSpace,
                          Icon(
                            Icons.ios_share_outlined,
                            size: 16.w,
                            color: Color(0xff5c768d),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
