import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pocket_give/constant/string.dart';
import 'package:pocket_give/widget/HorizontalListView.dart';
import 'package:pocket_give/widget/assets_images.dart';
import 'package:pocket_give/widget/assets_svg.dart';
import 'package:pocket_give/widget/donationCard.dart';
import '../constant/assets.dart';
import '../constant/color.dart';
import '../controller/home_controller.dart';
import '../widget/action_bar.dart';
import '../widget/section_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 16.h,
                    left: 16.w,
                    right: 16.w,
                    bottom: 16.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomAssetImage(
                        imagePath: AppAssets.logo,
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
                          CustomSvgIcon(
                            path: AppAssets.notification,
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
                      border: Border.all(color: Color(0xffDFE1E7), width: 1.h),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomSvgIcon(
                          path: AppAssets.search,
                          height: 20.h,
                          width: 20.w,
                        ),
                        Gap(8.w),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: AppStrings.searchForCharityProject,
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
                        CustomSvgIcon(
                          path: AppAssets.filter,
                          height: 32.h,
                          width: 32.w,
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(16.h),
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 12.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              image: DecorationImage(
                                image: AssetImage(AppAssets.streakBG),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    CustomAssetImage(
                                      imagePath: AppAssets.dailyStreak,
                                      height: 60.h,
                                      width: 60.w,
                                    ),
                                    Gap(9.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppStrings.dailyStreak,
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
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    CustomSvgIcon(
                                      path: AppAssets.forwardArrow,
                                      height: 24.h,
                                      width: 24.w,
                                    ),
                                  ],
                                ),
                                Gap(9.h),
                                Row(
                                  children: List.generate(
                                    controller.days.length,
                                    (index) {
                                      final day = controller.days[index];
                                      return Padding(
                                        padding: EdgeInsets.only(
                                          right:
                                              index !=
                                                      controller.days.length - 1
                                                  ? 20.w
                                                  : 0.w,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              day.iconPath ??
                                                  AppAssets
                                                      .unselectedFireStreak,
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

                        SectionHeader(
                          title: AppStrings.pocketGivingFunds,
                          actionText: AppStrings.seeAll,
                        ),

                        Gap(10.h),

                        HorizontalListView(
                          items: controller.funds,
                          itemBuilder: (context, fund, index) {
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
                                        bottom: 16.h,
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
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          AppColors
                                                              .textColorBlack,
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
                                              letterSpacing: 0.0.sp,
                                              color: Color(0xff727272),
                                            ),
                                          ),
                                          Gap(10.h),
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              10.r,
                                            ),
                                            child: SizedBox(
                                              width: double.infinity,
                                              child: LinearProgressIndicator(
                                                minHeight: 10.h,
                                                value: fund.progress,
                                                backgroundColor: const Color(
                                                  0xffd2f2fc,
                                                ),
                                                valueColor:
                                                    const AlwaysStoppedAnimation<
                                                      Color
                                                    >(Color(0xff57A4BB)),
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
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          AppColors
                                                              .textColorBlack,
                                                    ),
                                                  ),
                                                  Gap(2.h),
                                                  Text(
                                                    "£${fund.received}",
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          AppColors
                                                              .textColorBlack,
                                                    ),
                                                  ),
                                                  Text(
                                                    "£${fund.target}",
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
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

                        Gap(24.h),

                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.donations.length,
                          itemBuilder: (context, index) {
                            final donation = controller.donations[index];
                            return Padding(
                              padding: EdgeInsets.only(bottom: 24.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DonationCard(
                                    mainImage: donation.mainImage ?? "",
                                    orgImage: donation.orgImage ?? "",
                                    orgName: donation.orgName ?? "",
                                    timeText: donation.timeText ?? "",
                                    title: donation.title ?? "",
                                    progressValue:
                                        donation.progressValue ?? 0.0,
                                    receivedText: donation.receivedText ?? "",
                                    targetText: donation.targetText ?? "",
                                  ),
                                  Gap(4.h),
                                  ActionBar(
                                    favouriteCount: "10",
                                    favouriteIconPath: AppAssets.favouriteIcon,
                                    shareIconPath: AppAssets.shareIcon,
                                    buttonText: AppStrings.quickDonate,
                                  ),

                                  if (index == 2) ...[
                                    Gap(24.h),
                                    SectionHeader(
                                      title: AppStrings.charityPartners,
                                    ).paddingOnly(bottom: 10.h),

                                    HorizontalListView(
                                      items: controller.charityPartners,
                                      itemBuilder: (context, charity, idx) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                            left: idx == 0 ? 16.w : 12.w,
                                            right:
                                                idx ==
                                                        controller
                                                                .charityPartners
                                                                .length -
                                                            1
                                                    ? 12.w
                                                    : 0.w,
                                          ),
                                          child: Column(
                                            children: [
                                              Center(
                                                child: Image.asset(
                                                  charity.iconPath,
                                                  height: 56.h,
                                                  width: 56.w,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Gap(6.h),
                                              SizedBox(
                                                width: 70.w,
                                                child: Text(
                                                  charity.name,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                                  ],
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
