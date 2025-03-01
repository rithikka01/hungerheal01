import 'package:flutter/material.dart';
import 'foodprovider1.dart';
import 'foodrecepient.dart';
import 'volunteer.dart';

class WhoAreYouPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Who Are You?')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildOptionBox(context, 'Food Provider', FoodProviderPage()),
            buildOptionBox(context, 'Recipient', FoodRecipientPage()),
            buildOptionBox(context, 'Volunteer', VolunteerPage()),
          ],
        ),
      ),
    );
  }

  Widget buildOptionBox(BuildContext context, String title, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7, // Adaptive width
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 5, spreadRadius: 1),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
