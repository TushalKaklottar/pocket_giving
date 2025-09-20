import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import 'assets_svg.dart';
import 'common_button.dart';

class ActionBar extends StatelessWidget {
  final String favouriteCount;
  final String favouriteIconPath;
  final String shareIconPath;
  final String buttonText;
  final VoidCallback? onFavouriteTap;
  final VoidCallback? onShareTap;
  final VoidCallback? onButtonTap;

  const ActionBar({
    super.key,
    required this.favouriteCount,
    required this.favouriteIconPath,
    required this.shareIconPath,
    required this.buttonText,
    this.onFavouriteTap,
    this.onShareTap,
    this.onButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 16.w),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: onFavouriteTap,
                  child: CustomSvgIcon(
                    path: favouriteIconPath,
                    height: 20.h,
                    width: 20.w,
                  ),
                ),
                Gap(6.w),
                Text(
                  favouriteCount,
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff12033B),
                  ),
                ),
                SizedBox(width: 16.w),
                GestureDetector(
                  onTap: onShareTap,
                  child: CustomSvgIcon(
                    path: shareIconPath,
                    height: 20.h,
                    width: 20.w,
                  ),
                ),
              ],
            ),
            CommonButton(text: buttonText, onTap: onButtonTap),
          ],
        ),
      ),
    );
  }
}
