import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:math';
class FoodRecipientPage extends StatefulWidget {
  @override
  _FoodRecipientPageState createState() => _FoodRecipientPageState();
}

class _FoodRecipientPageState extends State<FoodRecipientPage> {
  final Color tomatoRed = Color(0xFFD72D42);
  String userLocation = "Fetching location...";
  List<String> nearbyLocations = [];
  List<Map<String, String>> cart = [];

  final Map<String, List<double>> locations = {
    "Tambaram": [12.9249, 80.1275],
    "Porur": [13.0361, 80.1588],
    "Ramapuram": [13.0331, 80.1860],
    "Velachery": [12.9784, 80.2186],
    "Avadi": [13.1148, 80.1095],
    "Anna Nagar": [13.0878, 80.2105],
    "Chrompet": [12.9504, 80.1411],
    "Pallavaram": [12.9678, 80.1492]
  };

  List<Map<String, String>> orders = [
    {"food": "Rice & Curry", "location": "Avadi", "address": "123 Avadi Main Road", "type": "Vegetarian", "capacity": "Serves 3", "prepared": "Today 12:00 PM", "delivery": "Pickup", "provider": "John Doe", "organization": "Helping Hands"},
    {"food": "Bread & Soup", "location": "Porur", "address": "456 Porur Street", "type": "Vegetarian", "capacity": "Serves 2", "prepared": "Today 1:00 PM", "delivery": "Pickup", "provider": "Alex Smith", "organization": "Food Bank"},
    {"food": "Dosa & Sambar", "location": "Ramapuram", "address": "789 Ramapuram Lane", "type": "Vegetarian", "capacity": "Serves 4", "prepared": "Today 2:00 PM", "delivery": "Pickup", "provider": "Emma Watson", "organization": "Community Care"},
    {"food": "Idly & Chutney", "location": "Velachery", "address": "101 Velachery Road", "type": "Vegetarian", "capacity": "Serves 3", "prepared": "Today 8:00 AM", "delivery": "Pickup", "provider": "Mike Johnson", "organization": "Food Relief"},
    {"food": "Pongal & Vada", "location": "Chrompet", "address": "222 Chrompet Crossroad", "type": "Vegetarian", "capacity": "Serves 2", "prepared": "Today 10:00 AM", "delivery": "Pickup", "provider": "Sarah Lee", "organization": "Hunger Help"},
    {"food": "Chapati & Kurma", "location": "Tambaram", "address": "333 Tambaram Main Road", "type": "Vegetarian", "capacity": "Serves 3", "prepared": "Today 7:30 AM", "delivery": "Pickup", "provider": "David Kumar", "organization": "Good Eats"}
  ];

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<String> nearestLocations = _getNearestLocations(position.latitude, position.longitude);

    setState(() {
      userLocation = nearestLocations.isNotEmpty ? nearestLocations.first : "Unknown";
      nearbyLocations = nearestLocations;
    });
  }

  List<String> _getNearestLocations(double latitude, double longitude) {
    List<MapEntry<String, double>> distances = locations.entries.map((entry) {
      double distance = _calculateDistance(latitude, longitude, entry.value[0], entry.value[1]);
      return MapEntry(entry.key, distance);
    }).toList();

    distances.sort((a, b) => a.value.compareTo(b.value));

    return distances.map((entry) => entry.key).toList();
  }

  double _calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const double p = 0.017453292519943295; // Pi/180
    //const double c = cos;
    double a = 0.5 - cos((lat2 - lat1) * p) / 2 + 
               cos(lat1 * p) * cos(lat2 * p) * 
               (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a)); // 2 * R; R = 6371 km
  }

  void _confirmOrder(Map<String, String> order) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Confirm Order"),
          content: Text("Are you sure you want to add ${order['food']} to your cart?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  cart.add(order);
                });
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context) => movingbikemap()));
              },
              child: Text("Confirm"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> recommendedOrders = orders.where((order) => nearbyLocations.contains(order["location"])).toList();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Food Orders", style: TextStyle(color: Colors.white)),
        backgroundColor: tomatoRed,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Recommended", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: recommendedOrders.length,
              itemBuilder: (context, index) {
                return Card(
                  color: tomatoRed,
                  child: ListTile(
                    title: Text(recommendedOrders[index]["food"]!, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    subtitle: Text("Location: ${recommendedOrders[index]["location"]}, ${recommendedOrders[index]["address"]}", style: TextStyle(color: Colors.white)),
                    trailing: TextButton(
                      onPressed: () => _confirmOrder(recommendedOrders[index]),
                      child: Text("Add to Cart", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class movingbikemap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Moving Bike Map"),
      ),
      body: Center(
        child: Text("Map showing the moving bike will be displayed here."),
      ),
    );
  }
}
