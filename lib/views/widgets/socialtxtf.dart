import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Socialtxtf extends StatefulWidget {
  final IconData? pfxIcon;
  final IconData? sfxIcon;
  final String hntTxt;
  const Socialtxtf({
    super.key,
    this.pfxIcon,
    this.sfxIcon,
    required this.hntTxt,
  });

  @override
  State<Socialtxtf> createState() => _SocialtxtfState();
}

class _SocialtxtfState extends State<Socialtxtf> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: 373.w,
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        style: TextStyle(
          fontSize: 14.sp,
          color: Colors.grey.shade600,
          fontFamily: 'Campton',
          fontWeight: FontWeight.w600,
          height: 1.1.h,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(
            widget.pfxIcon,
            color: Color(0xff5c768d),
            size: 18.w,
          ),
          suffixIcon: Icon(
            widget.sfxIcon,
            color: Color(0xff5c768d),
            size: 18.w,
          ),
          hintText: widget.hntTxt,
          hintStyle: TextStyle(
            fontSize: 12.sp,
            color: Colors.grey.shade600,
            fontFamily: 'Campton',
            fontWeight: FontWeight.w200,
            height: 1.1.h,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: Colors.grey.shade600, width: 1.w),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: Colors.grey.shade600, width: 1.w),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: Color(0xffd97c7c), width: 1.w),
          ),
        ),
      ),
    );
  }
}
