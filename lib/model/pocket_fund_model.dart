class PocketGivingFundModel {
  final String title;
  final String imagePath;
  final String stickerPath;
  final int countries;
  final int projects;
  final String description;
  final double received;
  final double target;
  final double progress;

  PocketGivingFundModel({
    required this.title,
    required this.imagePath,
    required this.stickerPath,
    required this.countries,
    required this.projects,
    required this.description,
    required this.received,
    required this.target,
  }) : progress = received / target;
}
