import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String userName = "User Name!";
  final String userLocation =
      "5st street, 2nd avenue, east main road, Tambaram, Chennai";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        userName,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                  Icon(Icons.notifications, color: Colors.redAccent, size: 28),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(Icons.map, color: Colors.blueAccent),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      userLocation,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              "CLICK HERE FOR YOUR SERVICE",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFFED254E),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ServiceButton(title: "Food Provider"),
                SizedBox(width: 10),
                ServiceButton(title: "Recipient"),
                SizedBox(width: 10),
                ServiceButton(title: "Volunteer"),
              ],
            ),
            Spacer(),
            BottomNavBar(),
          ],
        ),
      ),
    );
  }
}

class ServiceButton extends StatelessWidget {
  final String title;

  const ServiceButton({required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFED254E),
        minimumSize: Size(91, 50),
      ),
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              icon: Icon(Icons.location_on, size: 28, color: Colors.black),
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.home, size: 28, color: Colors.black),
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.person, size: 28, color: Colors.black),
              onPressed: () {}),
        ],
      ),
    );
  }
}
