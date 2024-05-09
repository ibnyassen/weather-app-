import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cuibts/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/views/search_view.dart';

class GetWeatherCubit extends Cubit<weatherStatue> {
  GetWeatherCubit() : super(InitialState());

  getWeather({required String CityName}) async {
    try {
      weatherModel WeatherModel =
          await WeatherService().getCurrentWeather(CityName: CityName);
      emit(WeatherLoadedStatue(WeatherModel: WeatherModel));
    } catch (e) {
      emit(WeatherFailureStatue(e.toString()));
    }
  }
}
