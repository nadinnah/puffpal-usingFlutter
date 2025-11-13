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

  @override
  Widget build(BuildContext context) {
    final items = [
      Icon(Icons.home_filled, size: 30),
      Icon(Icons.person, size: 30),
      Icon(Icons.medical_information, size: 30),
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        flexibleSpace: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.transparent),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
          child: Text(
            'PuffPal',
            style: GoogleFonts.rubikBubbles(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1E6097),
            ),
          ),
        ),
        elevation: 0,
        actions: [
          Row(
            children: [
              PopupMenuButton<String>(
                onSelected: (value) {
                  final langController = Provider.of<LanguageController>(context, listen: false);
                  langController.changeLanguage(value);
                },
                itemBuilder: (BuildContext context) {
                  return [
                    const PopupMenuItem<String>(value: 'en', child: Text('English')),
                    const PopupMenuItem<String>(value: 'ar', child: Text('العربية')),
                  ];
                },
                child: Text(
                  Localizations.localeOf(context).languageCode == 'ar' ? 'العربية' : 'English',
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Icon(Icons.arrow_drop_down, size: 30,),
              SizedBox(width: 30,),

              IconButton(
                iconSize: 20,
                color: Colors.black,
                onPressed: () {
                  firebaseServices.signOut();
                  Navigator.pushReplacementNamed(context, '/login');
                },
                icon: Icon(Icons.logout),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: Duration(milliseconds: 300),
        items: items,
        index: index,
        height: 60,
        color: Color(0xffd7d2e7),
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Color(0xffd7d2e7),
        onTap: (selectedIndex) => setState(() => this.index = selectedIndex),
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
          pages[index],
        ],
      ),
    );
  }
}
