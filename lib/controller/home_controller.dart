import 'package:get/get.dart';

import '../constant/assets.dart';
import '../constant/string.dart';
import '../model/charity_partner_model.dart';
import '../model/daily_streak_model.dart';
import '../model/donation_model.dart';
import '../model/pocket_fund_model.dart';

class HomeController extends GetxController {
  var days = <DayModel>[].obs;
  var funds = <PocketGivingFundModel>[].obs;
  var charityPartners = <CharityPartnerModel>[].obs;
  var donations = <DonationModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _initializeDays();
    _initializeFunds();
    _initializeCharityPartners();
    _initializeDonations();
  }

  void _initializeDonations() {
    donations.addAll([
      DonationModel(
        mainImage: AppAssets.learning,
        orgImage: AppAssets.charityImage,
        orgName: AppStrings.oliveAcademy,
        timeText: "180 ${AppStrings.daysLeft}",
        title: AppStrings.dailyBreakfastRaysOfHope,
        progressValue: 0.7,
        receivedText: "${AppStrings.received} £466.00",
        targetText: "${AppStrings.target} £1,000,000",
      ),
      DonationModel(
        mainImage: AppAssets.charityAcmImage,
        orgImage: AppAssets.charityMealImage,
        orgName: AppStrings.charityMeals,
        timeText: "27 ${AppStrings.daysLeft}",
        title: AppStrings.feedVillageThisRamadanMemoryLate,
        progressValue: 0.2,
        receivedText: "${AppStrings.received} £466.00",
        targetText: "${AppStrings.target} £1,000,000",
      ),
      DonationModel(
        mainImage: AppAssets.waterfallCharImage,
        orgImage: AppAssets.charityWaterImage,
        orgName: AppStrings.waterfallCharity,
        timeText: "27 ${AppStrings.daysLeft}",
        title: AppStrings.dailyBreakfastRaysHopeLearningCenter,
        progressValue: 0.5,
        receivedText: "${AppStrings.received} £466.00",
        targetText: "${AppStrings.target} £1,000,000",
      ),
      DonationModel(
        mainImage: AppAssets.cleanWaterImage,
        orgImage: AppAssets.cleanCharity,
        orgName: AppStrings.cleanWaterInitiative,
        timeText: "27 ${AppStrings.daysLeft}",
        title: AppStrings.installationOfWaterFiltrationSystems,
        progressValue: 0.8,
        receivedText: "${AppStrings.received} £466.00",
        targetText: "${AppStrings.target} £1,000,000",
      ),
    ]);
  }

  void _initializeCharityPartners() {
    charityPartners.addAll([
      CharityPartnerModel(
        name: "Olive Academy",
        iconPath: "assets/images/olive.png",
      ),
      CharityPartnerModel(
        name: "Zubeda Welcome",
        iconPath: "assets/images/zubeda.png",
      ),
      CharityPartnerModel(
        name: "Seven Spikes Sadaqah",
        iconPath: "assets/images/seven_spikes.png",
      ),
      CharityPartnerModel(
        name: "Aid 4 Ummah",
        iconPath: "assets/images/aid4ummah.png",
      ),
      CharityPartnerModel(
        name: "Waterfall",
        iconPath: "assets/images/waterfall.png",
      ),
    ]);
  }

  void _initializeDays() {
    days.add(DayModel(weekName: "Mon", iconPath: AppAssets.selectedFireStreak));
    days.add(DayModel(weekName: "Tue", iconPath: AppAssets.selectedFireStreak));
    days.add(DayModel(weekName: "Wen", iconPath: AppAssets.selectedFireStreak));
    days.add(
      DayModel(weekName: "Thu", iconPath: AppAssets.unselectedFireStreak),
    );
    days.add(
      DayModel(weekName: "Fri", iconPath: AppAssets.unselectedFireStreak),
    );
    days.add(
      DayModel(weekName: "Sat", iconPath: AppAssets.unselectedFireStreak),
    );
    days.add(
      DayModel(weekName: "Sun", iconPath: AppAssets.unselectedFireStreak),
    );
  }

  void _initializeFunds() {
    funds.addAll([
      PocketGivingFundModel(
        title: "Pocket Giving Zakat Fund",
        imagePath: "assets/images/giving_fund.png",
        stickerPath: "assets/images/sticker.png",
        countries: 14,
        projects: 9,
        description:
            "The Pocket Giving Zakat Fund ensures your Zakat reaches those most in need.",
        received: 2500,
        target: 50000,
      ),
      PocketGivingFundModel(
        title: "Pocket Giving Education Fund other",
        imagePath: "assets/images/giving_fund.png",
        stickerPath: "assets/images/sticker.png",
        countries: 10,
        projects: 6,
        description:
            "Support education for underprivileged children worldwide.",
        received: 2500,
        target: 50000,
      ),
      PocketGivingFundModel(
        title: "Pocket Giving Health Fund",
        imagePath: "assets/images/giving_fund.png",
        stickerPath: "assets/images/sticker.png",
        countries: 8,
        projects: 5,
        description: "Providing healthcare to those who need it most.",
        received: 12000,
        target: 30000,
      ),
    ]);
  }
}
