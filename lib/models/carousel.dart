import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../views/carousel items/asthma_basics.dart';
import '../views/carousel items/asthma_education_page.dart';
import '../views/carousel items/inhaler_techniques.dart';

enum EducationMode { triggers, referral }

class CarouselDataModel {
  final String id; // Stable developer identifier used for asset mapping & localization matching
  final String imageName;
  final Widget detailsPage;

  CarouselDataModel({
    required this.id,
    required this.imageName,
    required this.detailsPage,
  });

  /// Dynamically retrieves the localized title text
  String getLocalizedTitle(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (id) {
      case 'basics':
        return l10n.carouselBasicsTitle;
      case 'triggers':
        return l10n.carouselTriggersTitle;
      case 'help':
        return l10n.carouselHelpTitle;
      case 'inhaler':
        return l10n.carouselInhalerTitle;
      default:
        return '';
    }
  }

  /// Dynamically retrieves the localized subtitle descriptive paragraph
  String getLocalizedSubtitle(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (id) {
      case 'basics':
        return l10n.carouselBasicsSubtitle;
      case 'triggers':
        return l10n.carouselTriggersSubtitle;
      case 'help':
        return l10n.carouselHelpSubtitle;
      case 'inhaler':
        return l10n.carouselInhalerSubtitle;
      default:
        return '';
    }
  }
}

List<CarouselDataModel> carouselDataList = [
  CarouselDataModel(
    id: "basics",
    imageName: "assets/images/asthma_basics.png",
    detailsPage: const AsthmaBasicsPage(),
  ),
  CarouselDataModel(
    id: "triggers",
    imageName: "assets/images/asthma_triggers.png",
    detailsPage: const AsthmaEducationPage(mode: EducationMode.triggers),
  ),
  CarouselDataModel(
    id: "help",
    imageName: "assets/images/when_to_seek_help.png",
    detailsPage: const AsthmaEducationPage(mode: EducationMode.referral),
  ),
  CarouselDataModel(
    id: "inhaler",
    imageName: "assets/images/inhaler_techniques.png",
    detailsPage: const InhalerTechniquesPage(),
  ),
];