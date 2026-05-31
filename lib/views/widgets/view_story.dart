import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socially/views/widgets/socialtxtf.dart';
import 'package:socially/views/widgets/touch_opacity.dart';

void viewStory(BuildContext context, {required List<String> stories}) {
  int currentStoryIndex = 0;
  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 60.h,
            ),
            insetAnimationCurve: Curves.bounceOut,
            child: Container(
              height: 650.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Color(0xff1e1e1e).withValues(alpha: 0.90),
              ),
              child: GestureDetector(
                onTapUp: (details) {
                  final width = MediaQuery.sizeOf(context).width;
                  final dx = details.localPosition.dx;
                  if (dx < width * 0.33) {
                    if (currentStoryIndex > 0) {
                      setState(() {
                        currentStoryIndex--;
                      });
                    }
                  } else if (dx > width * 0.67) {
                    if (currentStoryIndex < stories.length - 1) {
                      setState(() {
                        currentStoryIndex++;
                      });
                    }
                  }
                },
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.asset(
                          stories[currentStoryIndex],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: EdgeInsets.all(8.sp),
                        child: Column(
                          children: [
                            10.verticalSpace,
                            Row(
                              children: List.generate(
                                stories.length,
                                (index) => Expanded(
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 2.w,
                                    ),
                                    height: 3.h,
                                    decoration: BoxDecoration(
                                      color: index <= currentStoryIndex
                                          ? Colors.grey.shade300
                                          : Colors.grey.shade500,
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            12.verticalSpace,
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
                                      strokeAlign:
                                          BorderSide.strokeAlignOutside,
                                    ),
                                  ),
                                  child: Image.asset(
                                    'assets/images/avatar.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                12.horizontalSpace,
                                Expanded(
                                  child: SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'DevCOOLJoe',
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
                                    color: Colors.grey.shade500,
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 300.w,
                              child: Socialtxtf(
                                hntTxt: 'Enter text...',
                                sfxIcon: Icons.send_rounded,
                                pfxIcon: Icons.emoji_emotions_rounded,
                              ),
                            ),
                            12.horizontalSpace,
                            Icon(
                              Icons.mic_rounded,
                              size: 20.sp,
                              color: Colors.grey.shade500,
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
        },
      );
    },
  );
}
