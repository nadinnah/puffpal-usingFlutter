import 'dart:ui';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:puffpal/views/home_page.dart';
import 'package:puffpal/views/profile_page.dart';
import 'package:puffpal/views/quizzes_games_page.dart';
import 'package:puffpal/views/track_symptoms_page.dart';
import '../../controllers/language_controller.dart';
import '../../services/firestore_service.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  FirebaseServices firebaseServices = FirebaseServices();
  int index = 0;

  final List<Widget> pages = [HomePage(), ProfilePage(), QuizzesGamesPage()];

  final items = [
    Icon(Icons.home_filled, size: 30),
    Icon(Icons.person, size: 30),
    Icon(Icons.medical_information, size: 30),
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    final double titleSize = screenWidth * 0.08;       // ~28px on standard 400w screens
    final double subtitleSize = screenWidth * 0.055;  // ~22px
    final double bodySize = screenWidth * 0.035;
    final double buttonSize = screenWidth * 0.15;

    return Scaffold(
      backgroundColor:Color(0xFFA8ABCA) ,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        flexibleSpace: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.transparent),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: SafeArea(
            top: false,
            bottom: true,
            child: Text(
              'PuffPal',
              style: GoogleFonts.rubikBubbles(
                fontSize: titleSize,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E6097),
              ),
            ),
          ),
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5),
            child: SizedBox(
              width: buttonSize,
              child: DropdownButtonFormField<String>(
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.language, color: Colors.black),
                  ],
                ),
                style: TextStyle(fontSize: bodySize, color: Colors.black),
                // Smaller font for AppBar
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                initialValue: Localizations.localeOf(context).languageCode,
                items: [
                  const DropdownMenuItem(value: 'en', child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('EN'),
                    ],
                  )),
                  const DropdownMenuItem(value: 'ar', child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('AR'),
                    ],
                  )),
                ],
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    final langController = Provider.of<LanguageController>(
                      context,
                      listen: false,
                    );
                    langController.changeLanguage(newValue);
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: IconButton(
              iconSize: 20,
              color: Colors.black,
              onPressed: () {
                firebaseServices.signOut();
                Navigator.pushReplacementNamed(context, '/login');
              },
              icon: Icon(Icons.logout),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Theme(
        // This prevents the background of the nav bar from fighting with the Scaffold
        data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
        child: SafeArea(
          top: false,
          child: CurvedNavigationBar(
            animationDuration: Duration(milliseconds: 300),
            items: items,
            index: index,
            height: 60,
            color: Color(0xffd7d2e7),
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: Color(0xffd7d2e7),
            onTap: (selectedIndex) =>
                setState(() => this.index = selectedIndex),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFFD8D0E5),
                  Color(0xFFD9DBEF),
                  Color(0xFFA8ABCA),
                ],
              ),
            ),
          ),
          IndexedStack(index: index, children: pages),
        ],
      ),
    );
  }
}
