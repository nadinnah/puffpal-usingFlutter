import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puffpal/services/sqlite_service.dart';
import 'package:puffpal/views/track_symptoms_page.dart';
import '../l10n/app_localizations.dart';
import '../services/advice_service.dart';
import '../services/advice_service.dart' as AdviceService;
import '../services/firestore_service.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:puffpal/models/carousel.dart';

import '../services/user_provider.dart';
import '../widgets/flip_card_widget.dart';
import 'carousel_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseServices firebaseServices = FirebaseServices();
  LocalDatabase localDatabase = LocalDatabase();

  late PageController _pageController;
  int _currentPage = 0;
  String userName = '';

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentPage,
      viewportFraction: 0.8,
    );
    _initializeUser();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void _initializeUser() async {
    String? name = await localDatabase.getNameByEmail(auth.currentUser!.email!);
    if (mounted) {
      context.read<UserProvider>().updateName(name ?? 'Guest');
    }
  }

  @override
  Widget build(BuildContext context) {
    final userName = context.watch<UserProvider>().userName;

    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    final double horizontalPadding = screenWidth * 0.08;

    final double verticalSpacing = screenHeight * 0.1;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalSpacing),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.hello(userName),
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              FutureBuilder<String>(
                future: AdviceService.getAdviceFromJson(context),
                builder: (context, snapshot) {
                  return FlipCardWidget(
                    frontText: AppLocalizations.of(context)!.advice_title,
                    // If the future isn't done, show "...", otherwise show the translated text
                    backText: snapshot.data ?? "...",
                  );
                },
              ),
              SizedBox(height: verticalSpacing),
            ],
          ),
          // TextButton(onPressed: ()async{
          //   await FirebaseApi().sendNotificationToUser(
          //       auth.currentUser!.uid,'Cold Weather Alert ❄️',
          //     'The temperature today is 12°C — stay warm and avoid exposure.'
          //
          //   );
          //}, child: Text('Send notif')),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.breatheBetter,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TrackSymptomsPage()),
              );
            },
            child: Card(
              surfaceTintColor: Color(0xffd8d6ea),
              color: Color(0xffe6e8fb),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(
                      'https://images.ctfassets.net/h8qzhh7m9m8u/3yLMtGnvAqt0mySfcZtkLi/5d195fa0b61f4f0f84d8fd6a47c03255/How_to_know_if_someone_is_having_an_asthma_attack__1_.png?fm=webp&w=2100&h=1200&fit=fill&bg=rgb:FFFFFF&q=70',
                    ),
                    ListTile(
                      title: Text(
                        AppLocalizations.of(context)!.trackSymptoms,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        AppLocalizations.of(context)!.quickQuestions,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.breatheBetter,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          AspectRatio(
            aspectRatio: 1.2,
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
              activeDotColor: Color(0xffd6d1e6),
              dotColor: Color(0xffcccee5),
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
          child: Hero(
            tag: data.title,
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
        Text(
          data.title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
