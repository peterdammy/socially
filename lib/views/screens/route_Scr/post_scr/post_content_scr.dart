import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socially/views/screens/route_Scr/post_scr/view_image_scr.dart';
import 'package:socially/views/widgets/image_content.dart';
import 'package:socially/views/widgets/socialtxtf.dart';
import 'package:socially/views/widgets/touch_opacity.dart';

class PostContentScr extends StatefulWidget {
  final String profilePic;
  final String profileName;
  final String postDate;
  final String? postLocation;
  final String? postText;
  final List<String>? postImage;
  final bool? hasText;
  final bool? hasImage;
  final bool? isLiked;
  final bool? isBookmarked;
  const PostContentScr({
    super.key,
    required this.profilePic,
    required this.profileName,
    required this.postDate,
    this.postLocation,
    this.postText,
    this.postImage,
    this.hasText,
    this.hasImage,
    this.isLiked,
    this.isBookmarked,
  });

  @override
  State<PostContentScr> createState() => _PostContentScrState();
}

class _PostContentScrState extends State<PostContentScr> {
  bool isBookmarked = false;
  bool iscommentLiked = false;

  late bool isLiked;

  @override
  void initState() {
    super.initState();
    isLiked = widget.isLiked ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xff1e1e1e),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            PreferredSize(
              preferredSize: Size.fromHeight(60.h),
              child: SliverAppBar(
                floating: true,
                snap: true,
                expandedHeight: 60.h,
                backgroundColor: Color(0xff1e1e1e),
                centerTitle: true,
                automaticallyImplyLeading: false,
                title: Text(
                  'Content',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff5c768d),
                    fontFamily: 'Campton',
                    height: 1.1.h,
                  ),
                ),
                leading: Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: TouchOpacity(
                    onTap: () {
                      Navigator.pop(context, isLiked);
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
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: TouchOpacity(
                      onTap: () {},
                      child: SizedBox(
                        height: 20.h,
                        child: Icon(
                          Icons.more_vert_rounded,
                          size: 20.w,
                          color: Color(0xff5c768d),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
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
                            widget.profilePic,
                            fit: BoxFit.cover,
                          ),
                        ),
                        12.horizontalSpace,
                        Expanded(
                          child: SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.postLocation ?? '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff5c768d),
                                        fontFamily: 'Campton',
                                        height: 1.1.h,
                                      ),
                                    ),
                                    4.horizontalSpace,
                                    Icon(
                                      Icons.location_on_rounded,
                                      size: 8.w,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        10.horizontalSpace,
                      ],
                    ),
                  ),
                  12.verticalSpace,
                  if (widget.hasText == true)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Text(
                        widget.postText ?? '',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontFamily: 'Campton',
                          height: 1.1.h,
                        ),
                      ),
                    ),
                  12.verticalSpace,
                  if (widget.postImage != null && widget.postImage!.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: buildPostImages(
                        widget.postImage!,
                        onImageTap: (index) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ViewImageScr(
                                postImage: widget.postImage!,
                                initialIndex: index,
                                profilePic: widget.profilePic,
                                profileName: widget.profileName,
                                haSiMage: true,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  12.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          widget.postDate,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff5c768d),
                            fontFamily: 'Campton',
                            height: 1.1.h,
                          ),
                        ),
                        4.horizontalSpace,
                        Icon(
                          Icons.circle_rounded,
                          size: 6.w,
                          color: Colors.white,
                        ),
                        4.horizontalSpace,
                        Text(
                          '56K Views',
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
                  12.verticalSpace,
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
                  12.verticalSpace,
                  Divider(color: Colors.white, thickness: 1.h, height: 1.h),
                  12.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 20.h,
                          width: 20.h,
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
                        8.horizontalSpace,
                        Container(
                          width: 220.w,
                          padding: EdgeInsets.all(10.sp),
                          decoration: BoxDecoration(
                            color: Color(0xff5c768d),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12.r),
                              topLeft: Radius.elliptical(2, 6).r,
                              bottomLeft: Radius.circular(12.r),
                              bottomRight: Radius.elliptical(12, 6).r,
                            ),
                            border: Border.all(
                              color: Colors.white,
                              width: 1.5.w,
                              strokeAlign: BorderSide.strokeAlignOutside,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'devCoolJoe',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontFamily: 'Campton',
                                  height: 1.1.h,
                                ),
                              ),
                              4.verticalSpace,
                              Text(
                                'Nice project done here, junior tech bro. more knowledge to your brain and more skills with very well paid gigs',
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
                        ),
                        8.horizontalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TouchOpacity(
                                  onTap: () {
                                    setState(() {
                                      iscommentLiked = !iscommentLiked;
                                    });
                                  },
                                  child: iscommentLiked
                                      ? Icon(
                                          Icons.favorite_rounded,
                                          size: 14.w,
                                          color: Color(0xff5c768d),
                                        )
                                      : Icon(
                                          Icons.favorite_border_rounded,
                                          size: 14.w,
                                          color: Colors.white,
                                        ),
                                ),
                                6.horizontalSpace,
                                Text(
                                  '40k',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontFamily: 'Campton',
                                    height: 1.1.h,
                                  ),
                                ),
                              ],
                            ),
                            8.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '2000 Replies',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontFamily: 'Campton',
                                    height: 1.1.h,
                                  ),
                                ),
                                2.horizontalSpace,
                                Icon(
                                  Icons.arrow_drop_down_rounded,
                                  size: 14.w,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  12.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 20.h,
                          width: 20.h,
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
                        8.horizontalSpace,
                        Container(
                          width: 220.w,
                          padding: EdgeInsets.all(10.sp),
                          decoration: BoxDecoration(
                            color: Color(0xff5c768d),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12.r),
                              topLeft: Radius.elliptical(2, 6).r,
                              bottomLeft: Radius.circular(12.r),
                              bottomRight: Radius.elliptical(12, 6).r,
                            ),
                            border: Border.all(
                              color: Colors.white,
                              width: 1.5.w,
                              strokeAlign: BorderSide.strokeAlignOutside,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'devCoolJoe',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontFamily: 'Campton',
                                  height: 1.1.h,
                                ),
                              ),
                              4.verticalSpace,
                              Text(
                                'Nice project done here, junior tech bro. more knowledge to your brain and more skills with very well paid gigs',
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
                        ),
                        8.horizontalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TouchOpacity(
                                  onTap: () {
                                    setState(() {
                                      iscommentLiked = !iscommentLiked;
                                    });
                                  },
                                  child: iscommentLiked
                                      ? Icon(
                                          Icons.favorite_rounded,
                                          size: 14.w,
                                          color: Color(0xff5c768d),
                                        )
                                      : Icon(
                                          Icons.favorite_border_rounded,
                                          size: 14.w,
                                          color: Colors.white,
                                        ),
                                ),
                                6.horizontalSpace,
                                Text(
                                  '40k',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontFamily: 'Campton',
                                    height: 1.1.h,
                                  ),
                                ),
                              ],
                            ),
                            8.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '2000 Replies',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontFamily: 'Campton',
                                    height: 1.1.h,
                                  ),
                                ),
                                2.horizontalSpace,
                                Icon(
                                  Icons.arrow_drop_down_rounded,
                                  size: 14.w,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  12.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 20.h,
                          width: 20.h,
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
                        8.horizontalSpace,
                        Container(
                          width: 220.w,
                          padding: EdgeInsets.all(10.sp),
                          decoration: BoxDecoration(
                            color: Color(0xff5c768d),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12.r),
                              topLeft: Radius.elliptical(2, 6).r,
                              bottomLeft: Radius.circular(12.r),
                              bottomRight: Radius.elliptical(12, 6).r,
                            ),
                            border: Border.all(
                              color: Colors.white,
                              width: 1.5.w,
                              strokeAlign: BorderSide.strokeAlignOutside,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'devCoolJoe',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontFamily: 'Campton',
                                  height: 1.1.h,
                                ),
                              ),
                              4.verticalSpace,
                              Text(
                                'Nice project done here, junior tech bro. more knowledge to your brain and more skills with very well paid gigs',
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
                        ),
                        8.horizontalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TouchOpacity(
                                  onTap: () {
                                    setState(() {
                                      iscommentLiked = !iscommentLiked;
                                    });
                                  },
                                  child: iscommentLiked
                                      ? Icon(
                                          Icons.favorite_rounded,
                                          size: 14.w,
                                          color: Color(0xff5c768d),
                                        )
                                      : Icon(
                                          Icons.favorite_border_rounded,
                                          size: 14.w,
                                          color: Colors.white,
                                        ),
                                ),
                                6.horizontalSpace,
                                Text(
                                  '40k',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontFamily: 'Campton',
                                    height: 1.1.h,
                                  ),
                                ),
                              ],
                            ),
                            8.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '2000 Replies',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontFamily: 'Campton',
                                    height: 1.1.h,
                                  ),
                                ),
                                2.horizontalSpace,
                                Icon(
                                  Icons.arrow_drop_down_rounded,
                                  size: 14.w,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  12.verticalSpace,
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.fromLTRB(
          12.w,
          8.h,
          12.w,
          MediaQuery.of(context).viewInsets.bottom + 8.h,
        ),
        decoration: BoxDecoration(
          color: const Color(0xff1e1e1e),
          border: Border(
            top: BorderSide(color: Colors.white, width: 1.w),
          ),
        ),
        child: Row(
          children: [
            Expanded(
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
    );
  }
}
