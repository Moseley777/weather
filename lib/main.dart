import 'package:flutter/material.dart';
import 'package:weatherapp/additional_information.dart';
import 'package:weatherapp/current_weather.dart';
import 'package:weatherapp/model/weather_model.dart';
import 'package:weatherapp/services/weather_api_client.dart';
import 'package:geolocator/geolocator.dart';



Future<void> main() async {
  // Check if location services are enabled
////LocationPermission permission = await Geolocator.checkPermission();

/*if (permission == LocationPermission.denied) {
  // Request location permissions
  permission = await Geolocator.requestPermission();
}

if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
  // Location permissions granted; you can now access the device's location
  // Example: Get the current position
  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  print("Latitude: ${position.latitude}, Longitude: ${position.longitude}");
} else {
  // Location permissions not granted
  // Handle this case accordingly
}

  */
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherApiClient client = WeatherApiClient();
  Weather? data;
  String cityName = 'Lagos'; // Default city name

  @override
  void initState() {
    super.initState();
    getData(cityName);
  }

  Future<void> getData(String cityName) async {
     print('Fetching data for $cityName');
    data = await client.getCurrentWeather(cityName);
    setState(() {}); // Trigger a rebuild after fetching new data
    print('Data fetched successfully: $data');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          'Weather App',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            // Add menu functionality here
          },
          icon: Icon(Icons.menu),
          color: Colors.greenAccent,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter city name',
                    ),
                    onChanged: (value) {
                      cityName = value;
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    getData(cityName);
                  },
                  child: Text('Get Weather'),
                ),
              ],
            ),
          ),
          if (data != null)
            Column(
              children: [
                currentWeather(
                  Icons.wb_sunny_rounded,
                  '${data!.temp}',
                  '${data!.cityName}',
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Additional information',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.black26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(),
                SizedBox(
                  height: 20.0,
                ),
                additionalInformation(
                  '${data!.wind}',
                  '${data!.humidity}',
                  '${data!.pressure}',
                  '${data!.feels_like}',
                ),
              ],
            ),
          if (data == null)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
