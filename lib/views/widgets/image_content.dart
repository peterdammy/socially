import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildPostImages(
  List<String> images, {
  required Function(int index) onImageTap,
}) {
  if (images.isEmpty) return const SizedBox();

  if (images.length == 1) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: GestureDetector(
        onTap: () => onImageTap(0),
        child: Image.asset(
          images[0],
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  final visibleImages = images.length > 4
      ? images.sublist(1, 4)
      : images.sublist(1);

  final remainingCount = images.length > 4 ? images.length - 4 : 0;

  return SizedBox(
    height: 250.h,
    child: Row(
      children: [
        /// FIRST IMAGE
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: GestureDetector(
              onTap: () => onImageTap(0),
              child: Image.asset(
                images[0],
                fit: BoxFit.cover,
                height: double.infinity,
              ),
            ),
          ),
        ),

        4.horizontalSpace,

        /// OTHER IMAGES
        Expanded(
          child: Column(
            children: List.generate(visibleImages.length, (index) {
              final image = visibleImages[index];

              final isLastVisible =
                  index == visibleImages.length - 1 && remainingCount > 0;

              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: index != visibleImages.length - 1 ? 4.h : 0,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: GestureDetector(
                      onTap: () => onImageTap(index + 1),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(image, fit: BoxFit.cover),

                          if (isLastVisible)
                            Container(
                              color: Colors.black54,
                              alignment: Alignment.center,
                              child: Text(
                                '+$remainingCount',
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    ),
  );
}
