import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cuibts/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cuibts/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return SearchView();
                    },
                  ),
                );
              },
              icon: Icon(Icons.search),
            )
          ],
        ),
        body: BlocBuilder<GetWeatherCubit, weatherStatue>(
          builder: (context, state) {
            if (state is InitialState) {
              return NoWeatherBody();
            } else if (state is WeatherLoadedStatue) {
              return WeatherInfoBody(
                WeatherModel: state.WeatherModel,
              );
            } else {
              return Text("there was an error");
            }
          },
        ));
  }
}
