import 'package:flutter/material.dart';
import '../../models/carousel.dart';

class CarouselDetailsPage extends StatelessWidget {
  final CarouselDataModel carouselData;

  const CarouselDetailsPage({super.key, required this.carouselData});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xFFD8D0E5), Color(0xFFD9DBEF), Color(0xFFA8ABCA)],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          carouselData.title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },

          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),
      ),

      body: carouselData.detailsPage,
        ));
  }
}
