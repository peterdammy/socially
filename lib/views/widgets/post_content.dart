import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostContent extends StatefulWidget {
  final String profilePic;
  final String profileName;
  final String postDate;
  final String? postLocation;
  final String? postText;
  final String? postImage;
  final bool? hasImage;
  const PostContent({
    super.key,
    required this.profilePic,
    required this.profileName,
    required this.postDate,
    this.postLocation,
    this.postText,
    this.postImage,
    this.hasImage,
  });

  @override
  State<PostContent> createState() => _PostContentState();
}

class _PostContentState extends State<PostContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.favorite_border_rounded,
                size: 16.w,
                color: Colors.grey.shade500,
              ),
              6.horizontalSpace,
              Text(
                'Like',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade500,
                  fontFamily: 'Campton',
                  height: 1.1.h,
                ),
              ),
              8.horizontalSpace,
              Icon(
                Icons.comment_outlined,
                size: 16.w,
                color: Colors.grey.shade500,
              ),
              6.horizontalSpace,
              Text(
                'Comment',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade500,
                  fontFamily: 'Campton',
                  height: 1.1.h,
                ),
              ),
              8.horizontalSpace,
              Icon(
                Icons.ios_share_outlined,
                size: 16.w,
                color: Colors.grey.shade500,
              ),
              6.horizontalSpace,
              Text(
                'Share',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade500,
                  fontFamily: 'Campton',
                  height: 1.1.h,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
