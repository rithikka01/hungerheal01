import 'package:flutter/material.dart';
import 'dart:math';

class VolunteerPage extends StatelessWidget {
  final List<Map<String, String>> deliveries = [
    {
      "food": "Rice & Curry",
      "pickup": "Community Center",
      "drop": "Shelter Home"
    },
    {"food": "Bread & Soup", "pickup": "Food Bank", "drop": "School"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Upcoming Deliveries',
          style: TextStyle(
            color: Color(0xFFED254E),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NotificationPage()));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: List.generate(deliveries.length, (index) {
            return buildDeliveryBox(context, deliveries[index]["food"]!,
                deliveries[index]["pickup"]!, deliveries[index]["drop"]!);
          }),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on), label: 'Live Location'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chatbot'),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfilePage()));
          }
        },
      ),
    );
  }

  Widget buildDeliveryBox(
      BuildContext context, String food, String pickup, String drop) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'From: $pickup',
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text('To: $drop',
              style: const TextStyle(fontSize: 14, color: Colors.black)),
          const SizedBox(height: 5),
          Text(
            'Deliver: $food',
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 5),
          const Text(
            '₹100',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HurrayPage()),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text('Accept'),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('Deny'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text("Notifications",
            style: TextStyle(color: Color(0xFFED254E))),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          NotificationItem("New food donation available."),
          NotificationItem("Reminder: Deliver food before 5 PM."),
          NotificationItem("Your delivery was successfully completed."),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title:
            const Text("Profile", style: TextStyle(color: Color(0xFFED254E))),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileField("Full Name"),
            ProfilePictureUpload(),
            ProfileField("Phone Number"),
            ProfileField("Email Address"),
            ProfileField("Current Location (GPS Enabled)"),
            ProfileField("Availability (Days & Time Slots)"),
            ProfileField("Preferred Service Area (City/Region)"),
            ProfileField("Mode of Transport"),
            ProfileField("Tasks Completed (Delivery History)"),
            ProfileField("Ratings & Reviews"),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Sign out action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFED254E),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                ),
                child: const Text("Sign Out",
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HurrayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hurray!',
              style: TextStyle(
                color: Color(0xFFED254E),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Let's start the journey of giving",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text('Get Directions'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileField extends StatelessWidget {
  final String label;
  ProfileField(this.label);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey[400]),
          filled: true,
          fillColor: Colors.grey[900],
        ),
      ),
    );
  }
}

class ProfilePictureUpload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        icon: const Icon(Icons.camera_alt, color: Colors.white, size: 40),
        onPressed: () {},
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String message;
  const NotificationItem(this.message);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(message, style: const TextStyle(color: Colors.white)),
      trailing:
          const Icon(Icons.notifications_active, color: Color(0xFFED254E)),
    );
  }
}
