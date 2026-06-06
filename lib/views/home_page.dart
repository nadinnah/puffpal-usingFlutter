import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:puffpal/services/sqlite_service.dart';
import 'package:puffpal/views/track_symptoms_page.dart';
import '../l10n/app_localizations.dart';
import '../services/advice_service.dart' as AdviceService;
import '../services/firestore_service.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:puffpal/models/carousel.dart';
import '../services/user_provider.dart';
import '../widgets/flip_card_widget.dart';
import 'carousel items/carousel_details_page.dart';

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
    final double screenWidth = MediaQuery.of(context).size.width;

    final double titleSize = screenWidth * 0.07; // ~28px
    final double subtitleSize = screenWidth * 0.055; // ~22px
    final double bodySize = screenWidth * 0.035;
    final userName = context.watch<UserProvider>().userName;

    final double screenHeight = MediaQuery.of(context).size.height;

    final double horizontalPadding = screenWidth * 0.05;

    final double verticalSpacing = screenHeight * 0.12;

    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        0,
        verticalSpacing,
        0,
        0.75 * verticalSpacing,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
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
                      backText: snapshot.data ?? "...",
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 30),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.logitLearnItControlIt,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TrackSymptomsPage(),
                      ),
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

                              style: GoogleFonts.roboto(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w400,
                                fontSize: bodySize,
                                color: Color(0xa11e1b1b),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 30),

          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.breatheBetter,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              AspectRatio(
                aspectRatio: 1.5,
                child: PageView.builder(
                  itemCount: carouselDataList.length,
                  physics: const ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (index) =>
                      setState(() => _currentPage = index),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: carouselView(index),
                    );
                  },
                ),
              ),
              SizedBox(height: 15),
              SmoothPageIndicator(
                controller: _pageController,
                count: carouselDataList.length,
                effect: ExpandingDotsEffect(
                  dotWidth: 10,
                  dotHeight: 10,
                  activeDotColor: Color(0xffd6d1e6),
                  dotColor: Color(0xffcccee5),
                ),
              ),
            ],
          ),
          SizedBox(height: verticalSpacing / 2),
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
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CarouselDetailsPage(carouselData: data),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(data.imageName),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 4),
                    blurRadius: 8,
                    color: Colors.black.withOpacity(0.2),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          data.getLocalizedTitle(context),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
