import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: VolunteerPage(),
  ));
}

class VolunteerPage extends StatefulWidget {
  @override
  _VolunteerPageState createState() => _VolunteerPageState();
}

class _VolunteerPageState extends State<VolunteerPage> {
  List<Map<String, String>> deliveries = [
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
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: List.generate(deliveries.length, (index) {
            return buildDeliveryBox(context, index);
          }),
        ),
      ),
    );
  }

  Widget buildDeliveryBox(BuildContext context, int index) {
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
            'From: ${deliveries[index]["pickup"]}',
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text('To: ${deliveries[index]["drop"]}',
              style: const TextStyle(fontSize: 14, color: Colors.black)),
          const SizedBox(height: 5),
          Text(
            'Deliver: ${deliveries[index]["food"]}',
            style: const TextStyle(
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
                onPressed: () {
                  setState(() {
                    deliveries.removeAt(index);
                  });
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('Deny'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MapPage(deliveries[index]["drop"] ?? ""),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: const Text('Get Directions'),
              ),
            ],
          ),
        ],
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
          children: const [
            Text(
              'Hurray!',
              style: TextStyle(
                color: Color(0xFFED254E),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Let's start the journey of giving",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class MapPage extends StatefulWidget {
  final String destination;
  MapPage(this.destination);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late MapController mapController;

  @override
  void initState() {
    super.initState();
    mapController = MapController.withUserPosition();
  }

  void showDirections() async {
    try {
      await mapController.currentLocation();
      GeoPoint userLocation = await mapController.myLocation();
      GeoPoint destinationPoint =
          GeoPoint(latitude: 13.0827, longitude: 80.2707); // Example coordinates

      await mapController.addMarker(destinationPoint);
      await mapController.drawRoad(
        userLocation,
        destinationPoint,
        roadType: RoadType.car,
        roadOption: const RoadOption(
          roadWidth: 10,
          roadColor: Colors.blue,
        ),
      );
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map - ${widget.destination}"),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          OSMFlutter(
            controller: mapController,
            osmOption: OSMOption(
              zoomOption: ZoomOption(
                initZoom: 12,
                minZoomLevel: 4,
                maxZoomLevel: 19,
              ),
              userLocationMarker: UserLocationMaker(
                personMarker: MarkerIcon(
                  icon: Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 48,
                  ),
                ),
                directionArrowMarker: MarkerIcon(
                  icon: Icon(
                    Icons.navigation,
                    color: Colors.blue,
                    size: 48,
                  ),
                ),
              ),
            ),
            mapIsLoading: const Center(
              child: CircularProgressIndicator(),
            ),
            onMapIsReady: (isReady) {
              if (isReady) {
                print("Map is ready! ✅");
              }
            },
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: showDirections,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text("Show Directions"),
            ),
          ),
        ],
      ),
    );
  }
}
