import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socially/views/widgets/touch_opacity.dart';

class NotifList extends StatefulWidget {
  final String senderprofilePic;
  final bool isOnline;
  final String senderprofileName;
  final String senderMessage;
  final String timeofSenderMessage;
  final bool? isUnread;
  final String? noOfUnread;
  final bool? ifRead;
  const NotifList({
    super.key,
    required this.senderprofilePic,
    required this.senderprofileName,
    required this.senderMessage,
    required this.timeofSenderMessage,
    this.isUnread,
    this.noOfUnread,
    this.ifRead,
    required this.isOnline,
  });

  @override
  State<NotifList> createState() => _NotifListState();
}

class _NotifListState extends State<NotifList> {
  @override
  Widget build(BuildContext context) {
    return TouchOpacity(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40.h,
            width: 40.h,
            child: Stack(
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
                    widget.senderprofilePic,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 7.w,
                  bottom: 7.h,
                  child: widget.isOnline
                      ? Icon(
                          Icons.brightness_1_rounded,
                          size: 10.sp,
                          color: Colors.green,
                        )
                      : Icon(
                          Icons.brightness_1_rounded,
                          size: 10.sp,
                          color: Colors.white,
                        ),
                ),
              ],
            ),
          ),
          10.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.senderprofileName,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff5c768d),
                    fontFamily: 'Campton',
                    height: 1.1.h,
                  ),
                ),
                6.verticalSpace,
                Text(
                  widget.senderMessage,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white,
                    fontFamily: 'Campton',
                    fontWeight: FontWeight.w500,
                    height: 1.1.h,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.timeofSenderMessage,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white,
                  fontFamily: 'Campton',
                  fontWeight: FontWeight.w500,
                  height: 1.1.h,
                ),
              ),
              6.verticalSpace,
              if (widget.isUnread == true)
                Icon(
                  Icons.brightness_1_rounded,
                  size: 8.sp,
                  color: Color(0xff5c768d),
                ),
              if (widget.ifRead == true)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.brightness_1_rounded,
                      size: 8.sp,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.brightness_1_rounded,
                      size: 8.sp,
                      color: Colors.white,
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
