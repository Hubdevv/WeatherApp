import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/models.dart';

class DataService {
    Future<WeatherResponse> getWeather(String city) async {
//https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
    final queryParameters = {
      'q': city,
      'appid': 'e7576d89efe01d00f1fa9c8c2cfbd0b5'
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);
    print(response.body);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}
