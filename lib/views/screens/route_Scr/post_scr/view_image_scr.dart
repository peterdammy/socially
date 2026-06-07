import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socially/views/widgets/touch_opacity.dart';

class ViewImageScr extends StatefulWidget {
  final String profilePic;
  final String profileName;
  final List<String>? postImage;
  final int initialIndex;
  final bool? isBookmarked;
  final bool? isLiked;
  final bool haSiMage;
  const ViewImageScr({
    super.key,
    this.isLiked,
    this.isBookmarked,
    required this.postImage,
    required this.initialIndex,
    required this.profilePic,
    required this.profileName,
    required this.haSiMage,
  });

  @override
  State<ViewImageScr> createState() => _ViewImageScrState();
}

class _ViewImageScrState extends State<ViewImageScr> {
  bool isBookmarked = false;
  late bool isLiked;
  late PageController _pageController;
  late int currentIndex;

  @override
  void initState() {
    super.initState();

    isLiked = widget.isLiked ?? false;

    currentIndex = widget.initialIndex;

    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1e1e1e),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Color(0xff1e1e1e).withValues(alpha: 0.90),
          ),
          child: Stack(
            children: [
              if (widget.haSiMage &&
                  widget.postImage != null &&
                  widget.postImage!.isNotEmpty)
                PageView.builder(
                  controller: _pageController,
                  itemCount: widget.postImage!.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return InteractiveViewer(
                      minScale: 1,
                      maxScale: 4,
                      child: Center(
                        child: Image.asset(
                          widget.postImage![index],
                          fit: BoxFit.contain,
                        ),
                      ),
                    );
                  },
                ),

              SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: Column(
                    children: [
                      10.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
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
                              widget.profilePic,
                              fit: BoxFit.cover,
                            ),
                          ),
                          12.horizontalSpace,
                          Expanded(
                            child: SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.profileName,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontFamily: 'Campton',
                                      height: 1.1.h,
                                    ),
                                  ),
                                  Text(
                                    '16 min ago',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff5c768d),
                                      fontFamily: 'Campton',
                                      height: 1.1.h,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          10.horizontalSpace,
                          TouchOpacity(
                            onTap: () => Navigator.pop(context),
                            child: Icon(
                              Icons.close_rounded,
                              size: 24.w,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 16.h,
                left: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Divider(
                        color: Colors.white,
                        thickness: 0.5.h,
                        indent: 12.w,
                        endIndent: 12.w,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TouchOpacity(
                                  onTap: () {
                                    setState(() {
                                      isLiked = !isLiked;
                                    });
                                  },
                                  child: isLiked
                                      ? Icon(
                                          Icons.favorite_rounded,
                                          size: 24.w,
                                          color: Color(0xff5c768d),
                                        )
                                      : Icon(
                                          Icons.favorite_border_rounded,
                                          size: 24.w,
                                          color: Colors.white,
                                        ),
                                ),
                                6.horizontalSpace,
                                Text(
                                  '40k',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontFamily: 'Campton',
                                    height: 1.1.h,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.comment_outlined,
                                  size: 24.w,
                                  color: Colors.white,
                                ),
                                6.horizontalSpace,
                                Text(
                                  '2000',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontFamily: 'Campton',
                                    height: 1.1.h,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.share_rounded,
                                  size: 24.w,
                                  color: Colors.white,
                                ),
                                6.horizontalSpace,
                                Text(
                                  '100',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontFamily: 'Campton',
                                    height: 1.1.h,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TouchOpacity(
                                  onTap: () {
                                    setState(() {
                                      isBookmarked = !isBookmarked;
                                    });
                                  },
                                  child: isBookmarked
                                      ? Icon(
                                          Icons.bookmark_rounded,
                                          size: 24.w,
                                          color: Color(0xff5c768d),
                                        )
                                      : Icon(
                                          Icons.bookmark_outline,
                                          size: 24.w,
                                          color: Colors.white,
                                        ),
                                ),
                                6.horizontalSpace,
                                Text(
                                  '5',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontFamily: 'Campton',
                                    height: 1.1.h,
                                  ),
                                ),
                              ],
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
      ),
    );
  }
}
