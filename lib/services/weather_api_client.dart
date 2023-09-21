//to start call some http request in flutter we will need the flutterhttp packqge  above
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/model/weather_model.dart';

class WeatherApiClient{
  Future<Weather>? getCurrentWeather(String? location) async{
    var endpoint = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$location&appid=a8d54d88025749d9880703f6c10b13a7&units=metric');


    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    print(Weather.fromJson(body).cityName);

    return Weather.fromJson(body);

  }
}