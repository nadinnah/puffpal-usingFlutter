import 'package:flutter/material.dart';
import '../views/asthma_education_page.dart';
import '../views/inhaler_techniques.dart';

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
    title: "Asthma Triggers",
    imageName: "assets/images/asthmaKids.jpg",
    subtitle: "Identify and minimize daily irritants to keep your lungs healthy.",
    detailsPage: AsthmaEducationPage(mode: EducationMode.triggers),
  ),
  CarouselDataModel(
    title: "When to Seek Help",
    imageName: "assets/images/asthma_alert.jpg",
    subtitle: "Learn the warning signs of worsening asthma and when to seek care.",
    detailsPage: AsthmaEducationPage(mode: EducationMode.referral),
  ),
  CarouselDataModel(
    title: "Inhaler Techniques",
    imageName: "assets/images/Asthma_Inhaler.jpg",
    subtitle: "Master your proper inhaler usage step-by-step for better relief.",
    detailsPage: InhalerTechniquesPage(),
  ),
];

// Enum to tell AsthmaEducationPage which dataset to render beautifully
enum EducationMode { triggers, referral }