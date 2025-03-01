import 'package:flutter/material.dart';

void main() {
  runApp(HungerHealApp());
}

class HungerHealApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HungerHeal',
      theme: ThemeData(primarySwatch: Colors.red),
      home: LoginPage(),
    );
  }
}

// =============================== LOGIN PAGE ===============================
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => FoodProviderDashboard()),
            );
          },
          child: Text("Login as Food Provider"),
        ),
      ),
    );
  }
}

// =============================== FOOD PROVIDER DASHBOARD ===============================
class FoodProviderDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food Provider Dashboard"),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FoodProviderForm()),
                );
              },
              child: Text("Add Food Listing"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ActiveListingsPage()),
                );
              },
              child: Text("View Active Listings"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
              child: Text("Manage Profile & Past Donations"),
            ),
          ],
        ),
      ),
    );
  }
}

// =============================== FOOD PROVIDER FORM ===============================
class FoodProviderForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Food Listing")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(labelText: "Food Name")),
            TextField(decoration: InputDecoration(labelText: "Food Type")),
            TextField(decoration: InputDecoration(labelText: "Expiry Date")),
            TextField(decoration: InputDecoration(labelText: "Quantity")),
            TextField(
                decoration: InputDecoration(labelText: "Pickup Location")),
            TextField(decoration: InputDecoration(labelText: "Available Time")),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to Dashboard
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}

// =============================== ACTIVE LISTINGS PAGE ===============================
class ActiveListingsPage extends StatelessWidget {
  final List<String> foodItems = ["Rice & Curry", "Pasta", "Biryani", "Pizza"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Active Food Listings")),
      body: ListView.builder(
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(foodItems[index]),
              subtitle: Text("Available for pickup/delivery"),
            ),
          );
        },
      ),
    );
  }
}

// =============================== PROFILE PAGE ===============================
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile & Past Donations")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Food Provider Profile",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            TextField(decoration: InputDecoration(labelText: "Full Name")),
            TextField(decoration: InputDecoration(labelText: "Email")),
            TextField(decoration: InputDecoration(labelText: "Phone Number")),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save profile changes
              },
              child: Text("Save Changes"),
            ),
            SizedBox(height: 30),
            Text("Past Donations",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                      title: Text("Rice & Curry"),
                      subtitle: Text("Donated on Jan 25")),
                  ListTile(
                      title: Text("Pizza"),
                      subtitle: Text("Donated on Feb 10")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
