import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socially/views/screens/route_Scr/post_scr/post_content_scr.dart';
import 'package:socially/views/widgets/touch_opacity.dart';

class PostContent extends StatefulWidget {
  final String profilePic;
  final String profileName;
  final String postDate;
  final String? postLocation;
  final String? postText;
  final String? postImage;
  final bool? hasText;
  final bool? hasImage;
  final bool? isLiked;
  const PostContent({
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
  });

  @override
  State<PostContent> createState() => _PostContentState();
}

class _PostContentState extends State<PostContent> {
  late bool isLiked;

  @override
  void initState() {
    super.initState();
    isLiked = widget.isLiked ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return TouchOpacity(
      onTap: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostContentScr(
              postDate: widget.postDate,
              profilePic: widget.profilePic,
              profileName: widget.profileName,
              postLocation: widget.postLocation,
              postText: widget.postText,
              postImage: widget.postImage,
              hasText: widget.hasText,
              hasImage: widget.hasImage,
              isLiked: isLiked,
            ),
          ),
        );

        if (result != null) {
          setState(() {
            isLiked = result as bool;
          });
        }
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          border: Border.all(width: 2.w, color: Color(0xff5c768d)),
          borderRadius: BorderRadius.circular(12.r),
          color: Color(0xff1e1e1e),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                  child: Image.asset(widget.profilePic, fit: BoxFit.cover),
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
                            color: Colors.grey.shade500,
                            fontFamily: 'Campton',
                            height: 1.1.h,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                              color: Colors.grey.shade500,
                            ),
                            4.horizontalSpace,
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
                              color: Colors.grey.shade500,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                10.horizontalSpace,
                Icon(
                  Icons.more_horiz_rounded,
                  size: 16.w,
                  color: Colors.grey.shade500,
                ),
              ],
            ),
            12.verticalSpace,
            if (widget.hasText == true)
              Text(
                widget.postText ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade500,
                  fontFamily: 'Campton',
                  height: 1.1.h,
                ),
              ),
            12.verticalSpace,
            if (widget.hasImage == true)
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.grey.shade800,
                ),
                child: Image.asset(widget.postImage ?? '', fit: BoxFit.cover),
              ),
            12.verticalSpace,
            SizedBox(
              width: 100.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            size: 16.w,
                            color: const Color(0xff5c768d),
                          )
                        : Icon(
                            Icons.favorite_border_rounded,
                            size: 16.w,
                            color: Colors.grey.shade500,
                          ),
                  ),

                  8.horizontalSpace,
                  Icon(
                    Icons.comment_outlined,
                    size: 16.w,
                    color: Colors.grey.shade500,
                  ),
                  8.horizontalSpace,
                  Icon(
                    Icons.share_rounded,
                    size: 16.w,
                    color: Colors.grey.shade500,
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
