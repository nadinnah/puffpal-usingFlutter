import 'package:flutter/material.dart';

class AsthmaEducationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            "Asthma Education",

            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 20),

          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: ListTile(
                    leading: Icon(Icons.smoke_free),
                    title: Text("Avoid Cigarettes"),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.smoke_free),
                    title: Text("Avoid Vaping"),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.smoke_free),
                    title: Text("Avoid Perfumes"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
