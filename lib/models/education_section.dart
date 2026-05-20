import 'package:flutter/material.dart';

class EducationSection {
  final String title;
  final IconData icon;
  final Color color;
  final List<String>? bullets;
  final String? image;
  final String? videoUrl;
  final Widget? child;

  EducationSection({
    required this.title,
    required this.icon,
    required this.color,
    this.bullets,
    this.image,
    this.videoUrl,
    this.child,
  });
}
