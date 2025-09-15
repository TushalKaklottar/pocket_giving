import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pocket_give/constant/string.dart';
import '../constant/color.dart';
import '../controller/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16.w,
                      right: 16.w,
                      bottom: 16.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/images/logo.png",
                          height: 45.h,
                          width: 106.w,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "24",
                                  style: GoogleFonts.poppins(
                                    fontSize: 18.sp,
                                    letterSpacing: 0.15.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textColorBlack,
                                  ),
                                ),
                                Text(
                                  AppStrings.muharram1447,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textColorBlack,
                                    letterSpacing: 0.17.sp,
                                  ),
                                ),
                              ],
                            ),
                            Gap(16.w),
                            SvgPicture.asset(
                              "assets/icon/notification.svg",
                              height: 24.h,
                              width: 24.w,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 10.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: Color(0xffDFE1E7),
                          width: 1.h,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/icon/Search.svg",
                            height: 20.h,
                            width: 20.w,
                          ),
                          Gap(8.w),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Search for a charity or project.",
                                hintStyle: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff727272),
                                ),
                                border: InputBorder.none,
                                isCollapsed: true,
                              ),
                            ),
                          ),
                          Gap(10.w),
                          SvgPicture.asset(
                            "assets/icon/Filters.svg",
                            height: 32.h,
                            width: 32.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(16.h),

                  Padding(
                    padding: EdgeInsets.only(left: 16.w, right: 16.w),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/bg.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/daily_streak.png",
                                height: 60.h,
                                width: 60.w,
                              ),
                              Gap(9.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'DAILY STREAK',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                      letterSpacing: 3.sp,
                                    ),
                                  ),
                                  Gap(4.h),
                                  Text(
                                    '32 Days of giving',
                                    style: GoogleFonts.poppins(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      letterSpacing: 0.15.sp,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              SvgPicture.asset(
                                "assets/icon/forward_arrow.svg",
                                height: 24.h,
                                width: 24.w,
                              ),
                            ],
                          ),
                          Gap(9.h),
                          SizedBox(
                            height: 44.h,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.days.length,
                              itemBuilder: (context, index) {
                                final day = controller.days[index];
                                return Padding(
                                  padding: EdgeInsets.only(
                                    right:
                                        index != controller.days.length - 1
                                            ? 19.w
                                            : 0,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        day.iconPath ??
                                            "assets/icon/unselected_fire_streak.svg",
                                      ),
                                      Gap(4.h),
                                      Text(
                                        day.weekName ?? "",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(24.h),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Pocket Giving Funds",
                          style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textColorBlack,
                          ),
                        ),
                        Text(
                          "See All",
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff12033B),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(10.h),

                  SizedBox(
                    height: 325.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.funds.length,
                      itemBuilder: (context, index) {
                        final fund = controller.funds[index];
                        return Padding(
                          padding: EdgeInsets.only(
                            left: index == 0 ? 16.w : 8.w,
                            right:
                                index == controller.funds.length - 1
                                    ? 16.w
                                    : 8.w,
                          ),
                          child: Container(
                            width: 250.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12.r),
                                    topRight: Radius.circular(12.r),
                                  ),
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        fund.imagePath,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ),
                                      Positioned(
                                        left: 8.w,
                                        bottom: 8.h,
                                        child: Image.asset(
                                          fund.stickerPath,
                                          height: 19.h,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 10.w,
                                    right: 10.w,
                                    top: 16.h,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        fund.title,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Gap(10.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                "assets/icon/country.svg",
                                                height: 18.h,
                                                width: 18.w,
                                              ),
                                              Gap(8.w),
                                              Text(
                                                "${fund.countries} Countries",
                                                style: GoogleFonts.poppins(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      AppColors.textColorBlack,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                "assets/icon/project.svg",
                                              ),
                                              Gap(8.w),
                                              Text(
                                                "${fund.projects} Projects",
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Gap(10.h),
                                      Text(
                                        fund.description,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff727272),
                                        ),
                                      ),
                                      Gap(10.h),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          10.r,
                                        ),
                                        child: LinearProgressIndicator(
                                          minHeight: 10.h,
                                          value: fund.progress,
                                          backgroundColor: Color(0xffd2f2fc),
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                Color(0xff57A4BB),
                                              ),
                                        ),
                                      ),
                                      Gap(6.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Received",
                                                style: GoogleFonts.poppins(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      AppColors.textColorBlack,
                                                ),
                                              ),
                                              Gap(2.h),
                                              Text(
                                                "£${fund.received}",
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff727272),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                "Target",
                                                style: GoogleFonts.poppins(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      AppColors.textColorBlack,
                                                ),
                                              ),
                                              Text(
                                                "£${fund.target}",
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff727272),
                                                ),
                                              ),
                                            ],
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
                      },
                    ),
                  ),
                  Gap(24.h),

                  Padding(
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
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12.r),
                              topRight: Radius.circular(12.r),
                            ),
                            child: Image.asset(
                              "assets/images/learning.png",
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 16.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/charity.png",
                                          height: 30.h,
                                          width: 30.w,
                                        ),
                                        Gap(10.w),
                                        Text(
                                          "Olive Academy",
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
                                          "assets/icon/time.svg",
                                        ),
                                        Gap(4.w),
                                        Text(
                                          "180 days left",
                                          style: GoogleFonts.poppins(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff727272),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Gap(10.h),
                                Text(
                                  "Daily breakfast at rays of hope learning center",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textColorBlack,
                                  ),
                                ),
                                Gap(8.h),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.r),
                                  child: LinearProgressIndicator(
                                    minHeight: 10.h,
                                    value: 50 / 100,
                                    backgroundColor: Color(0xffd2f2fc),
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Color(0xff57A4BB),
                                    ),
                                  ),
                                ),
                                Gap(6.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Received: £466.00",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff727272),
                                        letterSpacing: 0.17.sp,
                                      ),
                                    ),
                                    Text(
                                      "Target: £1,000,000",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff727272),
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
                  ),
                  Gap(4.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 13.h,
                        horizontal: 16.w,
                      ),
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
                              SvgPicture.asset(
                                "assets/icon/favourite.svg",
                                height: 20.h,
                                width: 20.w,
                              ),
                              Gap(6.w),
                              Text(
                                "12",
                                style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff12033B),
                                ),
                              ),
                              SizedBox(width: 16.w),
                              SvgPicture.asset(
                                "assets/icon/share.svg",
                                height: 20.h,
                                width: 20.w,
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 8.h,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xffFFAD7A),
                              borderRadius: BorderRadius.circular(100.r),
                            ),
                            child: Text(
                              "Quick Donate",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff12033B),
                              ),
                            ),
                          ),
                          // ElevatedButton(
                          //   onPressed: () {},
                          //   style: ElevatedButton.styleFrom(
                          //     backgroundColor: const Color(0xffFFAD7A),
                          //     shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(25.r),
                          //     ),
                          //     padding: EdgeInsets.symmetric(
                          //       horizontal: 14.w,
                          //       vertical: 12.h,
                          //     ),
                          //     elevation: 0,
                          //   ),
                          //   child: Text(
                          //     "Quick Donate",
                          //     style: TextStyle(
                          //       fontSize: 12.sp,
                          //       fontWeight: FontWeight.w500,
                          //       color: const Color(0xff12033B),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),

                  Gap(24.h),

                  Padding(
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
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12.r),
                              topRight: Radius.circular(12.r),
                            ),
                            child: Image.asset(
                              "assets/images/cherity_acm.png",
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 16.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/charity_meal.png",
                                          height: 32.h,
                                          width: 32.w,
                                        ),
                                        Gap(10.w),
                                        Text(
                                          "Charity meals",
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
                                          "assets/icon/time.svg",
                                        ),
                                        Gap(4.w),
                                        Text(
                                          "27 days left",
                                          style: GoogleFonts.poppins(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff727272),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Gap(10.h),
                                Text(
                                  "Feed a village this Ramadan-In memory of late Mohammed Salim Mulla",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textColorBlack,
                                  ),
                                ),
                                Gap(8.h),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.r),
                                  child: LinearProgressIndicator(
                                    minHeight: 10.h,
                                    value: 50 / 100,
                                    backgroundColor: Color(0xffd2f2fc),
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Color(0xff57A4BB),
                                    ),
                                  ),
                                ),
                                Gap(6.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Received: £466.00",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff727272),
                                        letterSpacing: 0.17.sp,
                                      ),
                                    ),
                                    Text(
                                      "Target: £2,000",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff727272),
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
                  ),
                  Gap(4.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 13.h,
                        horizontal: 16.w,
                      ),
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
                              SvgPicture.asset(
                                "assets/icon/favourite.svg",
                                height: 20.h,
                                width: 20.w,
                              ),
                              Gap(6.w),
                              Text(
                                "12",
                                style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff12033B),
                                ),
                              ),
                              SizedBox(width: 16.w),
                              SvgPicture.asset(
                                "assets/icon/share.svg",
                                height: 20.h,
                                width: 20.w,
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 8.h,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xffFFAD7A),
                              borderRadius: BorderRadius.circular(100.r),
                            ),
                            child: Text(
                              "Quick Donate",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff12033B),
                              ),
                            ),
                          ),
                          // ElevatedButton(
                          //   onPressed: () {},
                          //   style: ElevatedButton.styleFrom(
                          //     backgroundColor: const Color(0xffFFAD7A),
                          //     shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(25.r),
                          //     ),
                          //     padding: EdgeInsets.symmetric(
                          //       horizontal: 14.w,
                          //       vertical: 12.h,
                          //     ),
                          //     elevation: 0,
                          //   ),
                          //   child: Text(
                          //     "Quick Donate",
                          //     style: TextStyle(
                          //       fontSize: 12.sp,
                          //       fontWeight: FontWeight.w500,
                          //       color: const Color(0xff12033B),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),

                  Gap(24.h),

                  Padding(
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
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12.r),
                              topRight: Radius.circular(12.r),
                            ),
                            child: Image.asset(
                              "assets/images/waterfall_char.png",
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 16.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/charity_water.png",
                                          height: 30.h,
                                          width: 30.w,
                                        ),
                                        Gap(10.w),
                                        Text(
                                          "Waterfall Charity",
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
                                          "assets/icon/time.svg",
                                        ),
                                        Gap(4.w),
                                        Text(
                                          "180 days left",
                                          style: GoogleFonts.poppins(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff727272),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Gap(10.h),
                                Text(
                                  "Daily breakfast at rays of hope learning center",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textColorBlack,
                                  ),
                                ),
                                Gap(8.h),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.r),
                                  child: LinearProgressIndicator(
                                    minHeight: 10.h,
                                    value: 50 / 100,
                                    backgroundColor: Color(0xffd2f2fc),
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Color(0xff57A4BB),
                                    ),
                                  ),
                                ),
                                Gap(6.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Received: £466.00",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff727272),
                                        letterSpacing: 0.17.sp,
                                      ),
                                    ),
                                    Text(
                                      "Target: £1,000,000",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff727272),
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
                  ),
                  Gap(4.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 13.h,
                        horizontal: 16.w,
                      ),
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
                              SvgPicture.asset(
                                "assets/icon/favourite.svg",
                                height: 20.h,
                                width: 20.w,
                              ),
                              Gap(6.w),
                              Text(
                                "22",
                                style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff12033B),
                                ),
                              ),
                              SizedBox(width: 16.w),
                              SvgPicture.asset(
                                "assets/icon/share.svg",
                                height: 20.h,
                                width: 20.w,
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 8.h,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xffFFAD7A),
                              borderRadius: BorderRadius.circular(100.r),
                            ),
                            child: Text(
                              "Quick Donate",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff12033B),
                              ),
                            ),
                          ),
                          // ElevatedButton(
                          //   onPressed: () {},
                          //   style: ElevatedButton.styleFrom(
                          //     backgroundColor: const Color(0xffFFAD7A),
                          //     shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(25.r),
                          //     ),
                          //     padding: EdgeInsets.symmetric(
                          //       horizontal: 14.w,
                          //       vertical: 12.h,
                          //     ),
                          //     elevation: 0,
                          //   ),
                          //   child: Text(
                          //     "Quick Donate",
                          //     style: TextStyle(
                          //       fontSize: 12.sp,
                          //       fontWeight: FontWeight.w500,
                          //       color: const Color(0xff12033B),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),

                  Gap(24.h),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      "Charity Partners",
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColorBlack,
                      ),
                    ),
                  ),
                  Gap(12.h),
                  SizedBox(
                    height: 96.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.charityPartners.length,
                      itemBuilder: (context, index) {
                        final partner = controller.charityPartners[index];
                        return Padding(
                          padding: EdgeInsets.only(
                            left: index == 0 ? 16.w : 12.w,
                            right:
                                index == controller.charityPartners.length - 1
                                    ? 16.w
                                    : 0.w,
                          ),
                          child: Column(
                            children: [
                              Center(
                                child: Image.asset(
                                  partner.iconPath,
                                  height: 56.h,
                                  width: 56.w,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Gap(6.h),
                              SizedBox(
                                width: 70.w,
                                child: Text(
                                  partner.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  Gap(24.h),

                  Padding(
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
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12.r),
                              topRight: Radius.circular(12.r),
                            ),
                            child: Image.asset(
                              "assets/images/clean_water.png",
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 16.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/clean_charity.png",
                                          height: 30.h,
                                          width: 30.w,
                                        ),
                                        Gap(10.w),
                                        Text(
                                          "Clean Water Initiative",
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
                                          "assets/icon/time.svg",
                                        ),
                                        Gap(4.w),
                                        Text(
                                          "180 days left",
                                          style: GoogleFonts.poppins(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff727272),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Gap(10.h),
                                Text(
                                  "Installation of water filtration systems in rural villages",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textColorBlack,
                                  ),
                                ),
                                Gap(8.h),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.r),
                                  child: LinearProgressIndicator(
                                    minHeight: 10.h,
                                    value: 50 / 100,
                                    backgroundColor: Color(0xffd2f2fc),
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Color(0xff57A4BB),
                                    ),
                                  ),
                                ),
                                Gap(6.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Received: £466.00",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff727272),
                                        letterSpacing: 0.17.sp,
                                      ),
                                    ),
                                    Text(
                                      "Target: £1,000,000",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff727272),
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
                  ),
                  Gap(4.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 13.h,
                        horizontal: 16.w,
                      ),
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
                              SvgPicture.asset(
                                "assets/icon/favourite.svg",
                                height: 20.h,
                                width: 20.w,
                              ),
                              Gap(6.w),
                              Text(
                                "39",
                                style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff12033B),
                                ),
                              ),
                              SizedBox(width: 16.w),
                              SvgPicture.asset(
                                "assets/icon/share.svg",
                                height: 20.h,
                                width: 20.w,
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 8.h,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xffFFAD7A),
                              borderRadius: BorderRadius.circular(100.r),
                            ),
                            child: Text(
                              "Quick Donate",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff12033B),
                              ),
                            ),
                          ),
                          // ElevatedButton(
                          //   onPressed: () {},
                          //   style: ElevatedButton.styleFrom(
                          //     backgroundColor: const Color(0xffFFAD7A),
                          //     shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(25.r),
                          //     ),
                          //     padding: EdgeInsets.symmetric(
                          //       horizontal: 14.w,
                          //       vertical: 12.h,
                          //     ),
                          //     elevation: 0,
                          //   ),
                          //   child: Text(
                          //     "Quick Donate",
                          //     style: TextStyle(
                          //       fontSize: 12.sp,
                          //       fontWeight: FontWeight.w500,
                          //       color: const Color(0xff12033B),
                          //     ),
                          //   ),
                          // ),
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
  }
}
