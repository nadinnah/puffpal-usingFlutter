import 'package:flutter/material.dart';
import '../models/carousel.dart';

class CarouselDetailsPage extends StatefulWidget {
  final CarouselDataModel carouselData;

  const CarouselDetailsPage({super.key, required this.carouselData});

  @override
  State<CarouselDetailsPage> createState() => _CarouselDetailsPageState();
}

class _CarouselDetailsPageState extends State<CarouselDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),
      ),

      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Hero(
              tag: widget.carouselData.title,
              child: Center(
                child: Text(
                  widget.carouselData.title,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(widget.carouselData.description),
          ),
        ],
      ),
    );
  }
}
