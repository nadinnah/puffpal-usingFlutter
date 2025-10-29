import 'package:flutter/material.dart';
import '../services/firestore_service.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  FirebaseServices firebaseServices = FirebaseServices();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 50,),
              Row(
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

            ],
          ),
        ),
      ),
    );
  }
}
