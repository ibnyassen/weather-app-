import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final dio = Dio();

  final String baseUrl = 'https://api.weatherapi.com/v1';

  final String apiKey = '06d332bbc84246d4b73175018240105';
  Future<weatherModel> getCurrentWeather({required CityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$CityName&days=1');

      weatherModel Weathermodel = weatherModel.fromJson(response.data);
      return Weathermodel;
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message'] ??
          'oops there was an error,try later';
      throw Exception(errMessage);
    }
  }
}
