import 'package:get/get.dart';

import '../model/charity_partner_model.dart';
import '../model/daily_streak_model.dart';
import '../model/pocket_fund_model.dart';

class HomeController extends GetxController {
  var days = <DayModel>[].obs;
  var funds = <PocketGivingFundModel>[].obs;
  var charityPartners = <CharityPartnerModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _initializeDays();
    _initializeFunds();
    _initializeCharityPartners();
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
    days.add(
      DayModel(
        weekName: "Mon",
        iconPath: "assets/icon/selected_fire_streak.svg",
      ),
    );
    days.add(
      DayModel(
        weekName: "Tue",
        iconPath: "assets/icon/selected_fire_streak.svg",
      ),
    );
    days.add(
      DayModel(
        weekName: "Wed",
        iconPath: "assets/icon/selected_fire_streak.svg",
      ),
    );
    days.add(
      DayModel(
        weekName: "Thu",
        iconPath: "assets/icon/unselected_fire_streak.svg",
      ),
    );
    days.add(
      DayModel(
        weekName: "Fri",
        iconPath: "assets/icon/unselected_fire_streak.svg",
      ),
    );
    days.add(
      DayModel(
        weekName: "Sat",
        iconPath: "assets/icon/unselected_fire_streak.svg",
      ),
    );
    days.add(
      DayModel(
        weekName: "Sun",
        iconPath: "assets/icon/unselected_fire_streak.svg",
      ),
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
