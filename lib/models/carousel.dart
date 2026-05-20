import 'package:flutter/material.dart';

import '../views/asthma_education_page.dart';
import '../views/inhaler_techniques.dart';
import 'education_section.dart';

import 'package:flutter/material.dart';

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

    title: "Asthma Education",

    imageName: "assets/images/asthmaKids.jpg",

    subtitle: "Learn asthma triggers.",

    detailsPage: AsthmaEducationPage(),
  ),

  CarouselDataModel(

    title: "Inhaler Techniques",

    imageName: "assets/images/Asthma_Inhaler.jpg",

    subtitle: "Learn proper inhaler usage.",

    detailsPage: InhalerTechniquesPage(),
  ),
];

//
// List<CarouselDataModel> carouselDataList = [
//
//   CarouselDataModel(
//
//     title: "Asthma Education",
//
//     imageName: "assets/images/asthmaKids.jpg",
//
//     subtitle: "Learn asthma triggers and emergency signs.",
//
//     sections: [
//
//       /// SMOKE SECTION
//       EducationSection(
//
//         title: "Smoke & Air",
//
//         icon: Icons.smoke_free,
//
//         color: Colors.blue,
//
//         bullets: [
//           "Avoid cigarettes",
//           "Avoid vaping",
//           "Avoid perfumes",
//         ],
//       ),
//
//       /// ALLERGENS
//       EducationSection(
//
//         title: "Allergens",
//
//         icon: Icons.grass,
//
//         color: Colors.green,
//
//         bullets: [
//           "Dust",
//           "Pollen",
//           "Pet dander",
//         ],
//       ),
//
//       /// INHALER TECHNIQUES
//       EducationSection(
//
//         title: "Inhaler Techniques",
//
//         icon: Icons.air,
//
//         color: Colors.teal,
//
//         child: Wrap(
//           spacing: 10,
//           runSpacing: 10,
//
//           children: [
//
//             ElevatedButton(
//               onPressed: () {},
//               child: Text("MDI"),
//             ),
//
//             ElevatedButton(
//               onPressed: () {},
//               child: Text("Spacer"),
//             ),
//
//             ElevatedButton(
//               onPressed: () {},
//               child: Text("Nebulizer"),
//             ),
//           ],
//         ),
//       ),
//
//       /// EMERGENCY SECTION
//       EducationSection(
//
//         title: "Emergency Signs",
//
//         icon: Icons.emergency,
//
//         color: Colors.red,
//
//         child: Container(
//
//           padding: EdgeInsets.all(16),
//
//           decoration: BoxDecoration(
//             color: Colors.red.shade50,
//             borderRadius: BorderRadius.circular(20),
//           ),
//
//           child: Column(
//             children: [
//
//               Text(
//                 "Emergency Signs",
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 10),
//
//
//             ],
//           ),
//         ),
//       ),
//     ],
//   ),
// ];
