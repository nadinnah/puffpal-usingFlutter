import 'package:flutter/material.dart';

class AsthmaBasicsPage extends StatefulWidget {
  const AsthmaBasicsPage({super.key});

  @override
  State<AsthmaBasicsPage> createState() => _AsthmaBasicsPageState();
}

class _AsthmaBasicsPageState extends State<AsthmaBasicsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          ])
      )
    );
  }
}
