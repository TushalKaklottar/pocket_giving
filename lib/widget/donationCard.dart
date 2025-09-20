import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constant/assets.dart';
import '../constant/color.dart';
import 'assets_images.dart';
import 'assets_svg.dart';

class DonationCard extends StatelessWidget {
  final String mainImage;
  final String orgImage;
  final String orgName;
  final String title;
  final String timeText;
  final double progressValue;
  final String receivedText;
  final String targetText;

  const DonationCard({
    super.key,
    required this.mainImage,
    required this.orgImage,
    required this.orgName,
    required this.title,
    required this.timeText,
    required this.progressValue,
    required this.receivedText,
    required this.targetText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    topRight: Radius.circular(12.r),
                  ),
                  child: CustomAssetImage(
                    imagePath: mainImage,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 160.h,
                  ),
                ),
                Positioned(
                  top: 12.h,
                  right: 12.w,
                  child: CustomSvgIcon(path: AppAssets.slider),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomAssetImage(
                            imagePath: orgImage,
                            height: 30.h,
                            width: 30.w,
                          ),
                          Gap(10.w),
                          Text(
                            orgName,
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColorBlack,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppAssets.timeIcon,
                            height: 18.h,
                            width: 18.w,
                          ),
                          Gap(4.w),
                          Text(
                            timeText,
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff727272),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Gap(10.h),

                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColorBlack,
                      letterSpacing: 0.sp,
                    ),
                  ),

                  Gap(8.h),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: LinearProgressIndicator(
                      minHeight: 8.h,
                      value: progressValue,
                      backgroundColor: const Color(0xffd2f2fc),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Color(0xff57A4BB),
                      ),
                    ),
                  ),

                  Gap(6.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        receivedText,
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff727272),
                          letterSpacing: 0.17.sp,
                        ),
                      ),
                      Text(
                        targetText,
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff727272),
                          letterSpacing: 0.17.sp,
                        ),
                      ),
                    ],
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
