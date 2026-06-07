import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({super.key, required this.value, required this.onChanged});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onChanged(!widget.value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 42.w,
        height: 24.h,
        padding: EdgeInsets.only(right: 3.w, top: 2.h, bottom: 2.h),
        decoration: BoxDecoration(
          color: widget.value
              ? Color(0xff5c768d) // active track
              : Colors.white, // inactive track
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0.5.w, 0.5.h, 0.w, 0.5.h),
          child: Align(
            alignment: widget.value
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 21.w,
              height: 21.w,
              decoration: BoxDecoration(
                color: widget.value
                    ? Color(0xffffffff) // active thumb
                    : Color(0xffffffff), // inactive thumb
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
