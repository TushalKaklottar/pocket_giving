import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final double? borderRadius;
  final TextStyle? textStyle;

  const CommonButton({
    super.key,
    required this.text,
    this.onTap,
    this.padding,
    this.backgroundColor,
    this.borderRadius,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            padding ?? EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: backgroundColor ?? const Color(0xffFFAD7A),
          borderRadius: BorderRadius.circular(borderRadius ?? 100.r),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style:
              textStyle ??
              GoogleFonts.poppins(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xff12033B),
              ),
        ),
      ),
    );
  }
}
