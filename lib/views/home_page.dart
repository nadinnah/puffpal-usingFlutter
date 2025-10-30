import 'package:flutter/material.dart';
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    iconSize: 20,
                    color: Colors.black,
                    onPressed: () {
                      firebaseServices.signOut();
                      Navigator.pushNamed(context, '/login');
                    },
                    icon: Icon(Icons.logout),
                  ),
                ],
              ),
            ),
             SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.fromLTRB(40.0,0,40,30),
              child: Text('Hello x. Discover how understanding your health can make every breath easier!'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40,0,40,0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TrackSymptomsPage()));
                },
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network('https://www.miraclemovers.com/wp-content/uploads/2021/08/How-to-hire-a-professional-moving-company.jpg', ),
                        ListTile(
                          leading: Icon(Icons.medical_information),
                          title: Text('Track Your Symptoms!'),
                          subtitle: Text('end-to-end logistics services'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
             SizedBox(height:50,),
             Padding(
               padding: const EdgeInsets.fromLTRB(50,0,0,0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Text('Breathe Better, learn More', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
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
          ],
        ),
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
              tag:data.imageName,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CarouselDetailsPage(carouselData: data)));
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

