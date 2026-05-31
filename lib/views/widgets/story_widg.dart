import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socially/views/widgets/add_to_story.dart';
import 'package:socially/views/widgets/touch_opacity.dart';
import 'package:socially/views/widgets/view_story.dart';

class StoryWidg extends StatefulWidget {
  final String? storyTitle;
  final String? storyChild;
  final bool yourStory;
  const StoryWidg({
    super.key,
    this.storyTitle,
    this.storyChild,
    required this.yourStory,
  });

  @override
  State<StoryWidg> createState() => _StoryWidgState();
}

class _StoryWidgState extends State<StoryWidg> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TouchOpacity(
            onTap: widget.yourStory
                ? () {
                    addToStory(context);
                  }
                : () {
                    viewStory(
                      context,
                      stories: [
                        'assets/images/img1.png',
                        'assets/images/img2.png',
                        'assets/images/img3.png',
                      ],
                    );
                  },
            child: Container(
              height: 60.h,
              width: 60.h,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.r),
                color: Colors.grey.shade200,

                border: Border.all(
                  color: Color(0xff5c768d),
                  width: 4.w,
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
              ),
              child: widget.yourStory
                  ? Center(
                      child: Icon(
                        Icons.add_a_photo_rounded,
                        size: 20.w,
                        color: Color(0xff5c768d),
                      ),
                    )
                  : Image.asset(widget.storyChild ?? '', fit: BoxFit.cover),
            ),
          ),
          10.verticalSpace,
          Text(
            widget.yourStory ? 'Your Story' : widget.storyTitle ?? '',
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
    );
  }
}
