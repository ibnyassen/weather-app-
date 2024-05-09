import 'package:weather_app/models/weather_model.dart';

class weatherStatue {}

class InitialState extends weatherStatue {}

class WeatherLoadedStatue extends weatherStatue {
  weatherModel WeatherModel;

  WeatherLoadedStatue({required this.WeatherModel});
}

class WeatherFailureStatue extends weatherStatue {
  final String errMessage;

  WeatherFailureStatue(this.errMessage);
}
