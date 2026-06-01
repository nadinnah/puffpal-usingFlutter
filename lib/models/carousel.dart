import 'package:flutter/material.dart';
import '../views/carousel items/asthma_basics.dart';
import '../views/carousel items/asthma_education_page.dart';
import '../views/carousel items/inhaler_techniques.dart';

class CarouselDataModel {
  final String title;
  final String imageName;
  final String subtitle;
  final Widget detailsPage;

  CarouselDataModel({
    required this.title,
    required this.imageName,
    required this.subtitle,
    required this.detailsPage,
  });
}

List<CarouselDataModel> carouselDataList = [
  CarouselDataModel(
    title: "Asthma Basics",
    imageName: "assets/images/asthma_basics.png",
    subtitle: "Learn the basics of asthma and its symptoms.",
    detailsPage: AsthmaBasicsPage(),
  ),
  CarouselDataModel(
    title: "Asthma Triggers",
    imageName: "assets/images/asthma_triggers.png",
    subtitle:
        "Identify and minimize daily irritants to keep your lungs healthy.",
    detailsPage: AsthmaEducationPage(mode: EducationMode.triggers),
  ),
  CarouselDataModel(
    title: "When to Seek Help",
    imageName: "assets/images/when_to_seek_help.png",
    subtitle:
        "Learn the warning signs of worsening asthma and when to seek care.",
    detailsPage: AsthmaEducationPage(mode: EducationMode.referral),
  ),
  CarouselDataModel(
    title: "Inhaler Techniques",
    imageName: "assets/images/inhaler_techniques.png",
    subtitle:
        "Master your proper inhaler usage step-by-step for better relief.",
    detailsPage: InhalerTechniquesPage(),
  ),
];

// Enum to tell AsthmaEducationPage which dataset to render beautifully
enum EducationMode { triggers, referral }
