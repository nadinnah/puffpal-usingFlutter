import 'dart:ui';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puffpal/views/profile_page.dart';
import 'package:puffpal/views/track_symptoms_page.dart';
import '../services/firestore_service.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:puffpal/models/carousel.dart';

import 'carousel_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseServices firebaseServices = FirebaseServices();
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(
      initialPage: _currentPage,
      viewportFraction: 0.8,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(50.0, 115, 50, 30),
            child: Text(
              'Hello x. \nDiscover how understanding your health can make every breath easier!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Breathe Better, learn More',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TrackSymptomsPage()),
                );
              },
              child: Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(
                        'https://images.ctfassets.net/h8qzhh7m9m8u/3yLMtGnvAqt0mySfcZtkLi/5d195fa0b61f4f0f84d8fd6a47c03255/How_to_know_if_someone_is_having_an_asthma_attack__1_.png?fm=webp&w=2100&h=1200&fit=fill&bg=rgb:FFFFFF&q=70',
                      ),
                      ListTile(
                        leading: Icon(Icons.medical_information),
                        title: Text('Track Your Symptoms!'),
                        subtitle: Text('quick questions'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 50, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Breathe Better, learn More',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          AspectRatio(
            aspectRatio: 1.7,
            child: PageView.builder(
              itemCount: carouselDataList.length,
              physics: ClampingScrollPhysics(),
              controller: _pageController,
              itemBuilder: (BuildContext context, int index) {
                return carouselView(index);
              },
            ),
          ),
          SmoothPageIndicator(
            controller: _pageController,
            count: 6,
            effect: ExpandingDotsEffect(
              dotWidth: 10,
              dotHeight: 10,
              activeDotColor: Colors.grey,
              dotColor: Color(0x446E6E6E),
            ),
          ),
          SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget carouselView(int index) {
    return carouselCard(carouselDataList[index]);
  }

  Widget carouselCard(CarouselDataModel data) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Hero(
              tag: data.imageName,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CarouselDetailsPage(carouselData: data),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(data.imageName),
                      fit: BoxFit.fill,
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 5,
                        color: Color(0xff615f5f),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Text(
          data.title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
