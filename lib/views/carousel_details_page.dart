import 'package:flutter/material.dart';
import '../models/carousel.dart';

class CarouselDetailsPage extends StatelessWidget {

  final CarouselDataModel carouselData;

  const CarouselDetailsPage({
    super.key,
    required this.carouselData,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        elevation: 0,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },

          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
      ),

      body: carouselData.detailsPage,
    );
  }
}