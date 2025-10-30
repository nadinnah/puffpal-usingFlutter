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
            child: Text(
              widget.carouselData.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Hero(
            tag: widget.carouselData.imageName,
            child: SizedBox(
              height: 300,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(widget.carouselData.imageName),
                      fit: BoxFit.fill,
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 5,
                        color: Color(0xff615f5f),
                      ),
                    ],
                  ),
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
